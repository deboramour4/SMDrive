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
    
    private List<File> files;
    private List<String> breadcrumbs;
    private boolean isDirectory;
    private String path;
    private String dir_user;

    public String execute() throws UnsupportedEncodingException {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String,Object> session = ActionContext.getContext().getSession();
        
        //Pega o usuario salvo na sessao
        UsuarioDAO dao = new UsuarioDAO();
        int id = (int) session.get("id");
        Usuario u = dao.getUserById(id);    

        //checa se já existe um path
        dir_user = ""+u.getDir();    
        if (path == null) {
            path = dir_user;
        } 
        
        //lista de objetos File
        files = new ArrayList<File>();       
        File f = new File(path);
        for (File fi : f.listFiles()) {
            isDirectory = fi.isDirectory();
            files.add(fi);
        }
        
        //enche o array de breadcrumbs
        //String
        String [] tmp_breadcrumbs;
        tmp_breadcrumbs = path.split("\\");
        
        for (int i = 0; i < tmp_breadcrumbs.length; i++) {
            breadcrumbs.add(tmp_breadcrumbs[i]);
        }
        
        return "sucess";
    }
    
            
        //Cria um arquivo raiz com o diretório designado
        //System.out.println("---------------------- 1 -------------------------------- "+path);
    
    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }
    
    public boolean isIsDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(boolean isDirectory) {
        this.isDirectory = isDirectory;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDir_user() {
        return dir_user;
    }

    public void setDir_user(String dir_user) {
        this.dir_user = dir_user;
    }

    public List<String> getBreadcrumbs() {
        return breadcrumbs;
    }

    public void setBreadcrumbs(List<String> breadcrumbs) {
        this.breadcrumbs = breadcrumbs;
    }
    
    
    
}
