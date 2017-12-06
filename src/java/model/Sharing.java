package model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Id;

/**
 *
 * @author Debora
 */
@Entity
public class Sharing {
    
    @Id
    @GeneratedValue
    private Integer id;
    
    @Column(nullable = false)
    private Integer user_share;
    
    @Column(nullable = false)
    private Integer user_owner;
    
    @Column(nullable = false)
    private String path;
    
 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_share() {
        return user_share;
    }

    public void setUser_share(int user_share) {
        this.user_share = user_share;
    }

    public Integer getUser_owner() {
        return user_owner;
    }

    public void setUser_owner(Integer user_owner) {
        this.user_owner = user_owner;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
        
}

