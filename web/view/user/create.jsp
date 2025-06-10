<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        <title>Create User</title>
    </head>
    <body>
        <h2>Create User</h2>
        <form action="create" method="post">
            Username: <input type="text" name="username" required /><br/>
            Email: <input type="email" name="email" required /><br/>
            Password: <input type="password" name="password" required /><br/>
            <input type="submit" value="Create"/>
            
        </form>

        <% String error = (String) request.getAttribute("error");
        if (error != null) {%>
        <p style="color:red;"><%= error%></p>
        <% }%>
    </body>
</html>
