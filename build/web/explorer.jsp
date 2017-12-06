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
                <div class="col-sm-6">
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
                
              </ul>
                <ul class="navbar-nav navbar-right">
                    <li class="nav-item">
                        <a class="nav-link nav-profile" href="account">
                            <div class="picture-nav">
                                <img src="<s:property value="#session.profile_img" />" class="picture-src" title=""/>
                            </div> <s:property value="#session.firstName" />
                        </a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="logout"><span class="fa fa-sign-out"></span> Sair</a></li>
                </ul>
            </div>            
          </nav>        
                        
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                    <h3 class="text-center">Meu SMDrive  <i class="fa fa-folder-open" aria-hidden="true"></i></h3>
                                       
                    <s:if test="breadcrumbs == null">
                        <ol class="breadcrumb toolbar">
                            <li class="breadcrumb-item active">Meu SMDrive</li>
                        </ol>  
                    </s:if>
                    <s:else>
                        <ol class="breadcrumb toolbar">
                            <li class="breadcrumb-item active">Meu SMDrive</li>
                            <s:iterator value="breadcrumbs" var="b">          
                                <s:if test="#b != \"\"">
                                    <li class="breadcrumb-item active"> <s:property value="#b.toString()" /> </li>
                                </s:if>
                            </s:iterator>
                        </ol>
                    </s:else>
                
                <div class="row">
                        <div class="col-sm-3"> <!-- required for floating -->
                          <!-- Nav tabs -->
                          <ul class="nav nav-tabs tabs-left">
                            <li class="active"><a href="#home" data-toggle="tab"><i class="fa fa-folder-open"></i> Meu SMDrive</a></li>
                            <li><a href="#profile" data-toggle="tab"><i class="fa fa-share-alt"></i> Compartilhados comigo</a></li>
                            <li><a href="#messages" data-toggle="tab"></a></li>
                          </ul>
                        </div>

                        <div class="col-sm-9">
                          <!-- Tab panes -->
                          <div class="tab-content">
                            <div class="tab-pane active" id="home">
                    
                    <!-- INICIO DA TAB PRINCIPAL -->
                    <div class="toolbar" role="group">
                        <a href="#addFolder" title="Nova pasta" data-toggle="modal" ><i class="fa fa-plus"></i> Novo</a>
                        <a href="#addFile" title="Upload de arquivo" data-toggle="modal" ><i class="fa fa-upload"></i> Upload</a>
                    </div>
                    
                    <table class="table table-hover .table-condensed">
                    <thead>
                        <tr id="table-title">
                            <th></th>
                            <th>Nome</td>
                            <th>Tamanho</td>
                            <th>Modo</td>
                            <th>Share</td>    
                        </tr>
                    </thead>
                    <tbody>
                        <s:if test="path != user_dir">
                            <tr class="thead-default">
                                <td ><i class="fa fa-folder-open-o" aria-hidden="true"></i></td>
                                <td colspan="2"><a href="javascript:history.back()">..</a></td>  
                                <td></td>
                            </tr>       
                        </s:if>
                        <s:iterator value="files" var="f">
                            <tr>
                                <s:if test="#f.isDirectory==true">
                                    <td width="42"><i class="fa fa-folder-o" aria-hidden="true"></i></td>
                                    <td class="folder" width="450">                                                                            
                                        <s:url var="enterDir" action="files">
                                            <s:param name="path" value="#f.getRelativePath()"/>
                                        </s:url>
                                        <s:a href="%{enterDir}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a>       
                                    </td>
                                </s:if>
                                <s:elseif test="#f.isDirectory==false">
                                    <td width="42"><i class="fa fa-file" aria-hidden="true"></i></td>
                                    <td  class="file" width="450">
                                        <s:url var="downloadFile" action="download">
                                            <s:param name="filePath" value="#f.getRelativePath()"/>
                                        </s:url>
                                        <s:a href="%{downloadFile}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a> 
                                    </td>
                                </s:elseif>               

                                <td width="150"><s:property value="#f.getSize()" /> Kb</td>
                                <td width="42" class="iconShare">
                                    <s:if test="#f.getRelativePath() == true">
                                       <i class="fa fa-globe" aria-hidden="true"></i>          
                                    </s:if>
                                    <s:else>
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </s:else>                                                                       
                                </td>
                                
                                <td width="42" class="iconShare">
                                    <input type="hidden" id="shareFPath" value="<s:property value="#f.getRelativePath()" />">
                                    <a href="#shareFile" id="shareFileBtn" data-toggle="modal"><i class="fa fa-share-alt" aria-hidden="true"></i></a>                                                                                                           
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                    </table>                   
                    <!-- FIM DA TAB PRINCIPAL --> 
                    </div>
                              <div class="tab-pane" id="profile">
                                  
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
                        <s:if test="path != user_dir">
                            <tr class="thead-default">
                                <td ><i class="fa fa-folder-open-o" aria-hidden="true"></i></td>
                                <td colspan="2"><a href="javascript:history.back()">..</a></td>  
                                <td></td>
                            </tr>       
                        </s:if>
                        <s:iterator value="files" var="f">
                            <tr>
                                <s:if test="#f.isDirectory==true">
                                    <td width="42"><i class="fa fa-folder-o" aria-hidden="true"></i></td>
                                    <td class="folder">                                                                            
                                        <s:url var="enterDir" action="files">
                                            <s:param name="path" value="#f.getRelativePath()"/>
                                        </s:url>
                                        <s:a href="%{enterDir}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a>       
                                    </td>
                                </s:if>
                                <s:elseif test="#f.isDirectory==false">
                                    <td width="42"><i class="fa fa-file" aria-hidden="true"></i></td>
                                    <td  class="file">
                                        <s:url var="downloadFile" action="download">
                                            <s:param name="filePath" value="#f.getRelativePath()"/>
                                        </s:url>
                                        <s:a href="%{downloadFile}">
                                           <s:property value="#f.getName()" /> 
                                        </s:a> 
                                    </td>
                                </s:elseif>               

                                <td><s:property value="#f.getSize()" /> Kb</td>
                                <td><i class="fa fa-globe" aria-hidden="true"></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                    </table>                   
                    <!-- FIM DA TAB COMPARTILHADA --> 
                                       
                              </div>
                            <div class="tab-pane" id="messages"></div>
                          </div>
                        </div>
                    </div>
                    
                    <div class="modal" id="shareFile">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Compartilhar pasta/arquivo <i class="fa fa-share-alt"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>                          
                            
                            <form action="shareFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Você irá compartilhar a sua pasta/arquivo com um usuário do SMDrive.</p>
                                    <div class="field-wrap">
                                        <label>Email do usuário para compartilhar</label>
                                        <input type="email" required autocomplete="off" name="emailShare" required/>
                                        <input type="hidden" name="path" id="shareFilePath" value="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="button button-block" value="Compartilhar">
                                </div>
                            </form>                                                     
                          </div>
                        </div>
                    </div>
                                    
                    <div class="modal" id="addFolder">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Criar nova pasta <i class="fa fa-plus"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>                          
                            
                            <form action="createFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Você irá criar uma pasta dentro do diretório atual.</p>
                                    <div class="field-wrap">
                                        <label>Nome da nova pasta</label>
                                        <input type="text" required autocomplete="off" name="newFolder" required/>
                                        <input type="hidden" name="path" value="<s:property value="relativePath"/>">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="button button-block" value="Criar pasta">
                                </div>
                            </form>                                                     
                          </div>
                        </div>
                    </div>
                    
                    <div class="modal" id="addFile">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Upload de arquivo <i class="fa fa-upload"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                                <s:form action="upload" method="POST" cssClass="form-modal" enctype="multipart/form-data">
                            <!-- <form action="upload" method="post" class="form-modal"> -->
                                <div class="modal-body">
                                    <p>Você irá fazer o upload de um arquivo dentro do diretório atual.</p>
                                    <div class="upload-btn-wrapper field-wrap">
                                        <button class="button button-block">Escolher um arquivo</button>
                                        <!-- <input type="hidden" name="filePath" value=""> -->
                                        <s:hidden name="filePath" value="%{relativePath}" />
                                        <s:file id="upfile" name="fileUpload" label="Arquivo" size="20" />
                                        <!-- <input id="upfile" type="file" required name="newFileUpload" /> -->
                                        <p id="nameFile"></p>
                                     </div>
                                </div>
                                <div class="modal-footer">
                                    <s:submit value="Enviar" cssClass="button button-block" name="submit" />
                                    <!-- <input type="submit" class="button button-block" value="Fazer Upload"> -->
                                </div>
                                </s:form>
                            <!-- </form> -->
                          </div>
                        </div>
                    </div>
                    
                    <div class="modal" id="renameFolder">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modasmdrivel-title">Renomear arquivo/pasta <i class="fa fa-pencil"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form action="renameFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Você irá renomear o arquivo ou pasta atual.</p>
                                    <p><b>Localização</b> <span class="fileLocation"></span></p>
                                    <div class="field-wrap">
                                        <label>Novo nome</label>
                                        <input type="text"  name="newFilePath" required/>
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />
                                        <input type="hidden" id="renamePathFolder" name="filePath" value="" />                                       
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="button button-block" value="Renomear">
                                </div>
                            </form>
                          </div>
                        </div>
                    </div>

                    <div class="modal" id="deleteFolder">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Excluir pasta <i class="fa fa-trash-o"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form action="deleteFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Tem certeza que deseja apagar a pasta atual e todos os seus sub diretórios e arquivos?</p>
                                    <p><b>Localização</b> <span class="fileLocation"></span></p>
                                </div>
                                <div class="modal-footer">
                                    <div class="col-sm-6">
                                        <input id="deletePathFolder" type="hidden" name="filePath" value="">
                                        <input type="submit" class=" button button-block" value="Sim"/>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="button button-block" data-dismiss="modal">Não</button>
                                    </div>
                                </div>
                            </form>
                          </div>
                        </div>
                    </div>
                                    
                    <div class="modal" id="deleteFile">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Excluir arquivo <i class="fa fa-trash-o"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form action="deleteFile" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Tem certeza que deseja apagar o arquivo?</p>
                                    <p><b>Localização</b> <span class="fileLocation"></span></p>
                                </div>
                                <div class="modal-footer">
                                    <div class="col-sm-6">
                                        <input id="deletePathFile" type="hidden" name="filePath" value="">
                                        <input type="submit" class=" button button-block" value="Sim"/>
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
                                    
        <div id='cntnr_file'>
          <ul id='items'>
            <a href="#renameFolder" data-toggle="modal"><li> Renomear</li></a>
          </ul>
          <ul id="items">
            <a href="#deleteFile" data-toggle="modal"><li> Excluir</li></a>
          </ul>
        </div>  
                                    
        <div id='cntnr_folder'>
          <ul id='items'>
            <a href="#renameFolder" data-toggle="modal"><li> Renomear</li></a>
          </ul>
          <ul id="items">
            <a href="#deleteFolder" data-toggle="modal"><li> Excluir</li></a>
          </ul>
        </div> 
                                    
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        </s:else> 
    </body>
</html>
