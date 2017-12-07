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
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                        <!-- INICIO DA TAB DADOS -->                 
                            <div class="form">    
                                <div id="signup">   
                                    <s:form action="updateAccount" method="POST" enctype="multipart/form-data">                           
                                    <div class="picture-container">
                                        <div class="picture">
                                        <img src="<s:property value="#session.profile_img" />" class="picture-src" id="wizardPicturePreview" title=""/>
                                        <s:file id="wizard-picture" name="fileUpload" label="Arquivo" size="20" />
                                        </div>
                                        <h6>Atualizar foto</h6>
                                    </div>
                                    <div class="top-row">
                                        <div class="field-wrap">
                                            <label class="active">
                                            Nome<span class="req">*</span>
                                          </label>
                                            <input type="text" required autocomplete="off" name="firstName" value="<s:property value="firstName" />"/>
                                        </div>
                                        <div class="field-wrap">
                                          <label class="active">
                                            Sobrenome<span class="req">*</span>
                                          </label>
                                            <input type="text"required autocomplete="off" name="lastName" value="<s:property value="lastName" />"/>
                                        </div>
                                    </div>
                                    <div class="field-wrap">
                                      <label class="active">
                                        Email<span class="req ">*</span>
                                      </label>
                                      <input type="email"required autocomplete="off" name="email" value="<s:property value="email" />"/>
                                    </div> 
                                    <s:if test="error == 'yes'">
                                        <div class="error-login">
                                            <p><i class="fa fa-exclamation-circle"></i> Não é possível atualizar os dados no momento!</p>
                                        </div>
                                    </s:if>
                                    <s:if test="error == 'none'">
                                        <div class="correct">
                                            <p><i class="fa fa-exclamation-circle"></i> Os dados foram atualizados!</p>
                                        </div>
                                    </s:if>
                                    <input type="submit"  class="button button-block" value="Atualizar Dados"/>
                                    </s:form>
                                </div>
                            </div>
                <!-- FIM DA TAB DADOS --> 
                        </div>

                        <div class="tab-pane" id="changePass"></div>
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
