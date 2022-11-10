package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.*;
import java.util.HashMap;

/**
 *
 * @author SMILY
 */
public class WebContactDAO extends DBContext{
    Connection con;

    public WebContactDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertContact(int category_id, String full_name, String email, String mobile, String message){
        String sql = "INSERT INTO web_contact(category_id, full_name, email, mobile, message) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, category_id);
            ps.setNString(2, full_name);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setNString(5, message);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public int getAmount(){
        String sql = "SELECT COUNT(contact_id) FROM web_contact";
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
    
    public List<WebContact> getAll(int limit, int offset){
        String sql = "SELECT * FROM web_contact ORDER BY contact_id limit ? offset ?";
        List<WebContact> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                WebContact wc = new WebContact(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                        rs.getNString(4), rs.getString(5), rs.getString(6), rs.getNString(7), rs.getNString(8));
                list.add(wc);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public WebContact getContact(int contact_id){
        String sql = "SELECT * FROM web_contact WHERE contact_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, contact_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                WebContact wc = new WebContact(rs.getInt(1), rs.getInt(2), rs.getInt(3), 
                        rs.getNString(4), rs.getString(5), rs.getString(6), rs.getNString(7), rs.getNString(8));
                return wc;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateWebContact(int supporter_id, String response, int contact_id){
        String sql = "UPDATE web_contact SET supporter_id = ?, response = ? WHERE contact_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, supporter_id);
            ps.setNString(2, response);
            ps.setInt(3, contact_id);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public void deleteWebContact(int contact_id){
        String sql = "DELETE FROM web_contact WHERE contact_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, contact_id);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public HashMap<Integer, String> getCategoriesHashMap(){
        String sql = "SELECT * FROM ";
        HashMap<Integer, String> hashMap = new HashMap<>();
        return hashMap;
    }
    
    public HashMap<Integer, String> getSupporterHashMap(){
        String sql = "SELECT * FROM";
        HashMap<Integer, String> hashMap = new HashMap<>();
        return hashMap;
    }
    
}
