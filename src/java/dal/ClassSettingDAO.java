/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ClassModel;
import Model.ClassSetting;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ClassSettingDAO {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<ClassSetting> getClassSetting() {
        List<ClassSetting> list = new ArrayList<>();
        String query = "SELECT * FROM class_setting";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassSetting(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }
        
    public List<ClassSetting> getClassSettinglistByUserID(int user_id, int limit, int curPage) {
        List<ClassSetting> list = new ArrayList<>();
        int offset = (curPage - 1) * limit;
        String query = "select * from class_setting where class_id in (select class_id from class_user where user_user_id=?) limit ? offset ?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassSetting(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public ClassSetting getSettingbyid(String id) {
        String query = "SELECT * FROM swp.class_setting where setting_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new ClassSetting(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    
    public List<ClassSetting> searchClassSetting(String classmodel, String status, String title) {
        List<ClassSetting> list = new ArrayList<>();
        String query = "SELECT * FROM class_setting;";

        if (classmodel.equalsIgnoreCase("all")) {
            classmodel = "is not null";
        } else {
            classmodel = "= '" + classmodel + "'";
        }
        if (status.equalsIgnoreCase("active")) {
            status = "= 1";
        } else if (status.equalsIgnoreCase("deactive")) {
            status = "= 0";
        } else {
            status = "is not null";
        }
        if (title.isEmpty()) {
            title = "is not null";
        } else {
            title = "= '" + title + "'";
        }
        query = "SELECT * FROM class_setting  WHERE class_id " + classmodel + " and status " + status + " and setting_title " + title;
        System.out.println(query);
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassSetting(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public void InsertClassSetting(int type_id, String setting_tiltle, String setting_value, String display_order, boolean status, String description, int class_id) {
        String sql = "insert into class_setting (type_id, setting_title, setting_value, display_order, status, description, class_id) values (?,?,?,?,?,?,?);";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, type_id);
            ps.setString(2, setting_tiltle);
            ps.setString(3, setting_value);
            ps.setString(4, display_order);
            ps.setBoolean(5, status);
            ps.setString(6, description);
            ps.setInt(7, class_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("inserted");
    }

    public void UpdateClassSetting(int setting_id, int type_id, String setting_tiltle, String setting_value, String display_order, boolean status, String description, int class_id) {
        String sql = "update class_setting set type_id=?, setting_title=?, setting_value=?, display_order=?, status=?, description=?, class_id=? where setting_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, type_id);
            ps.setString(2, setting_tiltle);
            ps.setString(3, setting_value);
            ps.setString(4, display_order);
            ps.setBoolean(5, status);
            ps.setString(6, description);
            ps.setInt(7, class_id);
            ps.setInt(8, setting_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void DeleteClassSetting(int setting_id) {
        String sql = "DELETE FROM class_setting WHERE setting_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, setting_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public static void main(String[] args) {
        ClassSettingDAO cs = new ClassSettingDAO();
//        cs.UpdateClassSetting(2, 3, "van vay a", "okioki", "ko order ha", true, "love u chu ca mo", 2);
//        cs.DeleteClassSetting(24);
//        System.out.println(cs.getSettingbyid("2").getSetting_tiltle());
//        List<ClassSetting> list = cs.getClassSettinglist(1, 10, 1);
//        for (ClassSetting item : list) {
//            System.out.println(item.getSetting_id());
//        }
//
//        int page = (int) 15 / 10 + (15 % 10 == 0 ? 0 : 1);
//
//        System.out.println(page);
    }
}
