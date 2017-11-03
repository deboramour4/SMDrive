package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Debora
 */
public class UsuarioDAO {
    
    public List<Usuario> getAll() {
        List<Usuario> resultado = new ArrayList<Usuario>();
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            Statement s = c.createStatement();
            ResultSet r = s.executeQuery("SELECT * FROM user");
            
            while (r.next()) {
                Usuario p = new Usuario();
                p.setId(r.getInt("id"));
                p.setName(r.getString("name"));
                p.setEmail(r.getString("email"));
                p.setPassword(r.getString("password"));
                resultado.add(p);
            }
            
            r.close();
            s.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
    }
    
    public boolean addUser(String name, String email,String birth, int phone, String password) { //SOMENTE E-MAIL QUE NAO ESTEJA CADASTRADO
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "INSERT INTO \"user\" (name , email, birth, phone, password) VALUES (?, ?, ?)";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
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
        return true;
    }
    
    public boolean updateUser(int id, String name, String email,String birth, int phone, String password) { //SOMENTE E-MAIL QUE NAO ESTEJA CADASTRADO
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "UPDATE \"user\" SET name = ?, email = ?, password = ? WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setInt(4, id);
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
       
    public Usuario getUserByEmail(String email){
        Usuario p = new Usuario();
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "SELECT * FROM \"user\" WHERE email = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setString(1, email);
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                p.setId(r.getInt("id"));
                p.setName(r.getString("name"));
                p.setEmail(r.getString("email"));
                p.setPassword(r.getString("password"));
            }
            pstmt.close();
            r.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return p;
    }
    
    
    public Usuario getUserById(int id){
        Usuario u = new Usuario();
        
        try {
            Class.forName(DbStuff.driver);
            Connection c = DriverManager.getConnection(DbStuff.urlCon, DbStuff.user, DbStuff.password );
            
            String query = "SELECT * FROM \"user\" WHERE id = ?";
            PreparedStatement pstmt = c.prepareStatement(query);
            
            pstmt.setInt(1, id);
            ResultSet r = pstmt.executeQuery();
            
            while(r.next()){
                u.setId(r.getInt("id"));
                u.setName(r.getString("name"));
                u.setEmail(r.getString("email"));
                u.setPassword(r.getString("password"));
            }
            pstmt.close();
            r.close();
            c.close();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return u;
    }  
}
