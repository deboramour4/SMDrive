package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;

/**
 *
 * @author Débora
 */
public class CreateFolderAction extends ActionSupport {
    
    private String path;
    private String newFolder;

    public String execute() throws UnsupportedEncodingException {
        path = path+"/"+newFolder;
        File f = new File(path);
        f.mkdir();
        return "sucess";
    }
    
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getNewFolder() {
        return newFolder;
    }

    public void setNewFolder(String newFolder) {
        this.newFolder = newFolder;
    }
    
    
}
