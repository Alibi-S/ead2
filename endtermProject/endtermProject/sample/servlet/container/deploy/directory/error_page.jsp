<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <%
        String err = request.getParameter("err");
        if (err.equals("1"))
            out.println("<h2>This page is only available to admins</h2>");
        else if (err.equals("2"))
            out.println("<h2>You must log in</h2>");
    %>

    <p><jsp:include page="nav.jsp" /></p>

</body>
</html>
