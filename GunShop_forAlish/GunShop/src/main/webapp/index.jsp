<html>
<body>
    <h2>MAIN PAGE</h2>

    <%@ page import="users.User" %>
    <%@ page import="users.UserAdmin" %>
    <%
        User usr = (User) session.getAttribute("user");
        if(usr == null){
            out.println("<a href=\"auth.jsp\">Log in</a>");
            out.println("<br><a href=\"registration.jsp\">Registration</a>");
        } else if(usr instanceof UserAdmin) {
            out.println("<br><br><h1 style=\"color: red;\">Hello admin, " + usr.getLogin() + "!</h1>");
            out.println("<a href=\"/products\">Products</a>");
            out.println("<a href=\"/mainPage\">Exit</a>");
        } else {
            out.println("<br><br><h1 style=\"color: blue;\">Hello user, " + usr.getLogin() + "!</h1>");
            out.println("<a href=\"/products\">Products</a>");
            out.println("<a href=\"/mainPage\">Exit</a>");
        }
    %>

        <dir style="background-color: tomato">

    </dir>
</body>
</html>
