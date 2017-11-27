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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <title>Sign in | SMDrive</title>
    </head>
    <body>
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                      <div class="form">    
                        <ul class="tab-group">
                          <li class="tab active"><a href="index.jsp">Login</a></li>
                          <li class="tab "><a href="register.jsp">Cadastro</a></li>
                        </ul>

                        <div class="tab-content">
                          <div id="signup">   
                          <h3 class="text-center">Bem-vindo de volta!</h3>

                            <form action="login" method="post">

                              <div class="field-wrap">
                              <label>
                                Email<span class="req">*</span>
                              </label>
                              <input type="email" required autocomplete="off" name="email"/>
                            </div>

                            <div class="field-wrap">
                              <label>
                                Senha<span class="req">*</span>
                              </label>
                              <input type="password" required autocomplete="off" name="password"/>
                            </div>
                            <s:if test="#error == 'no_email'">
                                <div class="error-login">
                                    <p>E-mail não cadastrado!</p>
                                </div>
                            </s:if>
                            <s:if test="#error == 'wrong_pass'">
                                <div class="error-login">
                                    <p>Senha incorreta!</p>
                                </div>
                            </s:if>
                            <p class="forgot"><a href="#">Esqueceu a senha?</a></p>

                            <button class="button button-block"/>Entrar</button>

                            </form>
                          </div>
                          <div></div>        
                        </div><!-- tab-content -->
                  </div> <!-- /form -->
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

