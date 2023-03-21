<%-- 
    Document   : header
    Created on : Mar 1, 2023, 10:23:14 PM
    Author     : Minh Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav>
            <ul>
                <li><a href=""><img src="images/logo.jpg"></a></li>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="MainController?action=viewcart">View Cart</a></li>
                <li class="search">
                    <form action="MainController" method="post" class="formsearch">
                        <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch") == null ? "" : request.getParameter("txtsearch"))%>">
                        <select name="searchby">
                            <option value="byname">by name</option>
                            <option value="bycate">by category</option>s
                        </select>
                        <input class="submit" type="submit" value="search" name="action" >
                    </form>
                </li>
            </ul>    
        </nav>
    </body>
</html>