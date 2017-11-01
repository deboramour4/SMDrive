<%-- 
    Document   : index
    Created on : 21/09/2017, 17:35:21
    Author     : Débora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>File Explorer Struts</title>
    </head>
    <body>
        <div class="col-sm-12 center-block"  align="center">
            <div class="card text-center">
                <div class="card-block">
                    <p></p>
                    <h4 class="card-title">Comece a explorar</h4>
                    <p>Diga por onde quer começar (Quase um dropbox falta só alguns detalhes pra ficar perfeito)</p>                        
                    <s:url action="files" var="urlListFiles" >
                        <s:param name="path">C:\Users\debor\Downloads\file-explorer-struts\file-explorer-struts\build\web\WEB-INF\public</s:param>
                    </s:url>    
                    <s:a href="%{urlListFiles}">
                        <button type="button" class="btn btn-primary btn-lg">Explorar</button>
                    </s:a>
                    <p></p>
                </div>
            </div>
        </div>
    </body>
</html>
