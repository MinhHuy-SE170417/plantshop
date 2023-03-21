<%-- 
    Document   : CarDetail
    Created on : Feb 10, 2023, 11:03:46 AM
    Author     : user
--%>

<%@page import="Obj.Plant"%>
<%@page import="java.util.ArrayList"%>
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
        <style>
            table,td, tr{
                border: 1px solid black;
                text-align: center;
            }
            table{
                width: 80%
            }
        </style>
        <div class="scroll">
            <p>Plant list</p>
            <table>
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Description</td>
                    <td>Image</td>
                    <td>Price</td>
                </tr>
                <%
                    ArrayList<Plant> list = (ArrayList<Plant>) request.getAttribute("rs");
                    if (list != null && list.size() > 0) {
                %>      
                <%
                    for (Plant plant : list) {
                        if (plant != null) {


                %>
                <tr>
                    <td><%= plant.getId()%></td>
                    <td><%= plant.getName()%></td>
                    <td><%= plant.getDescription()%></td>
                    <td><img class="plantimg" src="<%= plant.getImgpath()%>"</td>
                    <td><%= plant.getPrice()%></td>

                </tr>
                <%
                            }
                        }
                    }

                %>
            </table> 
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
