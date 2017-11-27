package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
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
    

    public String execute() {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
            
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.getUserByEmail(email);
        
        if (usuario == null) {
            return "no_email";
        } else
        if(password.equals(usuario.getPassword())){   
            Map<String,Object> session = ActionContext.getContext().getSession();
            session.put("firstName", usuario.getFirstName());
            session.put("profile_img", usuario.getProfile_img());
            session.put("id", usuario.getId()); 
            return "sucess";
           
        } else {
            return "wrong_pass";
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
   
}
