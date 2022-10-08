/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Setting;

/**
 *
 * @author PC
 */
public class SettingDBContext extends ADBContext<Setting> {

     @Override
     public ArrayList<Setting> list() {
          ArrayList<Setting> settings = new ArrayList<>();
          try {
               String sql = "SELECT setting_id,setting_title FROM swp.setting where setting_id > 10 AND setting_id <= 17;";
               PreparedStatement stm = connection.prepareStatement(sql);
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    Setting s = new Setting();
                    s.setSetting_id(rs.getInt("setting_id"));
                    s.setSetting_title(rs.getString("setting_title"));
                    settings.add(s);
               }
          } catch (SQLException ex) {
               Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return settings;
     }

     @Override
     public Setting get(int id) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void insert(Setting model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void update(Setting model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void delete(Setting model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

}
