<%@ page import="product.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 16.03.2021
  Time: 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
    <h1>Admin page</h1>
    <hr>

    <h2>Add New Product</h2>
    <form action="/addNewProduct">
        <label>Product name</label>
        <input type="text" name="product_name">

        <label>Description</label>
        <input type="text" name="product_desc">

        <label>Quantity</label>
        <input type="text" name="product_quantity">

        <label>Price</label>
        <input type="text" name="product_price">

        <input type="submit">
    </form>

    <hr>
    <h2>Order list: </h2>
    <br>
    <table border="1">
        <tr style="background-color: lightblue">
            <th>Order id</th>
            <th>User id</th>
            <th>Product id</th>
            <th>User login</th>
            <th>Product</th>
        </tr>
    <%
        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("orderList");

        for (Order o: orders) {
            out.println("<tr>");
            out.println("<td>" + o.getOrderId() + "</td>");
            out.println("<td>" + o.getUserId() + "</td>");
            out.println("<td>" + o.getProductId()+ "</td>");
            out.println("<td>" + o.getUserLogin() + "</td>");
            out.println("<td>" + o.getProductName() + "</td>");
            out.println("</tr>");
        }
    %>
    </table>

    <br><br>
    <a href="/products">Products</a><br>
    <a href="/mainPage">Exit</a>

</body>
</html>
