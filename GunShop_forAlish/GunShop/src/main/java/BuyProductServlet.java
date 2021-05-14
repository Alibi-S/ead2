import product.Product;
import users.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/make-order")
public class BuyProductServlet extends javax.servlet.http.HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        Product product = null;
        boolean transactionCheck = false;
        double beforeTransactionBalance = user.getBalance();

        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/WeaponShop",
                    "postgres",
                    "1234"
            );

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE product_id = " + Integer.parseInt(req.getParameter("product_id")) + " ;");

            while (rs.next()) {
                product = new Product(
                        Integer.parseInt(rs.getString("product_id")),
                        rs.getString("product_name"),
                        Double.parseDouble(rs.getString("product_price")),
                        rs.getString("product_desc"),
                        Integer.parseInt(rs.getString("product_quantity"))
                );
            }

                //System.out.println("после селекта");
//            product = new Product(
//                    Integer.parseInt(rs.getString("product_id")),
//                    rs.getString("product_name"),
//                    Double.parseDouble(rs.getString("product_price")),
//                    rs.getString("product_desc"),
//                    Integer.parseInt(rs.getString("product_quantity"))
//                    );

            System.out.println("Product : " + product.getProduct_name() +  " " + product.getProduct_id());


            int rows = 0;
            if (user.getBalance() >= product.getProduct_price()) {
                double afterTransactionBalance = user.getBalance()-product.getProduct_price();
                System.out.println("After transaction balance : " + afterTransactionBalance);
                PreparedStatement stmt2 = connection.prepareStatement("UPDATE users SET user_balance=" + afterTransactionBalance + " WHERE user_id = " + user.getId() + " ;");
                rows = stmt2.executeUpdate();

                user.setBalance(afterTransactionBalance);
                session.setAttribute("user", user);

                //getServletContext().getRequestDispatcher("/admin.jsp").forward(req, resp);

            }
            if (rows>0) {
                transactionCheck = true;
                rows = 0;
                Statement statementInsertOrder = connection.createStatement();
                rows = statementInsertOrder.executeUpdate("INSERT INTO orders (user_id, proudct_id, user_login, product_name) " +
                        "VALUES (" + user.getId() + " , " + product.getProduct_id() + " , '" + user.getLogin() + "' , '" + product.getProduct_name() + "');");

                if(rows > 0)
                    System.out.println("Order inserted");
            }

            System.out.println("Transaction check : " + transactionCheck);




        } catch ( ClassNotFoundException | SQLException e) {
            System.out.println("Error | catch");
            e.printStackTrace();

        }


        pw.println("<html>");

        pw.println("<h2> User: " + user.getLogin() + " | Balance : \n" +
                "<br> before transaction : " + beforeTransactionBalance + "</h2>");
        if (transactionCheck) {
            pw.println("<h2><br> after transaction : " + (beforeTransactionBalance - product.getProduct_price()) + "</h2>");
        }
        pw.println("<h3> Product: " + product.getProduct_name() + "</h3>");
        pw.println("<p> Description: " + product.getProduct_desc() + "</p>");
        pw.println("<h3 style=\"color: red;\"> Product: " + product.getProduct_price() + "</p>");

        pw.println("<br><br>");
        if(transactionCheck) {
            pw.println("<dir style=\"background-color: lightgreen;\"><h3>Thank you! Order made successfully</h3></dir>");
        } else {
            pw.println("<dir style=\"background-color: tomato\"><h3>There are not enough funds on your balance. Order cancelled.</h3></dir>");
        }

        pw.println("<br><br><h4><a href=\"/products\">Products</a></h4>");
        pw.println("<h4><a href=\"/mainPage\">Exit</a></h4>");
        pw.println("</html>");



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
