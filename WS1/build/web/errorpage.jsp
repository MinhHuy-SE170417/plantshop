<%-- 
    Document   : errorpage
    Created on : Feb 24, 2023, 10:35:50 AM
    Author     : Minh Huy
--%>

<%@page import="Obj.AccountError"%>
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
        <h1>An error occured:
            <%
                out.print(request.getAttribute("USER_ERROR").toString());
            %>
        </h1>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
