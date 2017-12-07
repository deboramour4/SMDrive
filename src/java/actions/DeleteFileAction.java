package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
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
public class DeleteFileAction extends ActionSupport {
    
    private String beforeFilePath;
    private long storage;
    private String filePath;
    private String relativeFilePath;

    public String execute() throws UnsupportedEncodingException {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);  
            
            SharingDAO sDAO = new SharingDAO();
            List<Sharing> sharedList = sDAO.getShareByPath(filePath);
       
            //checa se já existe um path 
            if (filePath != null) {
                relativeFilePath = filePath;
                filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
                
                if (sharedList != null) {
                    for (Sharing s : sharedList) {
                        if (s.getUser_owner() == id && s.getPath().equals(relativeFilePath)) {
                            sDAO.deleteShare(s);
                        }
                    }
                }
                
                File folderDelete = new File(filePath);     
                storage = u.getStorage();            
                storage = storage - folderDelete.length(); 
                
                folderDelete.delete();
                u.setStorage(storage);               
                dao.updateUser(u);
                
                return "success";               
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

    public String getBeforeFilePath() {
        return beforeFilePath;
    }

    public void setBeforeFilePath(String beforeFilePath) {
        this.beforeFilePath = beforeFilePath;
    }

    public String getRelativeFilePath() {
        return relativeFilePath;
    }

    public void setRelativeFilePath(String relativeFilePath) {
        this.relativeFilePath = relativeFilePath;
    }
    
}
