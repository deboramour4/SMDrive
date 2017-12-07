package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Sharing;
import model.SharingDAO;
import model.Usuario;
import model.UsuarioDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Débora
 */
public class DeleteUserAction extends ActionSupport {

    
    public String execute() throws UnsupportedEncodingException {
        try {
            //pega a requisição http do servlet
            HttpServletRequest request = ServletActionContext.getRequest();
            Map<String,Object> session = ActionContext.getContext().getSession();

            //Pega o usuario salvo na sessao
            UsuarioDAO dao = new UsuarioDAO();
            int id = (int) session.get("id");
            Usuario u = dao.getUserById(id);    
   
            String filePath = request.getServletContext().getRealPath(u.getDir());
            System.out.println(filePath+" -- delete folder ----------ASIDJFOSIDFJSODIFJSODIFJSODIFJSODIFJSODIFJOSDIFJSODFIJDS-------- -------------------------");
            File folderDelete = new File(filePath);
            delete(folderDelete);
            
            //Apaga todos os compartilhamentos
            SharingDAO sDAO = new SharingDAO();
            List<Sharing> sharedList1 = sDAO.getShareByUserOwner(id);
            List<Sharing> sharedList2 = sDAO.getShareByUserShare(id);

            if (sharedList1 != null) {
                for (Sharing s1 : sharedList1) { 
                    sDAO.deleteShare(s1);
                }
            }
            if (sharedList2 != null) {
                for (Sharing s2 : sharedList2) { 
                    sDAO.deleteShare(s2);
                }
            }
 
            dao.deleteUser(u);
            return "success";      
        } catch (Exception ex) {
            return "error";
        }     
    }
    
    public void delete(File path){
        File[] l = path.listFiles();
        for (File f : l){
            if (f.isDirectory())
                delete(f);
            else
                f.delete();
        }
        path.delete(); 
    }   
    
}
