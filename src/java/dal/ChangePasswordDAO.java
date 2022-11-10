package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import utility.*;

/**
 *
 * @author SMILY
 */
public class ChangePasswordDAO {
    Connection con;

    public ChangePasswordDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePassword(String password, String email){
        String sql = "UPDATE user SET password = ? WHERE email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, StringMethod.EncodingSHA256(password));
            ps.setString(2, email);
            ps.execute();
        } catch (Exception e) {
        }
    }
}
