package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
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
public class ShareFolderAction extends ActionSupport {
    
    private String beforeFilePath;
    private String path;
    private String emailShare;

    public String execute() throws UnsupportedEncodingException {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);    

            if (path != null) {
                Usuario u_share = dao.getUserByEmail(emailShare);
                
                Sharing share = new Sharing();
                SharingDAO sDAO = new SharingDAO();

                share.setPath(path);
                share.setUser_owner(id);
                share.setUser_share(u_share.getId());

                sDAO.saveShare(share);
                return "success";            
            }            
            return "error";
        } catch (Exception ex) {
            return "error";
        }     
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getEmailShare() {
        return emailShare;
    }

    public void setEmailShare(String emailShare) {
        this.emailShare = emailShare;
    }

    public String getBeforeFilePath() {
        return beforeFilePath;
    }

    public void setBeforeFilePath(String beforeFilePath) {
        this.beforeFilePath = beforeFilePath;
    }
    
}
