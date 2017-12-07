package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
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
public class DeleteFolderAction extends ActionSupport {
    
    private String beforeFilePath;
    private String relativeFilePath;
    private String filePath;
    private long storage;
    private List<Sharing> sharedList;
    private int id;
    private String userDir;
    private SharingDAO sDAO;

    public String execute() throws UnsupportedEncodingException {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            id = (int) session.get("id");
            Usuario u = dao.getUserById(id);  
            userDir = request.getServletContext().getRealPath(u.getDir()); 
            
            sDAO = new SharingDAO();
            sharedList = sDAO.getShareByUserOwner(id);
    
            //checa se já existe um path 
            if (filePath != null) {
                relativeFilePath = filePath;
                filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
                
                File folderDelete = new File(filePath);   
                storage = u.getStorage(); 
                delete(folderDelete);

                u.setStorage(storage);               
                dao.updateUser(u);
                               
                return "success";
            }            
            return "error";
        } catch (Exception ex) {
            return "error";
        }     
    }
    
    public void delete(File path){      
        File[] l = path.listFiles();
        for (File f : l){   
            if (sharedList != null) {
                for (Sharing s : sharedList) {                   
                    String relativeP = f.getPath().replace(userDir, "");
                    if (s.getPath().equals(relativeP)) {
                        sDAO.deleteShare(s);
                    }
                }
            }
            if (f.isDirectory()){
                
                delete(f);
            }
            else {
                setStorage(getStorage() - f.length());
                f.delete();
            }
        }
        path.delete(); 
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

    public List<Sharing> getSharedList() {
        return sharedList;
    }

    public void setSharedList(List<Sharing> sharedList) {
        this.sharedList = sharedList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SharingDAO getsDAO() {
        return sDAO;
    }

    public void setsDAO(SharingDAO sDAO) {
        this.sDAO = sDAO;
    }

    public String getUserDir() {
        return userDir;
    }

    public void setUserDir(String userDir) {
        this.userDir = userDir;
    }
    
    
    
    
}
