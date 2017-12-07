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
public class SharingDAO {
   
    public boolean saveShare(Sharing share) {
        boolean resultado = false;
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();
                
        Serializable s = session.save(share);
        resultado = (s != null);
        tx.commit();
        session.close();
        
        return resultado;
    }
    
    public boolean updateShare(Sharing share) {
        boolean resultado = false;
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();
                
        session.update(share);
        tx.commit();
        session.close();

        return resultado;
    }
    
    public boolean deleteShare(Sharing share) {
        boolean resultado = false;
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();
                
        session.delete(share);
        tx.commit();
        session.close();

        return resultado;
    }
    
    public Sharing getShareById(int id){
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();

        Sharing s = (Sharing) session.get(Sharing.class, id);
        tx.commit();
        session.close();
        
        return s;
    }
    
    /*public Usuario setUserDirById(String dir, int id){
        Session session = util.HibernateUtil.getSession();
        Transaction tx = session.beginTransaction();

        Usuario u = (Usuario) session.get(Usuario.class, id);
        u.setDir(dir);
        
        tx.commit();
        session.close();
               
        return u;
    }*/
    
    public List<Sharing> getShareByPath(String path){
        Session session = util.HibernateUtil.getSession();
        
        Query query = session.createQuery("from Sharing where path = :path ");
        query.setParameter("path", path);
        List<Sharing> s = query.list();
        
        session.close();
        
        if (s.size() == 0 ) {
            System.out.println("Compartilhamento NÃO EXISTE");
            return null; 
        } else {
            System.out.println("Compartilahmento EXISTE");
            return s;
        }
    }
    
    public List<Sharing> getShareByUserShare(int user_share){
        Session session = util.HibernateUtil.getSession();
        
        Query query = session.createQuery("from Sharing where user_share = :user_share");
        query.setParameter("user_share", user_share);
        List<Sharing> s = query.list();
        
        session.close();
        
        if (s.size() == 0 ) {
            System.out.println("Compartilhamento NÃO EXISTE");
            return null; 
        } else {
            System.out.println("Compartilahmento EXISTE");
            return s;
        }
    }
    
    public List<Sharing> getShareByUserOwner(int user_owner){
        Session session = util.HibernateUtil.getSession();
        
        Query query = session.createQuery("from Sharing where user_owner = :user_owner");
        query.setParameter("user_owner", user_owner);
        List<Sharing> s = query.list();
        
        session.close();
        
        if (s.size() == 0 ) {
            System.out.println("Compartilhamento NÃO EXISTE");
            return null; 
        } else {
            System.out.println("Compartilahmento EXISTE");
            return s;
        }
    }
    
    public List<Sharing> getAllSharing () {
        Session session = util.HibernateUtil.getSession();
        Query query = session.createQuery("from Sharing");
        List<Sharing> s = query.list();
        session.close();
        
        return s;
    }
    
}
