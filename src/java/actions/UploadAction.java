package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
public class UploadAction extends ActionSupport {
    
    private long storage;
    private String error;
    private String filePath;
    private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;
    private String beforeFilePath;


    public String execute() throws Exception {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);

            if (filePath == null) {
                return "error";
            }  else {
                filePath = request.getServletContext().getRealPath(u.getDir()+filePath);
                storage = u.getStorage();

                //checa se ainda existe espaço para o usuário (10MB por usuario)
                if (storage+fileUpload.length() > 10485760) {
                    System.out.println("EERRRROOOO AQUIIIIIIII MAXXXX STORAGEEEEEE");
                    error = "storageMax";
                    return "storageMax";
                } else {
                    File fileToCreate = new File(filePath, getFileUploadFileName());
                    FileUtils.copyFile(fileUpload, fileToCreate);

                    long newStorage = storage+fileUpload.length();  
                    u.setStorage(newStorage);               
                    dao.updateUser(u);              
                    return "success";

                }
            }
        } catch (Exception ex) {
            return "error";
        }
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

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getBeforeFilePath() {
        return beforeFilePath;
    }

    public void setBeforeFilePath(String beforeFilePath) {
        this.beforeFilePath = beforeFilePath;
    }
           
}