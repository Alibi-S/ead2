import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/dbshow")
public class TestDBServlet extends javax.servlet.http.HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/WeaponShop",
                    "postgres",
                    "1234"
            );

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM USERS");

            ArrayList<String> logins = new ArrayList<>();
            pw.println("<html>");

            while (rs.next()){
                pw.println("<h3>" + String.format(rs.getString("user_login"))  + " - " + String.format(rs.getString("user_password")) + "</h3>");
                logins.add(String.format(rs.getString("user_login")));
            }

            pw.println("<hr>");

            for(String s: logins) {
                pw.println("<h3>" + s + "</h3>");
            }


            pw.println("</html>");
            stmt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
