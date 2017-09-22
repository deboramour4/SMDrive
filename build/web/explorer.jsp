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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-sm-8">
            <h1 class="text-center">Meus arquivos <i class="fa fa-folder-open-o" aria-hidden="true"></i></h1>
            <table class="table table-hover .table-condensed">
            <thead>
                <tr>
                    <th></th>
                    <th>Nome</td>
                    <th>Tamanho</td>
                </tr>
            </thead>
            <tbody>
                <tr class="thead-default">
                    <td ><i class="fa fa-folder-open-o" aria-hidden="true"></i></td>
                    <s:url var="backDir" action="files">
                        <s:param name="path" value="C:\\Users\\Débora\\Desktop"/>
                    </s:url>
                    <s:a href="%{backDir}">
                       <td colspan="2">...</td>
                    </s:a>               
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
                            <td><s:property value="#f.getName()" /></td>
                        </s:elseif>               

                        <td><s:property value="#f.length()" /></td>
                    </tr>
                </s:iterator>
            </tbody>
            </table>
        </div>
    </body>
</html>
