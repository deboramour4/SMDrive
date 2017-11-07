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
                    <h3 class="text-center">Minha conta <i class="fa fa-person" aria-hidden="true"></i></h3>
                    
                    <div class="form">    
  
                        <div id="signup">   
                          <h3 class="text-center">Atualizar dados</h3>

                            <form action="register" method="post">

                            <div class="top-row">
                              <div class="field-wrap">
                                  <label class="active">
                                  Nome<span class="req">*</span>
                                </label>
                                  <input type="text" required autocomplete="off" name="firstName" value="<s:property value="#session.nome" />"/>
                              </div>

                              <div class="field-wrap">
                                <label class="active">
                                  Sobrenome<span class="req">*</span>
                                </label>
                                <input type="text"required autocomplete="off" name="lastName"/>
                              </div>
                            </div>

                            <div class="field-wrap">
                              <label class="active">
                                Email<span class="req ">*</span>
                              </label>
                              <input type="email"required autocomplete="off" name="email"/>
                            </div>

                            <div class="field-wrap">
                              <label class="active">
                                Senha<span class="req">*</span>
                              </label>
                              <input type="password"required autocomplete="off" name="password"/>
                            </div>

                            <input type="submit" class="button button-block" value="Atualizar"/>

                            </form>
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
