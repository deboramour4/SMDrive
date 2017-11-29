package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Débora
 */
public final class HibernateUtil {

    private static Configuration configuration;
    private static SessionFactory sessionFactory;
    
    static {
        configuration = new Configuration();
        configuration.configure();
        StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder()
                .configure("hibernate.cfg.xml")
                .build();
        sessionFactory = configuration.buildSessionFactory(standardRegistry);
        System.out.println("Passou!");
    }
    
    private HibernateUtil() {

    }

    public static final Session getSession() {
        Session session = null;
        try {
            session = sessionFactory.getCurrentSession();
        } catch(Exception ex) {
            session = sessionFactory.openSession();
        }
        if (session == null) {
            session = sessionFactory.openSession();
        }
        return session;
    }

}
