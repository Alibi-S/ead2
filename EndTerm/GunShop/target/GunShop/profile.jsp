<%@ page import="model.users.User" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 28.04.2021
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <%
            User user = (User) session.getAttribute("user");
            out.println(user.getLogin());
        %>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>

    <h2>User Info</h2>
    <h4>Login: <% out.println(user.getLogin()); %></h4>
    <h4>Balance: <% out.println(user.getBalance()); %></h4>
    <h4>User ID: <% out.println(user.getId()); %></h4>

<%--    <a href="/products">Products</a>--%>
<%--    <a href="/my_orders">My orders</a>--%>
<%--    <a href="/mypage">Exit</a>--%>

<p><jsp:include page="nav.jsp" /></p>

</body>
</html>
