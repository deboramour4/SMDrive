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
public class SignUpAction extends ActionSupport {
    
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String user_dir;
    

    public String execute() {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
        
        //Cria um novo usuario
        Usuario usuario = new Usuario();
        usuario.setFirstName(firstName);
        usuario.setLastName(lastName);
        usuario.setEmail(email);
        usuario.setPassword(password);
        usuario.setDir("");
        
        //Salva o usuário no banco
        UsuarioDAO dao = new UsuarioDAO();
        boolean resultado = dao.addUser(usuario);
                              
        //pega o path do diretório no servidor
        user_dir = request.getServletContext().getRealPath("/WEB-INF/public/"+usuario.getId()+"_"+usuario.getFirstName());
        //salva o diretorio do usuario no objeto
        dao.setUserDirById(user_dir, usuario.getId());
        
        //cria um novo diretorio para o usuario no servidor
        File f = new File(user_dir);
        f.mkdir();
        
        //salva o usuario na sessao
        if(resultado){
            Map<String,Object> session = ActionContext.getContext().getSession();
            Usuario user = dao.getUserByEmail(email);
                      
            session.put("nome", user.getFirstName());
            session.put("id", user.getId()); 
            return "sucess";
           
        } else {
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

    public String getUser_dir() {
        return user_dir;
    }

    public void setUser_dir(String user_dir) {
        this.user_dir = user_dir;
    }
   
}
