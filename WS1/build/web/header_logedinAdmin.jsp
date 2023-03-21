<%-- 
    Document   : header_logedinAdmin
    Created on : Mar 10, 2023, 8:26:40 AM
    Author     : Minh Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <ul>
                <li><a href="MainController?action=manageAccounts">Manage Accounts</a></li>
                <li><a href="#">Manage Orders</a></li>
                <li><a href="#">Manage Plants</a></li>
                <li><a href="#">Manage Categories</a></li>
                <li>Welcome ${sessionScope.name} | <a href="MainController?action=logout">Log out</a></li>

            </ul>
        </header>
    </body>
</html>
