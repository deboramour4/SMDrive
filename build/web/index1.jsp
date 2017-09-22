<%-- 
    Document   : index
    Created on : 19/09/2017, 17:09:57
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Par Impar - Form</h1>
        <s:form action="Calcular">
            Numero: <s:textfield name="numero" />
            <s:submit value="Vai!" />
        </s:form>
    </body>
</html>
