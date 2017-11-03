package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.lang.Object;

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
public class FileExplorerAction extends ActionSupport {
    
    private List<File> files;
    private boolean isDirectory;
    private String path;

    public String execute() throws UnsupportedEncodingException {       
        //pega a requisição http do servlet
        HttpServletRequest request = ServletActionContext.getRequest();
            
        //pega o path do diretório no servidor
        //path = request.getServletContext().getRealPath("/WEB-INF/public");
        
        //lista de objetos File
        files = new ArrayList<File>();
        
        //Cria um arquivo raiz com o diretório designado
        File f = new File(path);
        
        // Retorna o array de files
        for (File fi : f.listFiles()) {
            isDirectory = fi.isDirectory();
            files.add(fi);
        }
        return "sucess";
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