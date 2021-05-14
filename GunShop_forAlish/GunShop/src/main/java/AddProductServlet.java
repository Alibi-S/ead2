import product.Product;
import users.User;
import users.UserAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/addNewProduct")
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User usr = (User) session.getAttribute("user");
        if (usr instanceof UserAdmin) {
            String productName = req.getParameter("product_name");
            String productDesc = req.getParameter("product_desc");
            String productQuantity = req.getParameter("product_quantity");
            String productPrice = req.getParameter("product_price");

            if((productName != null && !productName.equals("")) &&
                    (productDesc != null && !productDesc.equals("")) &&
                    (productQuantity != null && !productQuantity.equals("")) &&
                    (productPrice != null && !productPrice.equals(""))) {
                Product product = new Product(productName, Double.parseDouble(productPrice), productDesc, Integer.parseInt(productQuantity));

                try {
                    Class.forName("org.postgresql.Driver");
                    Connection connection = DriverManager.getConnection(
                            "jdbc:postgresql://localhost:5432/WeaponShop",
                            "postgres",
                            "1234"
                    );


                    int rows = 0;
                    Statement statementInsertOrder = connection.createStatement();
                    rows = statementInsertOrder.executeUpdate("INSERT INTO products(product_name, product_desc, product_quantity, product_price) " +
                            "VALUES ('" + product.getProduct_name() + "' , '" + product.getProduct_desc() + "' , " + product.getProduct_quantity() + " , " + product.getProduct_price() + ");");

                    if (rows > 0){
                        System.out.println("Product created");
                        session.setAttribute("CreatedProduct", product);

                        getServletContext().getRequestDispatcher("/productCreated.jsp").forward(req, resp);
                    } else {
                        getServletContext().getRequestDispatcher("/productCreated.jsp").forward(req, resp);
                    }

                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }

            }

        } else {
            getServletContext().getRequestDispatcher("/mypage").forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
