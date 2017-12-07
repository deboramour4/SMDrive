package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.security.MessageDigest;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class UpdatePasswordAction extends ActionSupport {
    
    private String oldPassword;
    private String newPassword;
    private String error;


    public String execute() throws Exception {  
        try {
            //pega a requisição http do servlet
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);   
            String hashedOldPass = hashPassword(oldPassword);

            
            if(hashedOldPass.equals(u.getPassword())){   
                String hashedNewPass = hashPassword(newPassword);
                u.setPassword(hashedNewPass);
                dao.updateUser(u);
                error = "none";
                return "success";
            } else {
                error = "wrongPass";
                return "error";
            }

        } catch (Exception ex) {
            return "error";
        }
    }
    
    public String hashPassword(String p) {
        try {
            MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
            byte messageDigest[] = algorithm.digest(p.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
              hexString.append(String.format("%02X", 0xFF & b));
            }
            String cripPassword = hexString.toString(); 
            return cripPassword;
        } catch (Exception ex) {
            return "";
        }
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
    
}
