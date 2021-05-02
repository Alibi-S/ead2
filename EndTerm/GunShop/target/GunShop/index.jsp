<html>
<head>
    <title>GunShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h2>Gun Shop</h2>
    <ul class="nav nav-pills nav-fill">
    <%@ page import="model.users.User" %>
    <%@ page import="model.users.UserAdmin" %>
    <%
        User usr = (User) session.getAttribute("user");
        if(usr == null){
            out.println("<li class=\"nav-item\">\n" +
                    "           <a class=\"nav-link active\" aria-current=\"page\" href=\"auth.jsp\">Log in</a></li>");
            out.println("<li class=\"nav-item\">\n" +
                    "            <a class=\"nav-link active\" aria-current=\"page\" href=\"registration.jsp\">Registration</a></li>");
        } else if(usr instanceof UserAdmin) {
            out.println("<li class=\"nav-item\"><a class=\"nav-link disabled\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">Admin: " + usr.getLogin() + "</a></li>");
            out.println("<li class=\"nav-item\">\n" +
                    "            <a class=\"nav-link active\" aria-current=\"page\" <a href=\"/products\">Products</a></li>");
            out.println("<li class=\"nav-item\">\n" +
                    "            <a class=\"nav-link active\" aria-current=\"page\" href=\"/mainPage\">Exit</a></li>");
        } else {
            out.println("<li class=\"nav-item\"><a class=\"nav-link disabled\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">User: " + usr.getLogin() + "</a></li>");
            out.println("<li class=\"nav-item\">\n" +
                    "            <a class=\"nav-link active\" aria-current=\"page\" href=\"/products\">Products</a></li>");
            out.println("<li class=\"nav-item\">\n" +
                    "            <a class=\"nav-link active\" aria-current=\"page\" href=\"/mainPage\">Exit</a></li>");
        }
    %>
    </ul>
</body>
</html>
