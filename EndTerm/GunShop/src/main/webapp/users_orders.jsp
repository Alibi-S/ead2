<%@ page import="java.util.ArrayList" %>
<%@ page import="model.product.Order" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 29.04.2021
  Time: 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <table>
        <tr>
            <th>Order id</th>
            <th>Product id</th>
            <th>Product name</th>
        </tr>
    <%
        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("users_orders");
        for (Order order: orders) {
            out.println("<tr>");
                out.println("<td>" + order.getOrderId() + "</td>");
                out.println("<td>" + order.getProductId() + "</td>");
                out.println("<td>" + order.getProductName() + "</td>");
            out.println("</tr>");
        }
    %>
    </table>
    <p><jsp:include page="nav.jsp" /></p>

</body>
</html>
