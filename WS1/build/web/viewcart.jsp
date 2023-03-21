<%-- 
    Document   : viewcart
    Created on : Mar 8, 2023, 9:57:45 PM
    Author     : Minh Huy
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="Obj.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>\
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="section">
            <% if (session.getAttribute("name") == null) {
            %>
            <h1>Log in to view cart</h1>
            <p><a href="login.jsp">Log in</a></p>
            <% } else {%>

            <p><%= session.getAttribute("name")%>'s cart</p>
            <p><a href="MainController?action=logout">Log out</a></p>
            <p><a href="user.jsp">User page</a></p>
            <table width='100%' class="shopping">
                <tr>
                    <td>Product ID</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Action</td>
                </tr>
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    Plant plant = null;
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            plant = PlantDAO.getPlant(Integer.parseInt(pid));
                            int quantity = cart.get(pid);
                            int totalMoney = 0;
                            totalMoney += plant.getPrice() * quantity;
                %>
                <form action="MainController" method="post">
                    <tr>
                        <td><input type="hidden" value="<%= pid%>" name="pid"><a href="GetPlantServlet?pid=<%=pid%>"><%= pid%></a></td>
                        <td><img class="cartImg" src="<%= plant.getImgpath()%>"/></td>
                        <td><%= plant.getPrice()%></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity"></td>
                        <td><input type="submit" value="update" name="action">
                            <input type="submit" value="delete" name="action">
                        </td>
                    </tr>
                </form>
                <tr><td>Total money: <%= totalMoney%></td></tr>
                <tr><td>Order date: <%= (new Date()).toString()%> </td></tr>
                <tr><td>Ship date: N/A</td></tr>
                <%}
                } else {
                %>
                <tr><td>Your cart is empty</td></tr>
                <% }
                    }
                %>

            </table>
            <section>
                <form action="MainController" method="post">
                    <input type="submit" value="saveorder" name="action" class="submitorder">
                </form>
            </section>
        </section>
    </body>
</html>