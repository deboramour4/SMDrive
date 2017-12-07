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
        <title>Conta | SMDrive</title>
    </head>
    <body>
        
        <s:if test="#session.firstName == null">
            <%@ include file= "views/nosession.jsp" %>  
        </s:if>
            
        <s:else>
        <%@ include file= "views/navaccount.jsp" %>        
        
        <div class="container">
                
            <div class="row files" id="account">
                <div class="col-sm-4"> <!-- required for floating -->
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs tabs-left">
                    <li><a href="account"><i class="fa fa-user"></i> Dados pessoais</a></li>
                    <li><a href="password"><i class="fa fa-lock"></i> Senha</a></li>
                    <li class="active"><a href="settings" ><i class="fa fa-cog"></i> Configurações</a></li>
                  </ul>
                </div>

                <div class="col-sm-8">
                  <div class="tab-content">
                    <div class="tab-pane active" id="settings">
                        <div class="form">    
                            <h4><i class="fa fa-hdd-o"></i> Espaço usado  
                            <b><s:property value="storage"/> Mb</b></h4><br>

                            <p><i class="fa fa-info-circle"></i> Espaço total de 10 Mb</p>

                            <div class="delete-account text-center">
                                <a href="#deleteAccount" data-toggle="modal"><span class="fa fa-trash-o"> </span>  Apagar Conta</a>
                            </div>

                        </div>                
                      </div>
                      <div class="tab-pane" id="outro"></div>
                  </div>
                </div>
            </div>


            <div class="modal" id="deleteAccount">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Apagar conta <i class="fa fa-trash-o"></i></h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="createFolder" method="post" class="form-modal">
                        <div class="modal-body">
                            <p>Tem certeza que deseja apagar sua conta, consequentemente todas as suas pastas?</p>
                        </div>
                        <div class="modal-footer">
                            <div class="col-sm-6">
                                <a class="button button-block" href="deleteAccount">Sim</a>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" class="button button-block" data-dismiss="modal">Não</button>
                            </div>
                        </div>
                    </form>
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
