/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Classes;
import Model.Setting;
import Model.Subject;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class ClassDBContext extends ADBContext<Classes> {

     @Override
     public ArrayList<Classes> list() {
          ArrayList<Classes> classes = new ArrayList<>();
          try {
               String sql = "Select c.class_id, c.class_code, s.setting_title,sb.subject_code,sb.subject_name ,u1.full_name as trainer_id, u2.full_name as supporter_id, c.status \n"
                       + "       from class c Inner Join setting s On c.term_id = s.setting_id\n"
                       + "       Left join user u1 ON c.trainer_id = u1.user_id \n"
                       + "       Left join user u2 on c.supporter_id = u2.user_id \n"
                       + "       Left join subject sb On c.subject_id = sb.subject_id";
               PreparedStatement stm = connection.prepareStatement(sql);
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    Classes c = new Classes();
                    c.setClass_id(rs.getInt("class_id"));
                    c.setClass_code(rs.getString("class_code"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    c.setTerm_id(s);
                    Subject sb = new Subject();
                    sb.setSubject_code(rs.getString("subject_code"));
                    sb.setSubject_name(rs.getString("subject_name"));
                    c.setSubject(sb);
                    User u1 = new User();
                    u1.setFull_name(rs.getString("trainer_id"));
                    c.setTrainer_id(u1);
                    User u2 = new User();
                    u2.setFull_name(rs.getString("supporter_id"));
                    c.setSupporter_id(u2);
                    c.setStatus(rs.getBoolean("status"));
                    classes.add(c);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return classes; // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public Classes get(int id) {
          try {
               String sql = "Select c.class_id,c.class_code, s.subject_code,s.subject_name,se.setting_title, u1.full_name as trainer, u2.full_name as supporter, c.status, c.description\n"
                       + "from class c Inner join subject s On c.subject_id = s.subject_id\n"
                       + "Left join Setting se On c.term_id = se.setting_id \n"
                       + "Left join user u1 on u1.user_id = c.trainer_id\n"
                       + "Left join user u2 on u2.user_id = c.supporter_id\n"
                       + "where c.class_id = ?";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setInt(1, id);
               ResultSet rs = stm.executeQuery();
               if (rs.next()) {
                    Classes c = new Classes();
                    c.setClass_id(rs.getInt("class_id"));
                    c.setClass_code(rs.getString("class_code"));
                    Subject sj = new Subject();
                    sj.setSubject_code(rs.getString("subject_code"));
                    sj.setSubject_name(rs.getString("subject_name"));
                    c.setSubject(sj);
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    c.setTerm_id(s);
                    User u1 = new User();
                    u1.setFull_name(rs.getString("trainer"));
                    c.setTrainer_id(u1);
                    User u2 = new User();
                    u2.setFull_name(rs.getString("supporter"));
                    c.setSupporter_id(u2);
                    c.setStatus(rs.getBoolean("status"));
                    c.setDescription(rs.getString("description"));
                    return c;
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return null;
     }

     public ArrayList<Classes> filter(Integer subjectid, Integer settingid, Integer trainerid, Integer supporterid, Boolean status) {
          ArrayList<Classes> classes = new ArrayList<>();
          try {
               String sql = " Select c.class_id, c.class_code, s.setting_title, u1.full_name as trainer_id, u2.full_name as supporter_id, c.status \n"
                       + " from class c Inner Join setting s On c.term_id = s.setting_id\n"
                       + " Inner join user u1 ON c.trainer_id = u1.user_id \n"
                       + " Inner join user u2 on c.supporter_id = u2.user_id \n"
                       + " Inner join subject sj on c.subject_id = sj.subject_id\n"
                       + " where (1 = 1)";
               int count = 0;
               HashMap<Integer, Object> params = new HashMap<>();

               if (subjectid != null) {
                    count++;
                    sql += "AND sj.subject_id = ?\n";
                    params.put(count, subjectid);
               }

               if (settingid != null) {
                    count++;
                    sql += "AND s.setting_id = ?\n";
                    params.put(count, settingid);
               }

               if (trainerid != null) {
                    count++;
                    sql += "AND u1.user_id = ?\n";
                    params.put(count, trainerid);
               }

               if (supporterid != null) {
                    count++;
                    sql += "AND u2.user_id = ?\n";
                    params.put(count, supporterid);
               }

               if (status != null) {
                    count++;
                    sql += "AND c.status = ?\n";
                    params.put(count, status);
               }

               PreparedStatement stm = connection.prepareStatement(sql);
               for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                    Integer key = entry.getKey();
                    Object val = entry.getValue();
                    stm.setObject(key, val);
               }

               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    Classes c = new Classes();
                    c.setClass_id(rs.getInt("class_id"));
                    c.setClass_code(rs.getString("class_code"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    c.setTerm_id(s);
                    User u1 = new User();
                    u1.setFull_name(rs.getString("trainer_id"));
                    c.setTrainer_id(u1);
                    User u2 = new User();
                    u2.setFull_name(rs.getString("supporter_id"));
                    c.setSupporter_id(u2);
                    c.setStatus(rs.getBoolean("status"));
                    classes.add(c);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return classes;
     }

     public ArrayList<Classes> search(String keyword) {
          ArrayList<Classes> classes = new ArrayList<>();
          try {
               String sql = "Select c.class_id, c.class_code, s.setting_title,"
                       + " u1.full_name as trainer_id, u2.full_name as supporter_id, c.status \n"
                       + "       from class c Inner Join setting s On c.term_id = s.setting_id\n"
                       + "       Inner join user u1 ON c.trainer_id = u1.user_id \n"
                       + "       Inner join user u2 on c.supporter_id = u2.user_id\n"
                       + "       where c.class_code like ?";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setString(1, "%" + keyword + "%");
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    Classes c = new Classes();
                    c.setClass_id(rs.getInt("class_id"));
                    c.setClass_code(rs.getString("class_code"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    c.setTerm_id(s);
                    User u1 = new User();
                    u1.setFull_name(rs.getString("trainer_id"));
                    c.setTrainer_id(u1);
                    User u2 = new User();
                    u2.setFull_name(rs.getString("supporter_id"));
                    c.setSupporter_id(u2);
                    c.setStatus(rs.getBoolean("status"));
                    classes.add(c);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return classes;
     }

     @Override
     public void insert(Classes model) {
          try {
               String sql = "INSERT INTO class\n"
                       + "(\n"
                       + "`class_code`,\n"
                       + "`status`,\n"
                       + "`description`,\n"
                       + "`term_id`,\n"
                       + "`trainer_id`,\n"
                       + "`subject_id`,\n"
                       + "`supporter_id`,\n"
                       + "`created_by`,\n"
                       + "`created_at`,\n"
                       + "`modified_by`,\n"
                       + "`modified_at`)\n"
                       + "VALUES\n"
                       + "(\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "?,\n"
                       + "now(),\n"
                       + "null,\n"
                       + "null);";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setString(1, model.getClass_code());
               stm.setBoolean(2, model.isStatus());
               stm.setString(3, model.getDescription());
               stm.setInt(4, model.getTerm_id().getSetting_id());
               stm.setInt(5, model.getTrainer_id().getUser_id());
               stm.setInt(6, model.getSubject().getSubject_id());
               stm.setInt(7, model.getSupporter_id().getUser_id());
               stm.setInt(8, model.getCreated_by());
               stm.executeUpdate();
          } catch (SQLException ex) {
               Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
     }

     public void updateStatus(Classes model) {
          try {
               String sql = "UPDATE `swp`.`class`\n"
                       + "SET\n"
                       + "`status` = ?,\n"
                       + "`modified_by` = ?,\n"
                       + "`modified_at` = now()\n"
                       + "WHERE `class_id` = ?;";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setBoolean(1, model.isStatus());
               stm.setInt(2, model.getModified_by());
               stm.setInt(3, model.getClass_id());
               stm.executeUpdate();
          } catch (SQLException ex) {
               Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
     }

     @Override
     public void update(Classes model) {
          try {
               String sql = "UPDATE `swp`.`class`\n"
                       + "SET\n"
                       + "`class_code` = ?,\n"
                       + "`status` = ?,\n"
                       + "`description` = ?,\n"
                       + "`term_id` = ?,\n"
                       + "`trainer_id` = ?,\n"
                       + "`subject_id` = ?,\n"
                       + "`supporter_id` = ?,\n"
                       + "`modified_by` = ?,\n"
                       + "`modified_at` =now()\n"
                       + "WHERE `class_id` = ?;";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setString(1, model.getClass_code());
               stm.setBoolean(2, model.isStatus());
               stm.setString(3, model.getDescription());
               stm.setInt(4, model.getTerm_id().getSetting_id());
               stm.setInt(5, model.getTrainer_id().getUser_id());
               stm.setInt(6, model.getSubject().getSubject_id());
               stm.setInt(7, model.getSupporter_id().getUser_id());
               stm.setInt(8, model.getModified_by());
               stm.setInt(9, model.getClass_id());
               stm.executeUpdate();
          } catch (SQLException ex) {
               Logger.getLogger(ClassDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
     }

     @Override
     public void delete(Classes model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

}
