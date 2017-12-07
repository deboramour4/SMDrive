package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.security.MessageDigest;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class LoginAction extends ActionSupport {
    
    private String email;
    private String password;
    private String path_user;
    private String error;
    

    public String execute() {       
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();

            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = dao.getUserByEmail(email);

            if (usuario == null) {
                error = "noEmail";
                return "error";
            } else {
                //Criptografando a senha para comparar com o banco
                MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
                byte messageDigest[] = algorithm.digest(password.getBytes("UTF-8"));
                StringBuilder hexString = new StringBuilder();
                for (byte b : messageDigest) {
                  hexString.append(String.format("%02X", 0xFF & b));
                }
                String cripPassword = hexString.toString();
                
                if(cripPassword.equals(usuario.getPassword())){   
                    Map<String,Object> session = ActionContext.getContext().getSession();
                    setPath_user(usuario.getDir());
                    session.put("firstName", usuario.getFirstName());
                    session.put("profile_img", usuario.getProfile_img());
                    session.put("id", usuario.getId()); 
                    return "success";
                } else {
                    error = "wrongPass";
                    return "error";
                }
            }      
        } catch (Exception ex) {
            return "error";
        } 
        
       
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPath_user() {
        return path_user;
    }

    public void setPath_user(String path_user) {
        this.path_user = path_user;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
       
}
