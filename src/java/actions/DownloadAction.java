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
public class DownloadAction extends ActionSupport {
    
    public String fileName;
    public String filePath;
    public InputStream inputStream;
    public String user_dir;
    
    public String execute() throws Exception {
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String,Object> session = ActionContext.getContext().getSession();
        
        //Pega o usuario salvo na sessao
        UsuarioDAO dao = new UsuarioDAO();
        int id = (int) session.get("id");
        Usuario u = dao.getUserById(id);    

        //checa se já existe um path 
        if (filePath != null) {
            filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
    
            File f = new File(filePath);
            setFileName(f.getName());
            inputStream = new FileInputStream(f);
            return "success";
        }
        return "error";
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
    
        
}