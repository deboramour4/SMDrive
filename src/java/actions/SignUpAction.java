package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class SignUpAction extends ActionSupport {
    
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String error;
    

    public String execute() {    
        try {
            //Pesquisa o usuario no banco
            UsuarioDAO dao = new UsuarioDAO();
            Usuario tmp = dao.getUserByEmail(email);

            if (tmp == null) {
                //pega a requisição http do servlet
                HttpServletRequest request = ServletActionContext.getRequest();

                //Cria um novo usuario
                Usuario usuario = new Usuario();
                usuario.setFirstName(firstName);
                usuario.setLastName(lastName);
                usuario.setEmail(email);             
                usuario.setProfile_img("img/profile_imgs/default-avatar.png");
                usuario.setDir("");
                
                //Criptografando a senha
                MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
                byte messageDigest[] = algorithm.digest(password.getBytes("UTF-8"));
                StringBuilder hexString = new StringBuilder();
                for (byte b : messageDigest) {
                  hexString.append(String.format("%02X", 0xFF & b));
                }
                String cripPassword = hexString.toString();
                usuario.setPassword(cripPassword);
                
                //Salva o usuário no banco
                dao.saveUser(usuario);
                String user_dir = "/WEB-INF/public/"+usuario.getId()+"_"+usuario.getFirstName();
                dao.setUserDirById(user_dir, usuario.getId());

                //cria um novo diretorio para o usuario no servidor
                String real_path_user = request.getServletContext().getRealPath(user_dir);            
                File f = new File(real_path_user);
                f.mkdir();

                //salva o usuario na sessao
                Map<String,Object> session = ActionContext.getContext().getSession();
                Usuario user = dao.getUserByEmail(email);              
                session.put("firstName", user.getFirstName());
                session.put("profile_img", user.getProfile_img());
                session.put("id", user.getId()); 
                return "success";   
            } else {
                error = "emailExists";
                return "error";
            }
        } catch (Exception ex) {
            return "error";
        }
       
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
   
}
