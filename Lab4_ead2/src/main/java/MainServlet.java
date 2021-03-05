import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/index")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie ck[] = req.getCookies();

        if(ck != null && (!ck[0].getValue().equals("") || ck[0].getValue() != null))
            req.getRequestDispatcher("index.jsp").include(req, resp);
        else
            req.getRequestDispatcher("login.jsp").include(req, resp);
    }
}
