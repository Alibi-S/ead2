import product.Product;
import users.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/products")
public class AllProductsServlet extends javax.servlet.http.HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        HttpSession session = req.getSession();

        User usr = (User) session.getAttribute("user");
        if(usr == null){
            resp.sendRedirect("/auth.jsp");
        }

        pw.println("<html>");

        pw.println("<h1 style=\"color: blue;\">Products: </h1>");
        pw.println("<a href=\"/mypage\">Main page</a>");

        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("первый трай");
            try {
                System.out.println("второй трай");
                Connection connection = null;
                try {
                    System.out.println("третий трай");
                    connection = DriverManager.getConnection(
                            "jdbc:postgresql://localhost:5432/WeaponShop",
                            "postgres",
                            "1234"
                    );

                    Statement stmt;
                    ResultSet rs = null;
                    ArrayList<Product> products = new ArrayList<>();

                    try {
                        stmt = connection.createStatement();
                        if(stmt != null)
                            rs = stmt.executeQuery("SELECT * FROM products");

//                        pw.println("<h1>" + (rs != null ? (String) rs.getString("product_name") : "null") + "</h1>");

                        while (rs.next()){
                            System.out.println("внутри вайла");
                            Product newProduct = new Product(
                                    Integer.parseInt(rs.getString("product_id")),
                                    rs.getString("product_name"),
                                    Double.parseDouble(rs.getString("product_price")),
                                    rs.getString("product_desc"),
                                    Integer.parseInt(rs.getString("product_quantity")));
//                            products.add(new Product(Integer.parseInt(rs.getString("product_id")), rs.getString("product_name"), rs.getString("product_description"), Integer.parseInt(rs.getString("product_quantity"))));

                            products.add(newProduct);
                        }

                        for(Product p: products){
                            System.out.println("внутри фора");
                            pw.println("<form action=\'/make-order\'>");
                            pw.println("<h3>" + p.getProduct_name() + "</h3>");
                            pw.println("<p>" + p.getProduct_desc() + "</p>");
                            pw.println("<p>Quantity: " + p.getProduct_quantity() + "</p>");
                            pw.println("<p style=\"color: red;\">Price: " + p.getProduct_price() + "$</p>");
                            pw.println("<button name=\"product_id\" type=\"submit\" value=\"" + p.getProduct_id() + "\">BUY</button>");
                            pw.println("<form>");
                            pw.println("<br><hr><br>");
                        }

                    } catch (SQLException throwables) {
                        System.out.println( "первый кетч");
                        throwables.printStackTrace();
                    }
                } catch (SQLException throwables) {
                    System.out.println("второй кетч");
                    throwables.printStackTrace();
                }
            } catch (NumberFormatException e) {
                System.out.println("третий кетч");
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("четверый кетч");
            e.printStackTrace();
        }



        pw.println("</html>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }


}
