<%@ page import="com.store.servlet.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.store.servlet.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
<body>
    <div class='container'>
        <div class='row'>
            <h2>Products</h2>
            <%
                User usr = (User) session.getAttribute("user");
                ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
            %>

            <h4>Balance: <%= usr.getBalance() %></h4>

            <p><jsp:include page="nav.jsp" /></p>

            <hr>
            <%
                for (Product p: products) {
                    out.println("<div class='col-sm-4' style='margin: 5px; border-style: dotted; '>");
                    out.println("<form action=\'/make-order\'>");
                    out.println("<h3>" + p.getProduct_name() + "</h3>");
                    out.println("<p>Description: " + p.getProduct_desc() + "</p>");
                    out.println("<p>Quantity: " + p.getProduct_quantity() + "</p>");
                    out.println("<p>Price: " + p.getProduct_price() + "$</p>");
                    out.println("<button style='width: 50%;' name=\"product_id\" type=\"submit\" value=\"" + p.getProduct_id() + "\">Get</button>");
                    out.println("<form>");
                    //out.println("<br><hr><br>");
                    out.println("</div>");
                }
            %>

        </div>
    </div>
</body>
</html>
