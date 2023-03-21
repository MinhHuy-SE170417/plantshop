<%-- 
    Document   : viewcmpletedorder
    Created on : Mar 16, 2023, 1:52:08 PM
    Author     : Minh Huy
--%>

<%@page import="Obj.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Obj.Account"%>
<%@page import="dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Canceled order</h1>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                String token = "";
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("selector")) {
                        token = aCookie.getValue();
                        Account acc = AccountDAO.getAccount(token);
                        if (acc != null) {
                            name = acc.getFullName();
                            email = acc.getEmail();
                            login = true;
                        }
                    }
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
        <section class="section">
            <%
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "completed", "canceled", "processing"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
            %>
            <% if (ord.getStatus() == 1) {%>
            <table class="order">
                <tr>
                    <td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>Action</td>
                </tr>
                <tr>
                    <td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>   
                    <td><%= status[ord.getStatus()]%></td>
                    <td><a href="orderdetail.jsp?orderid=<%= ord.getOrderID()%>">detail</td>
                </tr>

            </table>
            <%
                    }
                }
            } else {
            %>
            <p>You don't have any order </p>
            <% } %>
        </section>
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
