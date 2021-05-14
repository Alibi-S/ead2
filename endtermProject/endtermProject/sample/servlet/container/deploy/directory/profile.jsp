<%@ page import="com.store.servlet.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <%
            User user = (User) session.getAttribute("user");
            out.println(user.getLogin());
        %>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
<div class="container row">
    <h1 class="col-sm-12">User Info</h1>
    <h2 class="col-sm-6">User ID:</h2><h3 class="col-sm-6"> <% out.println(user.getId()); %> </h3>
    <h2 class="col-sm-6">Login:</h2><h3 class="col-sm-6"><% out.println(user.getLogin()); %> </h3>
    <h2 class="col-sm-6">Balance:</h2><h3 class="col-sm-6"> <% out.println(user.getBalance()); %> </h3>

    <p><jsp:include page="nav.jsp" /></p>
</div>

</body>
</html>
