package dal;

/**
 *
 * @author dan2k
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    Connection con;
    
    public Connection getConnection() throws Exception {
        String user = "root";
        String pass = "danpott123";
        String url = "jdbc:mysql://localhost:3306/swp";
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        return con;
    }
    
    
}

class Using{
    public static void main(String[] args) {
        try {
            Connection con = new DBContext().getConnection();
            System.out.println("Successfully!!!");
        } catch (Exception e) {
            System.out.println("Failed!!!" + e.getMessage());
        }
    }
    
    public Connection getConnection() {
        try {
            String user = "root";
            String pass = "Kkkkk1312@";
            String url = "jdbc:mysql://localhost:3306/swp?zeroDateTimeBehavior=CONVERT_TO_NULL";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
}
