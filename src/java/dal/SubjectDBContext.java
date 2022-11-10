/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Setting;
import Model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class SubjectDBContext extends ADBContext<Subject> {

     @Override
     public ArrayList<Subject> list() {
          ArrayList<Subject> subjects = new ArrayList<>();
          try {
               String sql = "SELECT subject_id,subject_code,subject_name FROM swp.subject";
               PreparedStatement stm = connection.prepareStatement(sql);
               ResultSet rs = stm.executeQuery();
               while (rs.next()) {
                    Subject s = new Subject();
                    s.setSubject_id(rs.getInt("subject_id"));
                    s.setSubject_code(rs.getString("subject_code"));
                    s.setSubject_name(rs.getString("subject_name"));
                    subjects.add(s);
               }
          } catch (SQLException ex) {
               Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
          }
          return subjects;
     }

     @Override
     public Subject get(int id) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void insert(Subject model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void update(Subject model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

     @Override
     public void delete(Subject model) {
          throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
     }

}
