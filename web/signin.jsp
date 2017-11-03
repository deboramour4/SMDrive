<%-- 
    Document   : signin
    Created on : 02/11/2017, 21:16:13
    Author     : debor
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
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                      <div class="form">    
                        <ul class="tab-group">
                          <li class="tab active"><a href="#signup">Cadastro</a></li>
                          <li class="tab"><a href="#login">Login</a></li>
                        </ul>

                        <div class="tab-content">
                          <div id="signup">   
                          <h3 class="text-center">Cadastre-se</h3>

                            <form action="/" method="post">

                            <div class="top-row">
                              <div class="field-wrap">
                                <label>
                                  Nome<span class="req">*</span>
                                </label>
                                <input type="text" required autocomplete="off" />
                              </div>

                              <div class="field-wrap">
                                <label>
                                  Sobrenome<span class="req">*</span>
                                </label>
                                <input type="text"required autocomplete="off"/>
                              </div>
                            </div>

                            <div class="field-wrap">
                              <label>
                                Email<span class="req">*</span>
                              </label>
                              <input type="email"required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                              <label>
                                Senha<span class="req">*</span>
                              </label>
                              <input type="password"required autocomplete="off"/>
                            </div>

                            <button type="submit" class="button button-block"/>Começar</button>

                            </form>

                          </div>

                          <div id="login">   
                            <h3 class="text-center">Bem-vindo de volta!</h3>

                            <form action="/" method="post">

                              <div class="field-wrap">
                              <label>
                                Email<span class="req">*</span>
                              </label>
                              <input type="email"required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                              <label>
                                Senha<span class="req">*</span>
                              </label>
                              <input type="password"required autocomplete="off"/>
                            </div>

                            <p class="forgot"><a href="#">Esqueceu a senha?</a></p>

                            <button class="button button-block"/>Entrar</button>

                            </form>
                          </div>        
                        </div><!-- tab-content -->
                  </div> <!-- /form -->
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

