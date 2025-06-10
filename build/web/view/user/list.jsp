<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, entity.User" %>
<html>
    <head>
        <title>User List</title>
    </head>
    <body>
        <h2>User List</h2>

        <a href="create">Create New User</a><br/><br/>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>DeptID</th>
                <th>Department</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.users}" var="u">
                <tr>
                    <td>${u.getId()}</td>
                    <td>${u.getName()}</td>
                    <td>${u.getEmail()}</td>
                    <td>${u.getRole()}</td>
                    <td>${u.getDepartment().getId()}</td>
                    <td>${u.getDepartment().getName()}</td>
                    <td>
                        <a href="edit?id=${u.getId()}">Edit</a> |
                        <a href="delete?id=${u.getId()}" onclick="return confirm('Delete this user?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
