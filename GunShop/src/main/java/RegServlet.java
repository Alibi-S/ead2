import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


@WebServlet("/registration")
public class RegServlet extends javax.servlet.http.HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");

        if(!password.equals(password2)){
            resp.sendRedirect("/registration.jsp");
        } else {
            try {
                Class.forName("org.postgresql.Driver");
                Connection connection = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/WeaponShop",
                        "postgres",
                        "1234"
                );

                int rows = 0;
                Statement statementInsertOrder = connection.createStatement();
                rows = statementInsertOrder.executeUpdate("INSERT INTO users (user_login, user_password, user_balance) " +
                        "VALUES ('" + login + "' , '" + password + "' , " + 10000 + ");");

                if(rows > 0) {
                    System.out.println("Product created");


                }

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/mypage").include(req,resp);
    }
}
