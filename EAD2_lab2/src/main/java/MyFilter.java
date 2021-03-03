import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

public class MyFilter implements Filter{
    static int count=0;
    public void init(FilterConfig arg0) throws ServletException {
        System.out.println("init Filter ----");
    }

    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {

        System.out.println("dodododod Filter ----");

        res.getWriter().write("BEFORE FILTER ----");

        PrintWriter out=res.getWriter();
        long before=System.currentTimeMillis();


        chain.doFilter(req,res);

        long after=System.currentTimeMillis();

        chain.doFilter(req, res);

        //res.getWriter().write();

        res.getWriter().write("<br/>Total response time "+(after-before)+" miliseconds");

        res.getWriter().write("AFTER FILTER ----");

        out.close();
    }
    public void destroy() {
        System.out.println("destroy Filter ----");
    }
}