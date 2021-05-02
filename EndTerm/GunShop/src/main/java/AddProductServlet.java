import config.ConnectionDB;
import exception.IncorrectNumberException;
import model.product.Product;
import model.users.User;
import model.users.UserAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

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

                //Handler check price and quantity
                if (product.getProduct_quantity() <= 0 || product.getProduct_price() <= 0) {
                    throw new IncorrectNumberException("Incorrect number, bro. Please change it.");
                }

                try {
                    Connection connection = ConnectionDB.getConnection();

                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO products(product_name, product_desc, product_quantity, product_price) VALUES (?, ?, " + product.getProduct_quantity() + ", " + product.getProduct_price() + ");");
                    preparedStatement.setString(1, product.getProduct_name());
                    preparedStatement.setString(2, product.getProduct_desc());
                    int rows = 0;
                    rows = preparedStatement.executeUpdate();

                    if (rows > 0){
                        System.out.println("Product created");
                        session.setAttribute("CreatedProduct", product);
                    }

                    getServletContext().getRequestDispatcher("/productCreated.jsp").forward(req, resp);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                    getServletContext().getRequestDispatcher("/admin").forward(req, resp);
                }
            }
        } else {
            getServletContext().getRequestDispatcher("/profile").forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
