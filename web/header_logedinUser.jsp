<%-- 
    Document   : logedinUser
    Created on : Mar 1, 2023, 10:47:20 PM
    Author     : Minh Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css"
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home page</a></li>
                <li><a href="profile.jsp">Change Profile</a></li>
                <li><a href="viewcompletedorder.jsp">Completed Orders</a></li>
                <li><a href="viewcanceledorder.jsp">Canceled orders</a></li>
                <li><a href="viewprocessingorder.jsp">Processing orders</a></li>
                <li>From<input type="date" name="from"> to<input type="date" name="to">
                    <input type="submit" value="search">
                </li>
            </ul>
        </nav>
    </body>
</html>
