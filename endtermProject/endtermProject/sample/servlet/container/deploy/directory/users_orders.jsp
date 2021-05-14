<%@ page import="java.util.ArrayList" %>
<%@ page import="com.store.servlet.models.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User's Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <table style="border: 1px solid black">
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

    <br><br>

    <p><jsp:include page="nav.jsp" /></p>

</body>
</html>
