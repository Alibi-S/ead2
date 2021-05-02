import config.ConnectionDB;
import model.product.Order;
import model.users.User;
import model.users.UserAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User usr = (User) session.getAttribute("user");
        if(usr instanceof UserAdmin){
            try {
                Connection connection = ConnectionDB.getConnection();

                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM orders;");

                ArrayList<Order> orders = new ArrayList<>();
                while (rs.next()) {
                    int orderId = Integer.parseInt(rs.getString("order_id"));
                    int userId = Integer.parseInt(rs.getString("user_id"));
                    int productId = Integer.parseInt(rs.getString("proudct_id"));
                    String userLogin = rs.getString("user_login");
                    String productName = rs.getString("product_name");

                    orders.add(new Order(orderId, userId, productId, userLogin, productName));
                }

                session.setAttribute("orderList", orders);

                getServletContext().getRequestDispatcher("/admin.jsp").forward(req, resp);

            } catch (SQLException e) {
                e.printStackTrace();
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
