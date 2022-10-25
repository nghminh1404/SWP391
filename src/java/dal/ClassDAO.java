/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ClassModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ClassDAO {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List< ClassModel> getClasslist() {
        List<ClassModel> list = new ArrayList<>();
        String query = "SELECT * FROM class;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassModel(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getBoolean(7),
                        rs.getString(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        ClassDAO d = new ClassDAO();
        List<ClassModel> list = d.getClasslist();
        for (ClassModel item : list) {
            System.out.println(item.getClass_id());
        }
    }
}
