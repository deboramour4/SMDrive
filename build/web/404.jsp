<%-- 
    Document   : list
    Created on : 21/09/2017, 17:39:54
    Author     : Débora
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>Nao encontrado | SMDrive</title>
    </head>
    <body>

        <s:if test="#session.firstName == null">
            <%@ include file= "views/nav.jsp" %> 
        </s:if>
        <s:else>
            <%@ include file= "views/navaccount.jsp" %> 
        </s:else>                       
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                    <h3 class="text-center"><i class="fa fa-exclamation-triangle"></i> Erro 404</h3>                  
                    <div class="form"> 
                        <h6>Não encontramos o que você procura.<br>
                            Tente novamente.</h6> <br>
                        <a href="index.jsp" class="button button-block text-center">Voltar para o início</a> 
                    </div>
                </div>
            </div>
        </div>
        
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
