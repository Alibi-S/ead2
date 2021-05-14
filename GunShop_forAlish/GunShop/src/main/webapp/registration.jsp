<%@ page import="users.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<h1>Registration</h1>

<form action="/registration">
    <%@ page import="javax.servlet.http.HttpServlet" %>

    <%!
        private HttpServletResponse resp;
    %><%
        User usr = (User) session.getAttribute("user");
        if(usr == null){
    %>

    <label>Login</label>
    <input type="text" name="login">
    <br>
    <label>Password</label>
    <input type="text" name="password">
    <br>
    <label>Repeat password</label>
    <input type="text" name="password2">
    <br><br>

    <input type="submit">

    <%
        } else {
            out.println("<h2>You are already logged in.</h2><br>");
            out.println("<a href=\"/mypage\">Back</a><br>");
            out.println("<a href=\"/mainPage\">Exit</a>");
        }
    %>
</form>
</body>
</html>
