package actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author Débora
 */
public class LogoutAction extends ActionSupport {
      
    public String execute() {       
        Map<String,Object> session = ActionContext.getContext().getSession();
        session.clear();
        return "sucess";  
    }
   
}
