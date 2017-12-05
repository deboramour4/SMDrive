package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class CreateFolderAction extends ActionSupport {
    
    private String path;
    private String newFolder;

    public String execute() throws UnsupportedEncodingException {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String,Object> session = ActionContext.getContext().getSession();
        
        //Pega o usuario salvo na sessao
        UsuarioDAO dao = new UsuarioDAO();
        int id = (int) session.get("id");
        Usuario u = dao.getUserById(id);    

        String filePath = request.getServletContext().getRealPath(u.getDir());
        if (path == null) {
            path = request.getServletContext().getRealPath(u.getDir()+"/"+newFolder);
        } else {
            path = request.getServletContext().getRealPath(u.getDir()+path+"/"+newFolder);
        }
        File f = new File(path);
        f.mkdir();
        return "sucess";

    }
    
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getNewFolder() {
        return newFolder;
    }

    public void setNewFolder(String newFolder) {
        this.newFolder = newFolder;
    }
    
    
}
