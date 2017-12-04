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
                    
                    <div class="toolbar" role="group">
                        <a href="#addFolder" title="Nova pasta" data-toggle="modal" ><i class="fa fa-plus"></i> Novo</a>
                        <a href="#addFile" title="Upload de arquivo" data-toggle="modal" ><i class="fa fa-upload"></i> Upload</a>
                        <!--
                            <a href="#renameFolder" title="Renomear pasta" data-toggle="modal" ><i class="fa fa-pencil"></i> Renomear</a>
                            <a href="#deleteFolder" title="Deletar pasta" data-toggle="modal" ><i class="fa fa-trash-o"></i> Excluir</a>
                        
                        <a href="#infoFolder" title="Informações da pasta" data-toggle="modal" ><i class="fa fa-info"></i> Info</a> -->                 
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
                                        <input type="hidden" name="path" value="<s:property value="path"/>">
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
                              <h5 class="modasmdrivel-title">Renomear pasta <i class="fa fa-pencil"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form action="createFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Você irá criar renomear a pasta atual.</p>
                                    <div class="field-wrap">
                                        <label>Novo nome da pasta</label>
                                        <input type="text" required autocomplete="off" name="newFolderName" required/>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="button button-block" value="Renomear pasta">
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
                            <form action="deleteFolder" method="post" class="form-modal">
                                <div class="modal-body">
                                    <p>Tem certeza que deseja apagar o arquivo?</p>
                                    <p><b>Localização</b> <span id="fileLocation"></span></p>
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
                        
                    <div class="modal" id="infoFolder">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Informações da pasta <i class="fa fa-info"></i></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div> 
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <th>Nome</th>
                                        <td><s:property value="path" /></td>
                                    </tr>
                                    <tr>
                                        <th>Local</th>
                                        <td><s:property value="relativePath" /></td>
                                    </tr>
                                    <tr>
                                        <th>Tamanho</th>
                                        <td><s:property value="path" /></td>
                                    </tr>
                                    <tr>
                                        <th>Tipo</th>
                                        <td><s:property value="path" /></td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button button-block" data-dismiss="modal">OK</button>
                            </div>
                          </div>
                        </div>
                    </div>
                    
                    <table class="table table-hover .table-condensed">
                    <thead>
                        <tr id="table-title">
                            <th></th>
                            <th>Nome</td>
                            <th>Tamanho</td>
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

                                <td><s:property value="#f.getSize()" /></td>
                                <td><i class="fa fa-globe" aria-hidden="true"></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
                                    
        <div id='cntnr_file'>
          <ul id='items'>
            <a href="#renameFile" data-toggle="modal"><li> Renomear</li></a>
            <a href="#infoFile" data-toggle="modal"><li> Info</li></a>
          </ul>
          <hr />
          <ul id="items">
            <a href="#deleteFile" data-toggle="modal"><li> Excluir</li></a>
          </ul>
        </div>  
                                    
        <div id='cntnr_folder'>
          <ul id='items'>
            <a href="#renameFolder" data-toggle="modal"><li> Renomear</li></a>
            <a href="#infoFolder" data-toggle="modal"><li> Info</li></a>
          </ul>
          <hr />
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
