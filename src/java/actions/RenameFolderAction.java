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
public class RenameFolderAction extends ActionSupport {
    
    private String beforeFilePath;
    private String filePath;
    private String newFilePath;

    public String execute() throws UnsupportedEncodingException {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);    
               
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

                if (!file2.exists()) {
                    file.renameTo(file2);
                    
                    SharingDAO sDAO = new SharingDAO();
                    String relativeP = filePath.replace(request.getServletContext().getRealPath(u.getDir()), "");
                    String relativeNewP = newFilePath.replace(request.getServletContext().getRealPath(u.getDir()), "");
                    List<Sharing> sharedList = sDAO.getShareByPath(relativeP);
                    
                    if (sharedList != null) {
                        for (Sharing s : sharedList) {
                            if (s.getUser_owner() == id) {           
                                s.setPath(relativeNewP);
                                sDAO.updateShare(s);
                            }
                        }
                    }
                }
           
                return "success";
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
