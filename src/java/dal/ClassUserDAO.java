/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ClassUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ClassUserDAO {
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List< ClassUser> getClassUserbyUserID(int user_id) {
        List<ClassUser> list = new ArrayList<>();
        String query = "select * from class_user where user_user_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassUser(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getDate(7)                        
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public static void main(String[] args) {
        ClassUserDAO dao = new ClassUserDAO();
        List<ClassUser> c = dao.getClassUserbyUserID(1);
        for (ClassUser item : c) {
            System.out.println(item.getClass_id());
        }
        System.out.println("");
    }
}
