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
public class DeleteFileAction extends ActionSupport {
    
    private long storage;
    private String filePath;

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
            if (filePath != null) {
                filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
                System.out.println(filePath+" -- delete file ------------------ -------------------------");
                File folderDelete = new File(filePath);
                storage = u.getStorage();
                System.out.println(storage+" -- storage u.getStorage ------------------ -------------------------"); 
                
                storage = storage - folderDelete.length(); 
                
                folderDelete.delete();
           
                System.out.println(storage+" -- stprage depois de deletar------------------ -------------------------");
                u.setStorage(storage);               
                dao.updateUser(u);
                
                return "sucess";               
            }            
            return "error";
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

    public long getStorage() {
        return storage;
    }

    public void setStorage(long storage) {
        this.storage = storage;
    }
  
}
