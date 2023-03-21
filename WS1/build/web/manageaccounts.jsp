<%-- 
    Document   : manageaccounts
    Created on : Mar 10, 2023, 10:12:08 AM
    Author     : Minh Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <c:import url="header_logedinAdmin.jsp"></c:import>
        <section class="section">
            <form action="MainController" method="post">
                <input placeholder="name" type="text" name="txtsearch">
                <input type="submit" value="search account" name="action">
            </form>
            <h1>Accounts management:</h1>
            <table class="order">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full name</th>
                    <th>Status</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            <c:forEach var="acc" items="${requestScope.accountlist}">
                <tr>
                    <td><c:out value="${acc.getAccid()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullName()}"></c:out></td>
                        <td>
                        <c:choose >
                            <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                    <td><c:choose>
                            <c:when test="${acc.getRole() eq 1}">admin</c:when>
                            <c:otherwise>user</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="MainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">
                                <c:choose>
                                    <c:when test="${acc.getStatus() eq 1}">Block</c:when>
                                    <c:otherwise>Unblock</c:otherwise>
                                </c:choose>
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
            </section>
    </body>
</html>