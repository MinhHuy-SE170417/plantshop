<%-- 
    Document   : profile
    Created on : Mar 14, 2023, 10:03:55 AM
    Author     : Minh Huy
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="Obj.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                Account acc = AccountDAO.getAccount2(email);
                if (acc != null) {
                    name = acc.getFullName();
                    email = acc.getEmail();
                    login = true;
                }
            } else {
                login = true;
            }
            if (login) {
        %>
        <header>
            <%@include file="header_logedinUser.jsp" %> 
        </header>
        <section class="section">
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>
        <form action="MainController" method="POST">
            <input type="text" name="newname" placeholder="Enter full name:"/>
            <input type="text" name="newphone" placeholder="Enter phone:"/>
            <input type="submit" value="Update" name="action"/>
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
        } else {
        %>
        <p><font color='red'>you must login to view personal page</font></p>
        <p><a href="login.jsp">Log in</a></p>
        <%}%>
    </body>
</html>
