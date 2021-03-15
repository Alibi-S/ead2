import users.User;
import users.UserAdmin;
import users.UserJust;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/mypage")
    public class ResultServlet extends javax.servlet.http.HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String login = req.getParameter("login");
        String password = req.getParameter("password");

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
            ResultSet rs = stmt.executeQuery("SELECT * FROM USERS WHERE user_login like '" + login + "'");

            User user = null;

            while (rs.next()){
                if(login.equals("Admin")){
                    user = new UserAdmin(
                            Integer.parseInt(rs.getString("user_id")),
                            rs.getString("user_login"),
                            rs.getString("user_password"),
                            Double.parseDouble(rs.getString("user_balance")));
                } else {
                    user = new UserJust(
                            Integer.parseInt(rs.getString("user_id")),
                            rs.getString("user_login"),
                            rs.getString("user_password"),
                            Double.parseDouble(rs.getString("user_balance")));
                }
            }

            if(user != null){
                if(password.equals(user.getPassword())){
                    session.setAttribute("user", user);
                    getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
                }
            }
            resp.sendRedirect("/auth.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

//
//        pw.println("<html>");
//
//
//        if (login.equals("Admin") && password != null && !password.equals("")){
//
//            User usr = new UserAdmin(login, password);
//
//            session.setAttribute("user", usr);
////            User usrNew = (User) session.getAttribute("user");
////            pw.println("<h1 style=\"color: red;\">" + usrNew.getLogin() + "</h1>");
//
//            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
//        } else {
//            User usr = new UserJust(login, password);
//
//            session.setAttribute("user", usr);
//            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
//        }
//        pw.println("</html>");

    }
}
