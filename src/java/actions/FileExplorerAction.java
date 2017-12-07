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
public class FileExplorerAction extends ActionSupport {
    
    private List<model.File> files;
    private String[] breadcrumbs;
    private String path;
    private String relativePath;
    private String user_dir;
    private String error;

    public String execute() {    
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);    
            
            SharingDAO sDAO = new SharingDAO();
            
            //checa se já existe um path
            user_dir = request.getServletContext().getRealPath(u.getDir());  
            if (path == null) {
                path = user_dir;
            } else {
                relativePath = path;
                path = request.getServletContext().getRealPath(u.getDir()+path);
            }
                 
            //lista de objetos File
            files = new ArrayList<model.File>();       
            File f = new File(path);
            for (File fi : f.listFiles()) {
                model.File file = new model.File();
                file.setIsDirectory(fi.isDirectory());
                file.setName(fi.getName());
                file.setSize(fi.length());
                file.setPath(fi.getPath());

                String relativePathF = fi.getPath().replace(request.getServletContext().getRealPath(u.getDir()), "");
                file.setRelativePath(relativePathF);
                
                //Lista de arquivos compartilhados por proprietario
                List<Sharing> shares = sDAO.getShareByUserOwner(id);
                if (shares != null) {
                    for (Sharing s : shares) {
                        if (s.getPath().equals(relativePathF)){
                            file.setOwnerId(id);
                        }
                    }
                }
                
                files.add(file);
            }

            //enche o array de breadcrumbs
            if (relativePath!=null) { //se está no root ou não             
                breadcrumbs = relativePath.split("\\\\");       
            } else {
              breadcrumbs = null;
            }       
            return "success";
        } catch (Exception ex) {
            return "error";
        }
    }
   
    public List<model.File> getFiles() {
        return files;
    }

    public void setFiles(List<model.File> files) {
        this.files = files;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUser_dir() {
        return user_dir;
    }

    public void setUser_dir(String user_dir) {
        this.user_dir = user_dir;
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
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
