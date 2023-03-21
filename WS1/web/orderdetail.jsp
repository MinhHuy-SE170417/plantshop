<%-- 
    Document   : orderdetail
    Created on : Mar 4, 2023, 12:42:48 PM
    Author     : Minh Huy
--%>

<%@page import="Obj.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDAO"%>
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

        <section class="section">
            <% String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> al = OrderDAO.getOrderDetail(orderID);
                    if (al != null && !al.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : al) {%>
            <table class="order">
                <tr><td>Order ID</td><td>Plant ID</td><td>Plant Name</td><td>Image</td><td>Quantity</td></tr>
                <tr><td><%= detail.getOrderDetailID()%></td><td><%= detail.getPlantID()%></td>
                    <td><%= detail.getPlantName()%></td>
                    <td><img class="plantimg" src="<%= detail.getImgPath()%>" class="plantimg"/><br/><%= detail.getPrice()%></td>
                    <td><%= detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                </tr>
            </table>
            <%   }%>
            <h3>Total: <%=money%></h3>
            <% } else {
            %>
            <p>You donot have any order</p>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
