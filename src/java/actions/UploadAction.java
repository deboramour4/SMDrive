package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class UploadAction extends ActionSupport {
    
    public String filePath;
    public File fileUpload;
    public String fileUploadContentType;
    public String fileUploadFileName;


    public String execute() throws Exception {
        
        if (filePath != null) {
            filePath = getFilePath();
            File fileToCreate = new File(filePath, getFileUploadFileName());
            FileUtils.copyFile(fileUpload, fileToCreate);
            return "success";
        } /* else {
            HttpServletRequest request = ServletActionContext.getRequest();
            filePath = request.getServletContext().getRealPath("/img/profile_imgs");
            File fileToCreate = new File(filePath, getFileUploadFileName());
            FileUtils.copyFile(fileUpload, fileToCreate);
            return "profile_img";
        }*/
        return "error";
        
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
           
}