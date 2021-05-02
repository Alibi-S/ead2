<%@ page import="model.product.Product" %>
<%@ page import="model.users.User" %>
<%@ page import="model.users.UserAdmin" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 16.03.2021
  Time: 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h1>Result of creating model.product</h1>

    <%
        Product model.product = (Product) session.getAttribute("CreatedProduct");
        User usr = (User) session.getAttribute("user");

        if(product != null && usr != null && usr instanceof UserAdmin){
            out.println("<h3> Product name: " + product.getProduct_name() + "</h3>");
            out.println("<h4> Description: " + product.getProduct_desc() + "</h4>");
            out.println("<h3> Price: " + product.getProduct_price() + "</h3>");
            out.println("<h3> Quantity: " + product.getProduct_quantity() + "</h3>");
        }
    %>

    <br><br>
    <a href="/products">Products</a><br>
    <a href="/admin">Admin</a><br>
    <a href="/mainPage">Exit</a>

</body>
</html>
