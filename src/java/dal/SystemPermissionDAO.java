package dal;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author SMILY
 */
public class SystemPermissionDAO extends DBContext {

    Connection con;

    public SystemPermissionDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getAmount() {
        String sql = "SELECT COUNT(ul.user_id)\n"
                + "FROM setting s join `permission` p on s.setting_id = p.screen_id join user_role ul on p.setting_id = ul.setting_id join setting s1 on p.setting_id = s1.setting_id\n";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<SystemPermission> getAll(int limit, int offset, int role_id, int screen_id) {
        String sql = "";
        List<SystemPermission> list = new ArrayList<>();
        if (role_id == 0 && screen_id == 0) {
            sql = "SELECT distinct(ul.setting_id), s1.setting_title, s.setting_title, s.setting_value, p.*\n"
                    + "FROM setting s join `permission` p on s.setting_id = p.screen_id join user_role ul on p.setting_id = ul.setting_id join setting s1 on p.setting_id = s1.setting_id\n"
                    + "ORDER BY s1.setting_title limit ? offset ?";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, limit);
                ps.setInt(2, offset);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new SystemPermission(rs.getString(2), rs.getInt(5), rs.getString(3), rs.getInt(1), rs.getBoolean(7), rs.getBoolean(8), rs.getBoolean(9), rs.getBoolean(10)));
                }
            } catch (Exception e) {
            }
        } else if (role_id != 0 && screen_id == 0) {
            sql = "SELECT distinct(ul.setting_id), s1.setting_title, s.setting_title, s.setting_value, p.*\n"
                    + "FROM setting s join `permission` p on s.setting_id = p.screen_id join user_role ul on p.setting_id = ul.setting_id join setting s1 on p.setting_id = s1.setting_id\n"
                    + "where p.setting_id = ?\n"
                    + "ORDER BY s1.setting_title limit ? offset ?";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, role_id);
                ps.setInt(2, limit);
                ps.setInt(3, offset);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new SystemPermission(rs.getString(2), rs.getInt(5), rs.getString(3), rs.getInt(1), rs.getBoolean(7), rs.getBoolean(8), rs.getBoolean(9), rs.getBoolean(10)));
                }
            } catch (Exception e) {
            }
        } else if (role_id == 0 && screen_id != 0) {
            sql = "SELECT distinct(ul.setting_id), s1.setting_title, s.setting_title, s.setting_value, p.*\n"
                    + "FROM setting s join `permission` p on s.setting_id = p.screen_id join user_role ul on p.setting_id = ul.setting_id join setting s1 on p.setting_id = s1.setting_id\n"
                    + "where p.screen_id = ?\n"
                    + "ORDER BY s1.setting_title limit ? offset ?";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, screen_id);
                ps.setInt(2, limit);
                ps.setInt(3, offset);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new SystemPermission(rs.getString(2), rs.getInt(5), rs.getString(3), rs.getInt(1), rs.getBoolean(7), rs.getBoolean(8), rs.getBoolean(9), rs.getBoolean(10)));
                }
            } catch (Exception e) {
            }
        } else {
            sql = "SELECT distinct(ul.setting_id), s1.setting_title, s.setting_title, s.setting_value, p.*\n"
                    + "FROM setting s join `permission` p on s.setting_id = p.screen_id join user_role ul on p.setting_id = ul.setting_id join setting s1 on p.setting_id = s1.setting_id\n"
                    + "where p.setting_id = ? AND p.screen_id = ?\n"
                    + "ORDER BY s1.setting_title limit ? offset ?";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, role_id);
                ps.setInt(2, screen_id);
                ps.setInt(3, limit);
                ps.setInt(4, offset);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new SystemPermission(rs.getString(2), rs.getInt(5), rs.getString(3), rs.getInt(1), rs.getBoolean(7), rs.getBoolean(8), rs.getBoolean(9), rs.getBoolean(10)));
                }
            } catch (Exception e) {
            }
        }

        return list;
    }

    public HashMap<Integer, String> getRoles() {
        String sql = "SELECT * FROM setting WHERE type_id = 1";
        HashMap<Integer, String> hashMap = new HashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hashMap.put(rs.getInt(1), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return hashMap;
    }

    public HashMap<Integer, String> getScreens() {
        String sql = "SELECT * FROM setting WHERE type_id = 5";
        HashMap<Integer, String> hashMap = new HashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hashMap.put(rs.getInt(1), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return hashMap;
    }

    public void updatePermission(int screen_id, int setting_id, String col, int value) {
        String sql = "UPDATE permission SET " + col + " = ? WHERE screen_id = ? AND setting_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, value);
            ps.setInt(2, screen_id);
            ps.setInt(3, setting_id);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        SystemPermissionDAO spdao = new SystemPermissionDAO();
    }
}
