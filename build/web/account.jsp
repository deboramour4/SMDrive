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
        <title>SMDrive</title>
    </head>
    <body>
        <s:if test="#session.firstName == null">
            <div class="container">
                <div class="col-sm-6-offset"
                    <h2 class="text-center">Você não está logado</h2>
                    <s:a href="index.jsp">
                       <button class="button button-block"/>Voltar</button>
                    </s:a>    
                </div>
            </div>
        </s:if>
            
        <s:else>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="files">SMDrive</a>
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
                    <li class="nav-item">
                        <a class="nav-link nav-profile" href="#">
                            <div class="picture-nav">
                                <img src="<s:property value="profile_img" />" class="picture-src" title=""/>
                            </div> <s:property value="firstName" />
                        </a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="logout"><span class="fa fa-sign-out"></span> Sair</a></li>
                  </ul>
            </div>
          </nav>        
        
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                    <h3 class="text-center">Minha conta <i class="fa fa-person" aria-hidden="true"></i></h3>
                    
                    <div class="form">    
  
                        <div id="signup">   
                            <form action="register" method="post">
                            
                            <div class="picture-container">
                                <div class="picture">
                                <img src="<s:property value="profile_img" />" class="picture-src" id="wizardPicturePreview" title=""/>
                                <input type="file" id="wizard-picture">
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

                            <div class="field-wrap">
                              <label class="active">
                                Senha<span class="req">*</span>
                              </label>
                              <input id="pass"  type="password"required autocomplete="off" name="password" value="<s:property value="password" />"/>
                              <i id="see-pass" class="fa fa-eye"></i>
                            </div>
                            
                            <div class="field-wrap delete-account">
                                <a href="#deleteAccount" data-toggle="modal">Apagar Conta <span class="fa fa-trash-o"></span></a>
                            </div>

                            <input type="submit" class="button button-block" value="Atualizar"/>

                            </form>
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
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        </s:else> 
    </body>
</html>
