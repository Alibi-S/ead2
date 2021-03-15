<%--
  Created by IntelliJ IDEA.
  User: Alibi
  Date: 13.03.2021
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
</head>
<body>

    <h1>Products: </h1>
    <%@ page import="product.Product" %>
    <%@ page import="users.User" %>
    <%@ page import="users.UserAdmin" %>
    <%@ page import="users.UserJust" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.io.IOException" %>

    <%
        try {
            System.out.println("\n\n\n\nITS JSPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP\n\n\n\n");
            Class.forName("org.postgresql.Driver");
            System.out.println("первый трай");
            try {
                System.out.println("второй трай");
                Connection connection = null;
                try {
                    System.out.println("третий трай");
                    connection = DriverManager.getConnection(
                            "jdbc:postgresql://localhost:5432/WeaponShop",
                            "postgres",
                            "1234"
                    );

                    Statement stmt;
                    ResultSet rs = null;
                    ArrayList<Product> products = new ArrayList<>();

                    try {
                        stmt = connection.createStatement();
                        if(stmt != null)
                            rs = stmt.executeQuery("SELECT * FROM products");

                        while (rs.next()){
                            System.out.println("внутри вайла");
                            products.add(new Product(Integer.parseInt(rs.getString("product_id")), rs.getString("product_name"), rs.getString("product_description"), Integer.parseInt(rs.getString("product_quantity"))));
                        }

                        for(Product p: products){
                            System.out.println("внутри фора");
                            out.println("<form action=\'/make-order\'>");
                            out.println("<h3>" + p.getProduct_name() + "</h3>");
                            out.println("<p>" + p.getProduct_desc() + "</p>");
                            out.println("<p>Quantity: " + p.getProduct_quantity() + "</p>");
                            out.println("<button name=\"product_id\" type=\"submit\" value=\"" + p.getProduct_id() + "\">BUY</button>");
                            out.println("<form>");
                        }

                    } catch (SQLException throwables) {
                        System.out.println("первый кетч");
                        throwables.printStackTrace();
                    }
                } catch (SQLException throwables) {
                    System.out.println("второй кетч");
                    throwables.printStackTrace();
                }
            } catch (NumberFormatException | IOException e) {
                System.out.println("третий кетч");
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("четверый кетч");
            e.printStackTrace();
        }


    %>
</body>
</html>
