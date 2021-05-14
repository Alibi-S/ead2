<%@ page import="com.store.servlet.models.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h1>Admin</h1>
    <h2>Add New Weapon</h2>
    <form action="/addNewProduct">
        <label>Product name</label>
        <input type="text" name="product_name">
        <br>
        <label>Description</label>
        <input type="text" name="product_desc">
        <br>
        <label>Quantity</label>
        <input type="text" name="product_quantity">
        <br>
        <label>Price</label>
        <input type="text" name="product_price">
        <br>
        <input type="submit">
    </form>

    <h2>User's order list: </h2>
    <br>
    <table border="1">
        <tr>
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
    <p><jsp:include page="nav.jsp" /></p>

</body>
</html>
