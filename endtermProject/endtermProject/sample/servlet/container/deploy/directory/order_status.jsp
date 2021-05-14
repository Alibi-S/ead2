<%@ page import="com.store.servlet.models.User" %>
<%@ page import="com.store.servlet.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>

        <%
            User user = (User) session.getAttribute("user");
            Product product = (Product) session.getAttribute("product");

            double beforeTransactionBalance = (double) session.getAttribute("beforeTransactionBalance");
            boolean transactionCheck = (boolean) session.getAttribute("transactionCheck");
        %>

        <h2>
            <%= user.getLogin() %> <br>
            Balance: <%= beforeTransactionBalance %>
        </h2>
        <hr>
        <%
            out.println("<p> Product: " + product.getProduct_name() + "</p>");
            out.println("<p> Description: " + product.getProduct_desc() + "</p>");
            out.println("<p> Price: " + product.getProduct_price() + "</p>");
            out.println("<br>");
            if (transactionCheck) {
                out.println("<h2>Success</h2>");
            } else {
                out.println("<h2>Not enough money</h2>");
            }
        %>
        <br>
        <p><jsp:include page="nav.jsp" /></p>

    </body>
</html>


