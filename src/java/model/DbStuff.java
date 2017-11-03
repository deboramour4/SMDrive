/*
 * Essa classe foi criada para facilitar a manipulação do DB
 * Caso seja necessário mudar o usuário ou senha, por exemplo, só precisa ser alterado nesta classe.
 */
package model;

/**
 *
 * @author Débora
 */
public class DbStuff {
    static public String driver = "org.postgresql.Driver";
    static public String urlCon = "jdbc:postgresql://localhost:5432/looksup";
    static public String user = "postgres";
    static public String password = "debora123";         
}
