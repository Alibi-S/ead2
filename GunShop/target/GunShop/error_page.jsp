<%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 02.04.2021
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <%
        String err = request.getParameter("err");
        if (err.equals("1"))
            out.println("<h2>Sorry, this page is only available to admins</h2>");
        else if (err.equals("2"))
            out.println("<h2>Sorry, you must log in</h2>");

    %>
</body>
</html>
