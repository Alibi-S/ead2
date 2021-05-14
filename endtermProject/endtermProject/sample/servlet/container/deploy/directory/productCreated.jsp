<%@ page import="com.store.servlet.models.Product" %>
<%@ page import="com.store.servlet.models.User" %>
<%@ page import="com.store.servlet.models.UserAdmin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h1>Weapon added</h1>
    <%
        Product product = (Product) session.getAttribute("CreatedProduct");
        User usr = (User) session.getAttribute("user");

        if(product != null && usr != null && usr instanceof UserAdmin){
            out.println("<h2> Product name: " + product.getProduct_name() + "</h2>");
            out.println("<h2> Description: " + product.getProduct_desc() + "</h2>");
            out.println("<h2> Price: " + product.getProduct_price() + "</h2>");
            out.println("<h2> Quantity: " + product.getProduct_quantity() + "</h2>");
        }
    %>

    <br>
    <p><jsp:include page="nav.jsp" /></p>


</body>
</html>
