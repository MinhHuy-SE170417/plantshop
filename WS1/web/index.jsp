<%-- 
    Document   : index
    Created on : Mar 6, 2023, 8:40:26 PM
    Author     : Minh Huy
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="Obj.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String keyword = (String) request.getParameter("txtsearch");
                String searchby = (String) request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.getPlants("", "");
                } else {
                    list = PlantDAO.getPlants(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                    for (Plant p : list) {%>
            <table class="product" >
                <tr>
                    <td><img src="<%= p.getImgpath()%>" class='plantimg'/></td>                    
                    <td>Product ID: <%= p.getId()%></td>
                    <td>Product name <%= p.getName()%></td>
                    <td>Price: <%= p.getPrice()%></td>
                    <td>Status: <%= tmp[p.getStatus()]%></td>
                    <td>Category: <%= p.getCatename()%></td>
                    <td><a href="MainController?action=addtocart&pid=<%= p.getId()%>">add to cart</td>
                </tr>
            </table>
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
