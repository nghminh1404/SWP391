/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Milestone;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class MilestoneDAO {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    
        public List<Milestone> getMilestone() {
        List<Milestone> list = new ArrayList<>();
        String query = "SELECT * FROM milestone;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);            
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Milestone(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }


 
    public List<Milestone> getMilestonelistByUserID(int user_id, int limit, int curPage) {
        List<Milestone> list = new ArrayList<>();
        int offset = (curPage - 1) * limit;
        String query = "select * from milestone where class_id in (select class_id from class where trainer_id=?) limit ? offset ?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Milestone(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Milestone> searchMilestone(String classmodel, String status, String title) {
        List<Milestone> list = new ArrayList<>();
        String query = "SELECT * FROM milestone;";
        if (classmodel.equalsIgnoreCase("all")) {
            classmodel = "is not null";
        } else {
            classmodel = "= " + classmodel;
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
        query = "SELECT * FROM milestone  WHERE class_id " + classmodel + " and status " + status + " and title " + title;
        System.out.println(query);
//        if (fromDate.compareTo(toDate) > 0) {
//            query = "";
//        } else {
//            query += " and from_date between ? and ? and to_date between ? and ?;";
//        }
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
//            ps.setString(1, fromDate);
//            ps.setString(2, toDate);
//            ps.setString(3, fromDate);
//            ps.setString(4, toDate);
            System.out.println(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Milestone(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        MilestoneDAO m = new MilestoneDAO();
        List<Milestone> list = m.getMilestonelistByUserID(5, 10, 1);
        for (Milestone item : list) {
            System.out.println(item.getMilestone_id());
        }

    }
}
