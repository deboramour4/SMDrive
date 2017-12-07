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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>Compartilhados comigo</title>
    </head>
    <body>
        <s:if test="#session.firstName == null">
            <%@ include file= "views/nosession.jsp" %>
        </s:if>
        <s:elseif test="error == 'exception'">
            <%@ include file= "error.jsp" %>
        </s:elseif>
            
        <s:else>
        <%@ include file= "views/navaccount.jsp" %>         
                        
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                                                          
                    <s:if test="breadcrumbs == null">
                        <ol class="breadcrumb toolbar">
                            <li class="breadcrumb-item active">Compartilhados comigo</li>
                        </ol>  
                    </s:if>
                    <s:else>
                        <ol class="breadcrumb toolbar">
                            <li class="breadcrumb-item active">Compartilhados comigo</li>
                            <!-- <s:iterator value="breadcrumbs" var="b">          
                                <s:if test="#b != \"\"">
                                    <li class="breadcrumb-item active"> <s:property value="#b.toString()" /> </li>
                                </s:if>
                            </s:iterator> -->
                        </ol>
                    </s:else>
                
                    <div class="row">
                            <div class="col-sm-3"> <!-- required for floating -->
                              <!-- Nav tabs -->
                              <ul class="nav nav-tabs tabs-left">
                                <li><a href="files"><i class="fa fa-folder-open"></i> Meu SMDrive</a></li>
                                <li class="active"><a href="shared"><i class="fa fa-share-alt"></i> Compartilhados comigo</a></li>
                              </ul>
                            </div>

                            <div class="col-sm-9">
                                
                                <!-- INICIO DA TAB COMPARTILHADA -->                   
                                <table class="table table-hover .table-condensed">
                                <thead>
                                    <tr id="table-title">
                                        <th></th>
                                        <th>Nome</td>
                                        <th>Tamanho</td>
                                        <th>Proprietário</td>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                <s:if test="error == 'noSharing'">
                                    <tr><td></td><td colspan="3"><p>Não há nada compartilhado com você ainda.</p></td><tr>
                                </s:if>
                                <s:else>
                                    
                                    <s:if test="path != null">
                                        <tr class="thead-default">
                                            <td ><i class="fa fa-folder-open-o" aria-hidden="true"></i></td>
                                            <td colspan="3"><a href="javascript:history.back()">..</a></td>  
                                            <td></td>
                                        </tr>       
                                    </s:if>
                                    <s:iterator value="filesSharing" var="f">
                                        <tr>
                                            <s:if test="#f.isDirectory==true">
                                                <td width="42"><i class="fa fa-folder-o" aria-hidden="true"></i></td>
                                                <td class="folder">                                                                                  
                                                    <s:form action="shared" method="POST" enctype="multipart/form-data">
                                                        <s:hidden name="path" value="%{#f.getRelativePath()}" />
                                                        <s:hidden name="ownerId" value="%{#f.getOwnerId()}" />
                                                        <a><s:submit value="%{#f.getName()}" name="submit" /></a>
                                                    </s:form>
                                                </td>
                                            </s:if>
                                            <s:elseif test="#f.isDirectory==false">
                                                <td width="42"><i class="fa fa-file" aria-hidden="true"></i></td>
                                                <td  class="file">
                                                    <s:form action="downloadShared" method="POST" enctype="multipart/form-data">
                                                        <s:hidden name="filePath" value="%{#f.getRelativePath()}" />
                                                        <s:hidden name="ownerId" value="%{#f.getOwnerId()}" />
                                                        <a><s:submit value="%{#f.getName()}" name="submit" /></a>
                                                    </s:form> 
                                                </td>
                                            </s:elseif>               

                                            <td><s:property value="#f.getSize()" /> Kb</td>
                                            <td>
                                                <a class="nav-profile" title="<s:property value="#f.getOwnerEmail()" />">
                                                    <div class="picture-nav">
                                                        <img src="<s:property value="#f.getOwnerImage()" />" class="picture-src"/>
                                                    </div>
                                                    <s:property value="#f.getOwner()" />
                                                </a>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                                </s:else>
                                </table>                   
                                <!-- FIM DA TAB COMPARTILHADA --> 
                                
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
                                     
                                    
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        </s:else> 
    </body>
</html>
