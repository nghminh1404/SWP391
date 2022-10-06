/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Setting;
import Model.User;

/**
 *
 * @author PC
 */
public class UserDBContext extends ADBContext<User> {

     public User getUser(int id) {
          try {
               String sql = "Select u.user_id,u.full_name,u.email,u.mobile,u.avatar_url,s.setting_title,u.status,u.note"
                       + " from user u left join user_role ur ON u.user_id = ur.user_id\n"
                       + "left join setting s ON ur.setting_id = s.setting_id where u.user_id = ?;";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setInt(1, id);
               ResultSet rs = stm.executeQuery();
               if (rs.next()) {
                    User user = new User();
                    user.setFull_name(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setAvatar_url(rs.getString("avatar_url"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    user.setSetting(s);
                    user.setStatus(rs.getBoolean("status"));
                    user.setNote(rs.getString("note"));
                    return user;
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return null;
     }

     @Override
     public ArrayList<User> list() {
          ArrayList<User> users = new ArrayList<>();
          try {
               String sql = "Select u.user_id,u.full_name,u.email,u.mobile,s.setting_title,u.status "
                       + "from user u left join user_role ur ON u.user_id = ur.user_id\n"
                       + "left join setting s ON ur.setting_id = s.setting_id;";
               PreparedStatement stm = connection.prepareStatement(sql);
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    User u = new User();
                    u.setUser_id(rs.getInt("user_id"));
                    u.setFull_name(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                    u.setMobile(rs.getString("mobile"));
                    u.setStatus(rs.getBoolean("status"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    u.setSetting(s);
                    users.add(u);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return users;
     }

     public ArrayList<User> filter(Integer settingid, Boolean status) {
          ArrayList<User> users = new ArrayList<>();
          try {
               String sql = "Select u.user_id,u.full_name,u.email,u.mobile,s.setting_title,s.setting_id,u.status"
                       + " from user u left join user_role ur ON u.user_id = ur.user_id\n"
                       + "left join setting s ON ur.setting_id = s.setting_id where (1=1) ";
               int count = 0;
               HashMap<Integer, Object> params = new HashMap<>();
               if (settingid != null) {
                    count++;
                    sql += "AND s.setting_id = ?\n";
                    params.put(count, settingid);
               }

               if (status != null) {
                    count++;
                    sql += "AND u.status = ?\n";
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
                    User u = new User();
                    u.setUser_id(rs.getInt("user_id"));
                    u.setFull_name(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                    u.setMobile(rs.getString("mobile"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    s.setSetting_id(rs.getInt("setting_id"));
                    u.setSetting(s);
                    u.setStatus(rs.getBoolean("status"));
                    users.add(u);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return users;
     }

     public int count() {
          try {
               String sql = "SELECT COUNT(*) as total FROM user";
               PreparedStatement stm = connection.prepareStatement(sql);
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    return rs.getInt("total");
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return -1;
     }

//    public ArrayList<User> pagging(int pagesize, int pageindex) {
//        ArrayList<User> users = new ArrayList<>();
//        try {
//            String sql = "SELECT id,name FROM Dummy\n"
//                    + "ORDER BY id ASC\n"
//                    + "OFFSET (?-1) *?  ROWS\n"
//                    + "FETCH NEXT ? ROWS ONLY";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, pageindex);
//            stm.setInt(2, pagesize);
//            stm.setInt(3, pagesize);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Dummy d = new Dummy();
//                d.setId(rs.getInt("id"));
//                d.setName(rs.getString("name"));
//                users.add(d);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return users;
//    }
     public ArrayList<User> search(String keyword) {
          ArrayList<User> users = new ArrayList<>();
          try {
               String sql = "Select u.user_id,u.full_name,u.email,u.mobile,s.setting_title,u.status \n"
                       + "from user u inner join user_role ur ON u.user_id = ur.user_id\n"
                       + "inner join setting s ON ur.setting_id = s.setting_id where u.full_name like ? or u.email like ? or u.mobile like ?";
               PreparedStatement stm = connection.prepareStatement(sql);
               stm.setString(1,"%"+ keyword +"%");
               stm.setString(2,"%"+ keyword +"%");
               stm.setString(3, "%"+ keyword +"%");
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    User u = new User();
                    u.setUser_id(rs.getInt("user_id"));
                    u.setFull_name(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                    u.setMobile(rs.getString("mobile"));
                    u.setStatus(rs.getBoolean("status"));
                    Setting s = new Setting();
                    s.setSetting_title(rs.getString("setting_title"));
                    u.setSetting(s);
                    users.add(u);
               }
          } catch (SQLException ex) {
               Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return users;
     }

     @Override
     public User get(int id) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void insert(User model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void update(User model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void delete(User model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

}
