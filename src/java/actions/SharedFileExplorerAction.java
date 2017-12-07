package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Sharing;
import model.SharingDAO;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class SharedFileExplorerAction extends ActionSupport {
    
    private List<model.File> filesSharing;
    private String[] breadcrumbs;
    private String path;
    private String relativePath;
    private int ownerId;
    private String error;

    public String execute() {    
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            SharingDAO sDAO = new SharingDAO();
            
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id); 
            
            //checa se já existe um path 
            if (path == null) {     
                //Pega a lista dos arquivos compartilhados com o usuario da sessão
               List<Sharing> sharedList = sDAO.getShareByUserShare(id);
               if (sharedList == null) {
                   error = "noSharing";
                   return "error";
               }
               filesSharing = new ArrayList<model.File>(); 

               //Lista todos os arquivos compartilhados
               for (Sharing s : sharedList) {
                   Usuario owner = dao.getUserById(s.getUser_owner()); 
                   String p =  request.getServletContext().getRealPath(owner.getDir()+s.getPath());
                   File f = new File(p);

                   model.File file = new model.File();
                   file.setIsDirectory(f.isDirectory());
                   file.setName(f.getName());
                   file.setSize(f.length());
                   file.setPath(f.getPath());
                   file.setOwner(owner.getFirstName());
                   file.setOwnerEmail(owner.getEmail());
                   file.setOwnerId(owner.getId());
                   file.setOwnerImage(owner.getProfile_img());

                   String relativeP = f.getPath().replace(request.getServletContext().getRealPath(owner.getDir()), "");
                   file.setRelativePath(relativeP);
                   filesSharing.add(file);

               }
            } else {
                if (ownerId == 0) {
                    error = "exception";
                    return "error";
                } else {
                    filesSharing = new ArrayList<model.File>(); 
                    
                    //Listar arquivos de diretorio compartilhado
                    Usuario owner = dao.getUserById(ownerId);
                    relativePath = path;
                    path =  request.getServletContext().getRealPath(owner.getDir()+path);
                    File f = new File(path);
                    System.out.println("OOOOOOOOOOOOOOOOOOOO "+path);
                    for (File fi : f.listFiles()) {
                        model.File file = new model.File();
                        file.setIsDirectory(fi.isDirectory());
                        file.setName(fi.getName());
                        file.setSize(fi.length());
                        file.setPath(fi.getPath());
                        file.setOwner(owner.getFirstName());
                        file.setOwnerEmail(owner.getEmail());
                        file.setOwnerId(owner.getId());
                        file.setOwnerImage(owner.getProfile_img());

                        String relativeP = fi.getPath().replace(request.getServletContext().getRealPath(owner.getDir()), "");
                        file.setRelativePath(relativeP);

                        filesSharing.add(file);
                    }
 
                    //enche o array de breadcrumbs
                    if (relativePath!=null) { //se está no root ou não             
                        breadcrumbs = relativePath.split("\\\\");       
                    } else {
                      breadcrumbs = null;
                    } 
                }
            }
            
            /* tentativa de fazer de outro jeito
            
            //checa se já existe um path 
            if (shareId == null) {  
                 System.out.println("OOOOOOOOOOOv  1 s OOOOOOOOO ");
                //Pega a lista dos arquivos compartilhados com o usuario da sessão
               List<Sharing> sharedList = sDAO.getShareByUserShare(id);
               if (sharedList == null) {
                   error = "noSharing";
                   return "error";
               }
               //Lista todos os arquivos compartilhados
               for (Sharing s : sharedList) {
                   Usuario owner = dao.getUserById(s.getUser_owner()); 
                   String p =  request.getServletContext().getRealPath(owner.getDir()+s.getPath());
                   File f = new File(p);

                   model.File file = new model.File();
                   file.setIsDirectory(f.isDirectory());
                   file.setName(f.getName());
                   file.setSize(f.length());
                   file.setPath(f.getPath());
                   file.setOwner(owner.getFirstName());
                   file.setOwnerEmail(owner.getEmail());
                   file.setOwnerId(owner.getId());
                   file.setOwnerImage(owner.getProfile_img());
                   file.setShareId(s.getId());

                   String relativeP = f.getPath().replace(request.getServletContext().getRealPath(owner.getDir()), "");
                   file.setRelativePath(relativeP);
                   filesSharing.add(file);

               }
            } else {
                if (ownerId == null) {
                    error = "exception";
                    return "error";
                } else {
                    System.out.println("OOOOOOOOOOOv  3 s OOOOOOOOO ");
                    
                      System.out.println("OOOOOOOOOOOOOOOOOOOO "+ownerId);
                    
                    //Listar arquivos de diretorio compartilhado
                    int ownerIdInt = Integer.parseInt(ownerId);
                    Usuario owner = dao.getUserById(ownerIdInt);
                    Sharing sh = sDAO.getShareById(Integer.parseInt(shareId));
                    
                     System.out.println("OOOOOOOOOOOOOOOOOOOO "+sh.getUser_owner());
                      System.out.println("OOOOOOOOOOOOOOOOOOOO "+ownerId);
                    if( sh.getUser_owner() == ownerIdInt    ){
                        relativePath = sh.getPath();
                        path =  request.getServletContext().getRealPath(owner.getDir()+relativePath);
                        File f = new File(path);
                        System.out.println("OOOOOOOOOOO path OOOOOOOOO "+path);
                        for (File fi : f.listFiles()) {
                            model.File file = new model.File();
                            file.setIsDirectory(fi.isDirectory());
                            file.setName(fi.getName());
                            file.setSize(fi.length());
                            file.setPath(fi.getPath());
                            file.setOwner(owner.getFirstName());
                            file.setOwnerEmail(owner.getEmail());
                            file.setOwnerId(owner.getId());
                            file.setOwnerImage(owner.getProfile_img());
                            file.setShareId(sh.getId());

                            String relativeP = fi.getPath().replace(request.getServletContext().getRealPath(owner.getDir()), "");
                            file.setRelativePath(relativeP);

                            filesSharing.add(file);
                        }

                        //enche o array de breadcrumbs
                        if (relativePath!=null) { //se está no root ou não             
                            breadcrumbs = relativePath.split("\\\\");       
                        } else {
                          breadcrumbs = null;
                        } 
                    } else {
                        error = "exception";
                        return "error";
                    }
                }
            }
            */
                
            return "success";
        } catch (Exception ex) {
            error = "exception";
            return "error";
        }
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    public String[] getBreadcrumbs() {
        return breadcrumbs;
    }

    public void setBreadcrumbs(String[] breadcrumbs) {
        this.breadcrumbs = breadcrumbs;
    }

    public String getRelativePath() {
        return relativePath;
    }

    public void setRelativePath(String relativePath) {
        this.relativePath = relativePath;
    }

    public List<model.File> getFilesSharing() {
        return filesSharing;
    }

    public void setFilesSharing(List<model.File> filesSharing) {
        this.filesSharing = filesSharing;
    }  

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }
    
}
