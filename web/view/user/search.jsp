<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head><title>Advanced User Search</title></head>
    <body>
        <h2>Advanced User Search</h2>
        <form action="search" method="POST">
            ID: <input type="text" name="id" /><br/>
            Name: <input type="text" name="name" /><br/>
            Email: <input type="text" name="email" /><br/>
            Role: <input type="text" name="role" /><br/>
            Department: 
            <select name="did">
                <option value="">-- None --</option>
                <c:forEach items="${requestScope.depts}" var="d">
                    <option value="${d.id}"
                            ${d.id eq param.did?"selected=\"selected\"":""}
                            >From: ${d.name}</option>
                </c:forEach>
            </select>

            <br/>
            <input type="submit" value="Search"/>
        </form>

        <c:if test="${not empty users}">
            <h3>Results:</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Department ID</th>
                    <th>Department Name</th>
                </tr>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.role}</td>
                        <td>${u.getDepartment().getId()}</td>
                        <td>${u.getDepartment().getName()}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
