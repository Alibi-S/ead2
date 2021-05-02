<%@ page import="model.users.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.product.Product" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 28.04.2021
  Time: 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h2>Products</h2>
    <hr>
    <%
        User usr = (User) session.getAttribute("user");
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
    %>

    <h3>Login: <%= usr.getLogin() %></h3>
    <h4>Balance: <%= usr.getBalance() %></h4>
    <hr>

    <%
        for (Product p: products) {
            out.println("<form action=\'/make-order\'>");
            out.println("<h3>" + p.getProduct_name() + "</h3>");
            out.println("<p>" + p.getProduct_desc() + "</p>");
            out.println("<p>Quantity: " + p.getProduct_quantity() + "</p>");
            out.println("<p style=\"color: red;\">Price: " + p.getProduct_price() + "$</p>");
            out.println("<button name=\"product_id\" type=\"submit\" value=\"" + p.getProduct_id() + "\">BUY</button>");
            out.println("<form>");
            out.println("<br><hr><br>");
        }
    %>

    <hr>
    <p><jsp:include page="nav.jsp" /></p>

</body>
</html>
