package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class DownloadSharedAction extends ActionSupport {
    
    public String fileName;
    public String filePath;
    public InputStream inputStream;
    public String user_dir;
    public String ownerId;
    
    public String execute() throws Exception {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            Usuario u = dao.getUserById(Integer.parseInt(ownerId));
                      

            //checa se já existe um path 
            if (filePath != null) {
                filePath = request.getServletContext().getRealPath(u.getDir()+filePath);

                File f = new File(filePath);
                setFileName(f.getName());
                inputStream = new FileInputStream(f);
                return "success";
            }
            return "error";
        } catch (Exception ex) {
            return "error";
        } 
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getUser_dir() {
        return user_dir;
    }

    public void setUser_dir(String user_dir) {
        this.user_dir = user_dir;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }
    
        
}