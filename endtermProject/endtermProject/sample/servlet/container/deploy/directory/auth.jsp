<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <h1>Log in</h1>
    <h4><a href="/index.jsp">Back</a></h4>
    <form action="/auth">
        <div>
            <label for="login">Username: </label>
            <input type="text" name="login" id="login" aria-describedby="login">
        </div>

        <div>
            <label for="password">Password: </label>
            <input type="text" name="password" id="password" aria-describedby="password">
        </div>

        <input type="submit">
    </form>
</body>
</html>
