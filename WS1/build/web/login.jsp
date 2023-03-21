<%-- 
    Document   : login
    Created on : Feb 22, 2023, 12:53:19 AM
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
        <form class="login" action="MainController" method="post">
            <font style="color: red;"><%=(request.getAttribute("Warning")==null ?"":(String) request.getAttribute("Warning") )%></form>
            <input type="text" name="email" placeholder="Enter username"/>
            <input type="password" name="password" placeholder="Enter password"/>
            <input type="submit" value="login" name="action"/>
            <input type="checkbox" value="savelogin">Stay signed in       
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
