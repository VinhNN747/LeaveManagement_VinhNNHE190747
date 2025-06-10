<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Department</title>
    </head>
    <body>
        <h2>Edit Department</h2>
        <form action="edit" method="post">
            <input type="hidden" name="id" value="${requestScope.d.id}" />
            Name: <input type="text" name="name" value="${requestScope.d.name}" /><br/>
            <input type="submit" value="Update" />
        </form>
        <br/>
        <a href="list">Back to List</a>
    </body>
</html>
