<%-- 
    Document   : register
    Created on : Feb 24, 2023, 10:09:19 AM
    Author     : Minh Huy
--%>

<%@page import="Obj.AccountError"%>
<%@page import="Obj.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <h1>Register page</h1>
        <section>
            <form action="MainController" method="post" class="form">
                <h1>Register</h1>
                <table>
                    <tr><td>email</td><td><input type="text" name="email" required=""></td></tr>
                    <tr><td>full name</td><td><input type="text" name="fullname" required=""></td></tr>
                    <tr><td>password</td><td><input type="password" name="password" required=""></td></tr>
                    <tr><td>phone</td><td><input type="text" name="phone" required=""></td></tr>
                    <tr><td colspan="2"><input type="submit" value="Register" name="action"></td></tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
