<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit User</title>
    </head>
    <body>
        <h2>Edit User</h2>
        <form action="edit" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            Name: <input type="text" name="name" value="${user.name}" /><br/>
            Email: <input type="email" name="email" value="${user.email}" /><br/>
            Password: <input type="password" name="password" value="${user.password}" /><br/>
            Role: 
            <select name="role">
                <option value="Employee" ${user.role == 'Employee' ? 'selected' : ''}>Employee</option>
                <option value="Manager" ${user.role == 'Manager' ? 'selected' : ''}>Manager</option>
                <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
            </select><br/>
            Department: 
            <select name="did">
                <option value="">None</option>
                <c:forEach items="${depts}" var="d">
                    <option value="${d.id}" 
                            ${user.department != null && user.department.id == d.id ? "selected" : ""}>
                        ${d.name}
                    </option>
                </c:forEach>
            </select><br/>
            <input type="submit" value="Update"/>
        </form>
        <br/>
        <a href="list">Back to User List</a>
    </body>
</html>
