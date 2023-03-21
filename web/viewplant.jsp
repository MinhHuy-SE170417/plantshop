<%-- 
    Document   : viewplant
    Created on : Mar 9, 2023, 10:21:54 PM
    Author     : Minh Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="plantObj" class="Obj.Plant" scope="request" />
        <!--            <table>
        <tr><td rowspan="8"><img src="<jsp:getProperty name="plantObj" property="imgpath"></jsp:getProperty>"></td></tr>
                        <tr><td>ID: <jsp:getProperty name="plantObj" property="id"></jsp:getProperty></td></tr>
                        <tr><td>Product name: <jsp:getProperty name="plantObj" property="name"></jsp:getProperty></td></tr>
                        <tr><td>Price: <jsp:getProperty name="plantObj" property="price"></jsp:getProperty></td></tr>
                        <tr><td>Description: <jsp:getProperty name="plantObj" property="description"></jsp:getProperty></td></tr>
                        <tr><td>Status: <jsp:getProperty name="plantObj" property="status"></jsp:getProperty></td></tr>
        <tr><td>Cate ID: <jsp:getProperty name="plantObj" property="catalog"></jsp:getProperty></td></tr>
                        <tr><td>Category: <jsp:getProperty name="plantObj" property="catename"></jsp:getProperty></td></tr>            
                        </table>-->
            <table>
                <tr><td rowspan="8"><img src="${plantObj.imgpath}"></td></tr>
            <tr><td>ID: ${plantObj.id}</td></tr>
            <tr><td>Product name: ${plantObj.name}</td></tr>
            <tr><td>Price: ${plantObj.price}</td></tr>
            <tr><td>Description: ${plantObj.description}</td></tr>
            <tr><td>Status: ${plantObj.status}</td></tr>
            <tr><td>Cate ID: ${plantObj.catalog}</td></tr>
            <tr><td>Category: ${plantObj.catename}</td></tr>
        </table>
    </body>
</html>
