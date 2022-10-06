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

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public User login(String email, String password) {
        String query = "select * from user\n"
                + "where email=?\n"
                + "and password=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
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
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
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
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
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

    public void UpdatePesonalInfo(int user_id, String name, String mobile) {
        String sql = "update user set full_name=?, mobile=? where user_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(3, user_id);
            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void UpdateAvatarURL(int user_id, String avatar_url) {
        String sql = "update User set avatar_url=? where user_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(2, user_id);
            ps.setString(1, avatar_url);
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void UpdateActive(int user_id, boolean active) {
        String sql = "update User set active=? where user_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(2, user_id);
            ps.setBoolean(1, active);
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void insertContact(String full_name, String email, String mobile, String message) {
        String sql = "INSERT INTO web_contact(full_name, email, mobile, message) values(?,?,?,?)";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, full_name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setNString(4, message);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        Dao dao = new Dao();
//        Setting u = dao.getSettingbyid("2");
//        User u = dao.login("anhnapu@mail.com", "Kkkkk1312");
//        System.out.println(u);
//        dao.insertContact("anh", "anh@mail.com", "085", "lalal");

    }
}
