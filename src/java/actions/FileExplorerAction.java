package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 *
 * @author Débora
 */
public class FileExplorerAction extends ActionSupport {
    
    private List<File> files;
    private boolean isDirectory;
    private String path;
    //private String path;

    public String execute() throws UnsupportedEncodingException {
        String pathE = encode(path);
        System.out.println(path);
        System.out.println(pathE);
        File f = new File(pathE);
        files = new ArrayList<File>();
        for (File fi : f.listFiles()) {
            isDirectory = fi.isDirectory();
            files.add(fi);
        }
        return "sucess";
    }

    public String encode(String s) throws UnsupportedEncodingException{
        String encode;
        encode = URLEncoder.encode(s, "UTF-8");
        return encode;
    }
    
    public String decode(String s) throws UnsupportedEncodingException{
        System.out.println(URLDecoder.decode("%5c", "UTF-8"));
        return s;
    }
    
    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }
    
    public boolean isIsDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(boolean isDirectory) {
        this.isDirectory = isDirectory;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
