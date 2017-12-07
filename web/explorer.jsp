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
        <title>Meu SMDrive</title>
    </head>
    <body>
        <s:if test="#session.firstName == null">
            <%@ include file= "views/nosession.jsp" %>
        </s:if>
        <s:elseif test="error == 'storageMax">
            <%@ include file= "error.jsp" %>
        </s:elseif>
            
        <s:else>
        <%@ include file= "views/navaccount.jsp" %>         
                        
        <div class="container">
            <div class="row files">
                <div class="col-sm-12">
                                                          
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
                            <li class="active"><a href="files"><i class="fa fa-folder-open"></i> Meu SMDrive</a></li>
                            <li><a href="shared"><i class="fa fa-share-alt"></i> Compartilhados comigo</a></li>
                          </ul>
                        </div>

                        <div class="col-sm-9">
                    
                            <!-- INICIO DA TAB PRINCIPAL -->
                            <div class="toolbar" role="group">
                                <a href="#addFolder" data-toggle="modal" ><i class="fa fa-plus"></i> Nova pasta</a>
                                <a href="#addFile" data-toggle="modal" ><i class="fa fa-upload"></i> Upload arquivo</a>
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
                                            <td colspan="3"><a href="javascript:history.back()" >..</a></td> 
                                            <td></td>      

                                    </tr> 

                                </s:if>
                                <s:iterator value="files" var="f">
                                    <tr>
                                        <s:if test="#f.isDirectory==true">
                                            <td width="42"><i class="fa fa-folder-o" aria-hidden="true"></i></td>
                                            <td class="folder">
                                                <s:form action="files" method="POST" enctype="multipart/form-data">
                                                    <s:hidden name="path" cssClass="a" value="%{#f.getRelativePath()}" />
                                                    <a><s:submit value="%{#f.getName()}" name="submit" /></a>
                                                </s:form>      
                                            </td>
                                        </s:if>
                                        <s:elseif test="#f.isDirectory==false">
                                            <td width="42"><i class="fa fa-file" aria-hidden="true"></i></td>
                                            <td  class="file">
                                                <s:form action="download" method="POST" enctype="multipart/form-data">
                                                    <s:hidden name="filePath" cssClass="a" value="%{#f.getRelativePath()}" />
                                                    <a><s:submit value="%{#f.getName()}" name="submit" /></a>
                                                </s:form> 
                                            </td>
                                        </s:elseif>               

                                        <td width="150"><s:property value="#f.getSize()" /> Kb</td>
                                        <td width="42" class="iconShare">
                                            <s:if test="#f.getOwnerId() == #session.id">
                                               <i class="fa fa-globe" aria-hidden="true"></i>          
                                            </s:if>
                                            <s:else>
                                                <i class="fa fa-lock" aria-hidden="true"></i>
                                            </s:else>                                                                       
                                        </td>

                                        <td width="42" class="iconShare ">
                                            <input type="hidden" class="shareFPath" value="<s:property value="#f.getRelativePath()" />">
                                            <a href="#shareFile" class="shareFileBtn" data-toggle="modal"><i class="fa fa-share-alt" aria-hidden="true"></i></a>                                                                                                           
                                        </td>
                                    </tr>
                                </s:iterator>
                            </tbody>
                            </table>                   
                            <!-- FIM DA TAB PRINCIPAL --> 
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
                                    <p><b>Localização</b> <span id="shareLocation"></span></p>
                                    <div class="field-wrap">
                                        <label>Email do usuário para compartilhar</label>
                                        <input type="email" required autocomplete="off" name="emailShare" required/>
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />    
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
                                    <p><b>Localização</b> <span class="spanLocation"><s:property value="relativePath"/></span></p>
                                    <div class="field-wrap">
                                        <label>Nome da nova pasta</label>
                                        <input type="text" required autocomplete="off" name="newFolder" required/>
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />
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
                                <div class="modal-body">
                                    <p>Você irá fazer o upload de um arquivo dentro do diretório atual.</p>
                                    <p><b>Localização</b> <span class="spanLocation"><s:property value="relativePath"/></span></p>
                                    <div class="upload-btn-wrapper field-wrap">
                                        <button class="button button-block">Escolher um arquivo</button>
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />
                                        <s:hidden name="filePath" value="%{relativePath}" />
                                        <s:file id="upfile" name="fileUpload" label="Arquivo" size="20" />
                                        <p id="nameFile"></p>
                                     </div>
                                </div>
                                <div class="modal-footer">
                                    <s:submit value="Enviar" cssClass="button button-block" name="submit" />
                                </div>
                                </s:form>
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
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />
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
                                        <s:hidden name="beforeFilePath" value="%{relativePath}" />
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
