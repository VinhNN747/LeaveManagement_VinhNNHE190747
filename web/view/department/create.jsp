<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Department</title>
    </head>
    <body>
        <h2>Create New Department</h2>

        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>

        <form action="create" method="post">
            Name: <input type="text" name="name" required /><br/><br/>
            <input type="submit" value="Create"/>
        </form>

        <br/>
        <form action="list" method="get">
            <input type="submit" value="Back to List" />
        </form>
    </body>
</html>
