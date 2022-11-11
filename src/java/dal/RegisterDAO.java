package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.*;
import utility.*;

/**
 *
 * @author SMILY
 */
public class RegisterDAO extends DBContext {

    Connection con;

    public RegisterDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<User> getAll() {
        String sql = "SELECT * FROM user";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
<<<<<<< .merge_file_a11608
                User user = new User(rs.getInt(1), rs.getNString(2), rs.getString(3), rs.getString(4), rs.getString(5),                        
                        rs.getString(6), rs.getNString(7), rs.getBoolean(8));
=======
                User user = new User(rs.getInt(1), rs.getNString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getBoolean(7), rs.getNString(8));
>>>>>>> .merge_file_a17076
                list.add(user);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public User getUserByEmail(String email){
        String sql = "SELECT * FROM user Where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
<<<<<<< .merge_file_a11608
                User user = new User(rs.getInt(1), rs.getNString(2), rs.getString(3), rs.getString(4), rs.getString(5),                        
                        rs.getString(6), rs.getNString(7), rs.getBoolean(8));
=======
                User user = new User(rs.getInt(1), rs.getNString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getBoolean(7), rs.getNString(8));
>>>>>>> .merge_file_a17076
                return user;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertUser(String full_name, String email, String mobile, String password, boolean status) {
        String sql = "INSERT INTO user(full_name, email, mobile, password, status) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, full_name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, StringMethod.EncodingSHA256(password));
            ps.setBoolean(5, status);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) throws Exception {
        RegisterDAO myConnect = new RegisterDAO();
//        myConnect.insertUser("Nguyễn Thị Loan", "loanht35@gmail.com", "0123456789", "loan123", true);
//        myConnect.insertUser("Nguyễn Văn Mạnh", "manhvnvjppro@gmail.com", "0363016214", "manh123", true);
//        myConnect.insertUser("Hoàng Kim Nam", "namhehehe123@gmail.com", "02413791030", "nam123", true);
    }

}
