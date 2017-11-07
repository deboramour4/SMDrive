package model;

import java.util.*;
//import javax.websocket.Session;
import org.hibernate.Transaction;
import model.Usuario;
import java.io.Serializable;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;
 
/**
 *
 * @author Debora
 */
public class UsuarioDAO {
   
    public boolean addUser(Usuario usuario) {
        boolean resultado = false;
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();
        
        Usuario tmp = null;
        tmp = getUserByEmail(usuario.getEmail());
        
        if (tmp == null){
            Serializable s = session.save(usuario);
            resultado = (s != null);
            tx.commit();
            session.close();
        } else {
            resultado = false;
        }        
        return resultado;
    }
    
    public Usuario getUserById(int id){
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();

        Usuario u = (Usuario) session.get(Usuario.class, id);
        tx.commit();
        session.close();
        
        return u;
    }
    
    public Usuario setUserDirById(String dir, int id){
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();

        Usuario u = (Usuario) session.get(Usuario.class, id);
        u.setDir(dir);
        
        tx.commit();
        session.close();
               
        return u;
    }
    
    public Usuario getUserByEmail(String email){
        Session session = util.HibernateUtil.getSession();
        
        Query query = session.createQuery("from Usuario where email = :email ");
        query.setParameter("email", email);
        List<Usuario> u = query.list();
        
        if (u.size() == 0 ) {
            return null; 
        } else {
            return u.get(0);
        }
    }
    
    public List<Usuario> getAllUsers () {
        Session session = util.HibernateUtil.getSession();
        Query query = session.createQuery("from Usuario");
        List<Usuario> u = query.list();
        return u;
    }
    
    /*
    
    
    public boolean updateUser(int id, String firstName, String lastName, String email, String password) { //SOMENTE E-MAIL QUE NAO ESTEJA CADASTRADO
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "UPDATE \"user\" SET firstName = ?, lastName = ?, email = ?, password = ? WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setInt(5, id);
            pstmt.executeUpdate();
            
            pstmt.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        System.out.println("Deu tudo certo");
        return true;
    }
       */
}
