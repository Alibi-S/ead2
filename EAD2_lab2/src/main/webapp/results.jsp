<%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 14.02.2021
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Results</title>
</head>
<body>
    <a href="main">Main</a>
    <br>
    <%

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        out.println(username);
        out.println("<br>");
        out.println(password);
        out.println("<br>");
        out.println(confirmPassword);
        out.println("<br>");
    %>
</body>
</html>
