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
                <div class="col-sm-4">
                  <ul class="nav nav-tabs tabs-left">
                    <li class="active"><a href="account"><i class="fa fa-user"></i> Dados pessoais</a></li>
                    <li><a href="password"><i class="fa fa-lock"></i> Senha</a></li>
                    <li><a href="settings" ><i class="fa fa-cog"></i> Configurações</a></li>
                  </ul>
                </div>

                <div class="col-sm-8">
                    <div class="tab-content">
                        <div class="tab-pane active" id="changePass">                                           
                            <div class="form">    
                                <div id="changePassForm"> 
                                <s:form action="updatePassword" method="POST" enctype="multipart/form-data">                           
                                <div class="field-wrap">
                                  <label>
                                    Antiga Senha<span class="req">*</span>
                                  </label>
                                  <input id="pass"  type="password" required autocomplete="off" minlength="6" name="oldPassword" />
                                  <i id="see-pass" class="fa fa-eye"></i>
                                </div>
                                <div class="field-wrap">
                                  <label>
                                    Nova Senha<span class="req">*</span>
                                  </label>
                                  <input id="pass2"  type="password" required autocomplete="off" minlength="6" min name="newPassword"/>
                                  <i id="see-pass2" class="fa fa-eye"></i>
                                </div>
                                <s:if test="error == 'wrongPass'">
                                    <div class="error-login">
                                        <p><i class="fa fa-exclamation-circle"></i>Antiga senha incorreta!</p>
                                    </div>
                                </s:if>
                                <s:if test="error == 'none'">
                                    <div class="correct">
                                        <p><i class="fa fa-exclamation-circle"></i> Senha alterada!</p>
                                    </div>
                                </s:if>
                                <p class="forgot"><a href="#">Esqueceu a senha?</a></p>
                                <input type="submit" class="button button-block" value="Atualizar Senha"/>
                                </s:form>
                              </div> 
                            </div>                        
                        </div>                  
                      <div class="tab-pane" id="outro"></div>
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
