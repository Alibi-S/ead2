<%--
  Created by IntelliJ IDEA.
  Ullser: Alibi
  Date: 11.03.2021
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h1>Log in</h1>

    <form action="/auth">
        <div class="mb-3">
            <label for="login" class="form-label">Login</label>
            <input type="text" name="login" class="form-control" id="login" aria-describedby="login">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="text" name="password" class="form-control" id="password" aria-describedby="password">
        </div>

        <input type="submit" class="btn btn-primary">
    </form>
</body>
</html>
