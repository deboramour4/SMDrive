package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
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
public class RenameFolderAction extends ActionSupport {
    
    private String beforeFilePath;
    private String filePath;
    private String newFilePath;

    public String execute() throws UnsupportedEncodingException {
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String,Object> session = ActionContext.getContext().getSession();
        
        //Pega o usuario salvo na sessao
        UsuarioDAO dao = new UsuarioDAO();
        int id = (int) session.get("id");
        Usuario u = dao.getUserById(id);    
        
        try {
            //checa se já existe um path 
                if (filePath == null) {
                    filePath = request.getServletContext().getRealPath(u.getDir()+beforeFilePath);
                    newFilePath = request.getServletContext().getRealPath(u.getDir()+"\\"+newFilePath);
                }  else {
                    filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
                    newFilePath = request.getServletContext().getRealPath(u.getDir()+beforeFilePath+"\\"+newFilePath);
                }
                File file = new File(filePath);
       
                File file2 = new File(newFilePath);

                if (!file2.exists())
                    file.renameTo(file2);

                System.out.println(filePath+" -- rename folder ------------------ 1 -------------------------");
                System.out.println(newFilePath+" -- rename folder ------------------ 2 -------------------------");            
                return "sucess";
        } catch (Exception ex) {
            return "error";
        } 
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getNewFilePath() {
        return newFilePath;
    }

    public void setNewFilePath(String newFilePath) {
        this.newFilePath = newFilePath;
    }

    public String getBeforeFilePath() {
        return beforeFilePath;
    }

    public void setBeforeFilePath(String beforeFilePath) {
        this.beforeFilePath = beforeFilePath;
    }
    
    
}
