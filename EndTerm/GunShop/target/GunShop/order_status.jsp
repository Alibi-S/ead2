<%@ page import="model.users.User" %>
<%@ page import="model.product.Product" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 29.04.2021
  Time: 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        User: <%= user.getLogin() %> <br>
        Balance now: <%= user.getBalance() %> <br>
        Before transaction: <%= beforeTransactionBalance %>
    </h2>
    <hr>
<%
    out.println("<h3> Product: " + product.getProduct_name() + "</h3>");
    out.println("<p> Description: " + product.getProduct_desc() + "</p>");
    out.println("<h3 style=\"color: red;\"> Product: " + product.getProduct_price() + "</p>");

    out.println("<br><br>");
    if(transactionCheck) {
        out.println("<dir style=\"background-color: lightgreen;\"><h3>Thank you! Order made successfully</h3></dir>");
    } else {
        out.println("<dir style=\"background-color: tomato\"><h3>There are not enough funds on your balance. Order cancelled.</h3></dir>");
    }
%>
<p><jsp:include page="nav.jsp" /></p>

</body>
</html>


