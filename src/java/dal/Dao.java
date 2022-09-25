/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Setting;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kieut
 */
public class Dao extends DBContext {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public User login(String email, String password) {
        String query = "select * from user\n"
                + "where email=?\n"
                + "and password=?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Setting> getSettinglist() {
        List<Setting> list = new ArrayList<>();
        String query = "SELECT * FROM swp.setting";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getBoolean(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Setting getSettingbyid(String id) {
        String query = "SELECT * FROM swp.setting\n"
                + "where setting_id=?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()) {
                return new Setting(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getBoolean(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        Dao dao = new Dao();
        Setting u = dao.getSettingbyid("2");
        System.out.println(u);
    }
}
