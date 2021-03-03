import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        req.setAttribute("username", username);
        req.setAttribute("password", password);
        resp.getWriter().write(req.getParameter("username"));
        //req.getRequestDispatcher("results.jsp").forward(req, resp);

        String path = "/results.jsp";
        javax.servlet.ServletContext servletContext = getServletContext();
        javax.servlet.RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(path);
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("Login.jsp").forward(req, resp);
    }
}
