<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List of Departments</title>
        <script>
            function confirmNavigation(event) {
                event.preventDefault();
                const userConfirmed = confirm("Are you sure?");
                if (userConfirmed) {
                    window.location.href = event.currentTarget.href;
                }
            }
        </script>
    </head>
    <body>
        <h2>List of Departments</h2>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th colspan="2">Actions</th>
            </tr>
            <c:forEach items="${requestScope.depts}" var="d">
                <tr>
                    <td>${d.id}</td>
                    <td>${d.name}</td>
                    <td><a href="edit?id=${d.id}">Edit</a></td>
                    <td><a href="delete?id=${d.id}" onclick="confirmNavigation(event)">Delete</a></td>
                </tr>
            </c:forEach>
        </table>

        <br/>
        <a href="create">Create new Department</a>
    </body>
</html>
