package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.lang.Object;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class FileExplorerAction extends ActionSupport {
    
    private List<model.File> files;
    private List<model.File> filesSharing;
    private String[] breadcrumbs;
    private String path;
    private String relativePath;
    private String user_dir;

    public String execute() throws UnsupportedEncodingException {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String,Object> session = ActionContext.getContext().getSession();
        
        //Pega o usuario salvo na sessao
        UsuarioDAO dao = new UsuarioDAO();
        int id = (int) session.get("id");
        Usuario u = dao.getUserById(id);    

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
            
            String relativePath = fi.getPath().replace(request.getServletContext().getRealPath(u.getDir()), "");
            file.setRelativePath(relativePath);
            files.add(file);
        }
        
        //enche o array de breadcrumbs
        if (relativePath!=null) { //se está no root ou não             
            breadcrumbs = relativePath.split("\\\\");       
        } else {
          breadcrumbs = null;
        }
        
        return "sucess";
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

    public List<model.File> getFilesSharing() {
        return filesSharing;
    }

    public void setFilesSharing(List<model.File> filesSharing) {
        this.filesSharing = filesSharing;
    }  
    
}
