package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class UpdateAccountAction extends ActionSupport {
    
    private String firstName;
    private String lastName;
    private String email;
    private String profile_img;

    private String filePath;
    private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;
    
    private String error;

    public String execute() throws Exception {  
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);   

            //Atualiza dos dados do usuario
            u.setEmail(email);
            u.setFirstName(firstName);
            u.setLastName(lastName);

            filePath = request.getServletContext().getRealPath("/img/profile_imgs/"); 

            if (getFileUpload() != null) {
                File fileToCreate = new File(filePath, getFileUploadFileName());
                FileUtils.copyFile(fileUpload, fileToCreate);
                u.setProfile_img("img/profile_imgs/"+getFileUploadFileName());           
            }
            session.put("firstName", u.getFirstName());
            session.put("profile_img", u.getProfile_img());

            dao.updateUser(u);
            
            error = "none";
            return "success";

        } catch (Exception ex) {
             error = "yes";
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

    public String getProfile_img() {
        return profile_img;
    }

    public void setProfile_img(String profile_img) {
        this.profile_img = profile_img;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public File getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(File fileUpload) {
        this.fileUpload = fileUpload;
    }

    public String getFileUploadContentType() {
        return fileUploadContentType;
    }

    public void setFileUploadContentType(String fileUploadContentType) {
        this.fileUploadContentType = fileUploadContentType;
    }

    public String getFileUploadFileName() {
        return fileUploadFileName;
    }

    public void setFileUploadFileName(String fileUploadFileName) {
        this.fileUploadFileName = fileUploadFileName;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
