package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.lang.Object;
import model.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class CreateFileAction extends ActionSupport {
    
    private Usuario user;
    private String path;

    public String execute() throws UnsupportedEncodingException {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
            
        //pega o path do diretório no servidor
        path = request.getServletContext().getRealPath("/WEB-INF/public/"+user.getId()+"_"+user.getFirstName());
        
        File f = new File(path);
        f.mkdir();
        return "sucess";
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }
    
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
