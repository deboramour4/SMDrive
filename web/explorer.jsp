<%-- 
    Document   : list
    Created on : 21/09/2017, 17:39:54
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
        <link rel="stylesheet" href="css/style.css">
        <title>SMDrive</title>
    </head>
    <body>
        <s:if test="#session.nome == null">
                <h2 class="text-center">Você não está logado</h2>
                <s:a href="index.jsp">
                   <button class="button button-block"/>Voltar</button>
                </s:a>       
            </td>
        </s:if>
            
        <s:else>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">SMDrive</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Root <span class="sr-only">(current)</span></a>
                </li>
              </ul>
                <ul class="navbar-nav navbar-right">
                    <li class="nav-item"><a class="nav-link" href="#"><span class="fa fa-user"></span> <s:property value="#session.nome" />   </a></li>
                    <li class="nav-item"><a class="nav-link" href="logout"><span class="fa fa-sign-out"></span> Sair</a></li>
                  </ul>
            </div>
          </nav>        
        
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                    <h3 class="text-center">Meus arquivos <i class="fa fa-folder-open" aria-hidden="true"></i></h3>
                    <table class="table table-hover .table-condensed">
                    <thead>
                        <tr id="table-title">
                            <th></th>
                            <th>Nome</td>
                            <th>Tamanho</td>
                            <th>Share</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="thead-default">
                                <td ><i class="fa fa-folder-open-o" aria-hidden="true"></i></td>
                                <td colspan="2"><a href="javascript:history.back()">..</a></td>  
                                <td></td>
                        </tr>            
                        <s:iterator value="files" var="f">
                            <tr>
                                <s:if test="#f.isDirectory==true">
                                    <td width="42"><i class="fa fa-folder-o" aria-hidden="true"></i></td>
                                    <td>
                                        <s:url var="enterDir" action="files">
                                            <s:param name="path" value="#f.getPath()"/>
                                        </s:url>
                                        <s:a href="%{enterDir}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a>       
                                    </td>
                                </s:if>
                                <s:elseif test="#f.isDirectory==false">
                                    <td width="42"><i class="fa fa-file" aria-hidden="true"></i></td>
                                    <td>
                                        <s:url var="downloadFile" action="download">
                                            <s:param name="filePath" value="#f.getPath()"/>
                                        </s:url>
                                        <s:a href="%{downloadFile}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a> 
                                    </td>
                                </s:elseif>               

                                <td><s:property value="#f.length()" /></td>
                                <td><i class="fa fa-globe" aria-hidden="true"></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        </s:else> 
    </body>
</html>
