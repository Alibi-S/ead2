<%@ page import="java.sql.*" %>
<%@ page import="product.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.Product" %>
<%@ page import="users.UserAdmin" %>
<%@ page import="users.User" %><%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 01.04.2021
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products info</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%! static int counter = 0;%>
<%--Comments --%>
<%
    User user = (User) session.getAttribute("user");
    if (!(user instanceof UserAdmin)){
%>
<jsp:forward page="/error_page.jsp" >
    <jsp:param name="err" value="1" />
</jsp:forward>
<%
    }

    counter++;

    out.println("<p>You are on this page for the " + counter + " time</p>");
    try {
        Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    try {
        connection = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/WeaponShop",
                "postgres",
                "1234"
        );
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    ArrayList<Product> products = new ArrayList<>();

    try (Statement stmt = connection.createStatement()) {
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM products;");
            while (rs.next()) {
                Product newProduct = new Product(
                        Integer.parseInt(rs.getString("product_id")),
                        rs.getString("product_name"),
                        Double.parseDouble(rs.getString("product_price")),
                        rs.getString("product_desc"),
                        Integer.parseInt(rs.getString("product_quantity"))
                );

                products.add(newProduct);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    if(products.size() != 0){

%>

<h2>Products Information: </h2>
<table style="border: 1px solid black;">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>description</th>
        <th>quantity</th>
        <th>price</th>
    </tr>

<%
      for (Product p: products){
          out.println("<tr>");
            out.println("<td>" + p.getProduct_id() + "</td>");
            out.println("<td>" + p.getProduct_name() + "</td>");
            out.println("<td>" + p.getProduct_desc() + "</td>");
            out.println("<td>" + p.getProduct_quantity() + "</td>");
            out.println("<td>" + p.getProduct_price() + "</td>");
          out.println("</tr>");
      }
    }
%>

</table>

</body>
</html>
