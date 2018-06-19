<%-- 
    Document   : luz
    Created on : 19-jun-2018, 22:23:50
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="frm" method="post" action="../ComunicacionArduino">
            <input type="submit" name="luz" value="1">
            <input type="submit" name="luz" value="0">
        </form>
    </body>
</html>
