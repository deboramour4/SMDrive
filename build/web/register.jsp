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
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>Cadastro | SMDrive</title>
    </head>
    <body>
        <s:if test="#session.firstName != null">
            <% response.sendRedirect("files"); %>  
        </s:if>
        
        <%@ include file= "views/nav.jsp" %>
    
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                      <div class="form">    
                        <ul class="tab-group">
                          <li class="tab"><a href="index.jsp">Login</a></li>
                          <li class="tab active"><a href="register.jsp">Cadastro</a></li>
                        </ul>

                        <div class="tab-content">
                          <div id="signup">   
                          <h3 class="text-center">Cadastre-se</h3>

                            <form action="register" method="post">

                            <div class="top-row">
                              <div class="field-wrap">       
                                <s:if test="error == 'emailExists'">
                                    <label class="active">
                                      Nome<span class="req">*</span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="firstName" value="<s:property value="firstName" />"/>
                                </s:if> 
                                <s:else>
                                    <label>
                                      Nome<span class="req">*</span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="firstName"/>
                                </s:else>
                              </div>

                              <div class="field-wrap">
                                <s:if test="error == 'emailExists'">
                                    <label class="active">
                                      Sobrenome<span class="req">*</span>
                                    </label>                                    
                                    <input type="text"required autocomplete="off" name="lastName" value="<s:property value="lastName" />"/>
                                </s:if>
                                <s:else>
                                    <label>
                                      Sobrenome<span class="req">*</span>
                                    </label>                                    
                                    <input type="text"required autocomplete="off" name="lastName"/>
                                </s:else>    
                              </div>
                            </div>

                            <div class="field-wrap">
                                <s:if test="error == 'emailExists'">
                                    <label class="active">
                                        Email<span class="req">*</span>
                                    </label>                                
                                    <input type="email"required autocomplete="off" name="email" value="<s:property value="email" />"/>
                                </s:if>
                                <s:else>
                                    <label>
                                        Email<span class="req">*</span>
                                    </label>                                    
                                    <input type="email"required autocomplete="off" name="email"/>
                                </s:else>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Senha<span class="req">*</span>
                                </label>
                                <input id="pass" type="password" required autocomplete="off" name="password" minlength="6"/>
                                <i id="see-pass" class="fa fa-eye"></i>
                            </div>
                            
                            <s:if test="error == 'emailExists'">
                                <div class="error-login">
                                    <p><i class="fa fa-exclamation-circle"></i> Já existe uma conta com este email</p>
                                </div>
                            </s:if>                         

                            <input type="submit" class="button-login button-block" value="Começar"/>

                            </form>

                          </div>

                          <div id="login">   
                            
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

