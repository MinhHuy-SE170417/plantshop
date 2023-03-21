<%-- 
    Document   : invalid
    Created on : Feb 22, 2023, 9:20:40 AM
    Author     : Minh Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css">
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <div class="invalid, section">
            <p>Invalid email or password</p>
            <p><a href="login.jsp">Login again</a></p>
        </div>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
