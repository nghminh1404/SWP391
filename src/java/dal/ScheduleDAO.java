/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Schedule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ScheduleDAO {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Schedule> getSchedule() {
        List<Schedule> list = new ArrayList<>();
        String query = "SELECT * FROM schedule";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Schedule(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Schedule getSchedulebyID(int schedule_id) {
        List<Schedule> list = new ArrayList<>();
        String query = "SELECT * FROM schedule where schedule_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, schedule_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Schedule(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getBoolean(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Schedule> getSchedulelist(int limit, int curPage) {
        List<Schedule> list = new ArrayList<>();
        int offset = (curPage - 1) * limit;
        String query = "select * from schedule limit ? offset ?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");        
            while (rs.next()) {
                list.add(new Schedule(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        dateformat.format(rs.getDate(5)),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertSchedule(int class_id, int slot_id, int room_id, String training_date, String from_time, String to_time, boolean status) {
        String sql = "insert into schedule (class_id, slot_id, room_id, training_date, from_time, to_time, status) values (?, ?, ?, ?, ?,?,?);";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, class_id);
            ps.setInt(2, slot_id);
            ps.setInt(3, room_id);
            ps.setString(4, training_date);
            ps.setString(5, from_time);
            ps.setString(6, to_time);
            ps.setBoolean(7, status);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("inserted");
    }

    public List<Schedule> searchSchedule(String classmodel, String status) {
        List<Schedule> list = new ArrayList<>();
        String query = "SELECT * FROM schedule;";

        if (classmodel.equalsIgnoreCase("all")) {
            classmodel = "%%";
        }
        if (status.equalsIgnoreCase("active")) {
            status = "1";
        } else if (status.equalsIgnoreCase("deactive")) {
            status = "0";
        } else {
            status = "%%";
        }        
        query = "SELECT * FROM schedule  WHERE class_id like '" + classmodel + "' and status like '" + status + "'";
        System.out.println(query);
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, classmodel);
            ps.setString(2, status);            
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Schedule(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getBoolean(8)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public void UpdateSchedule(int schedule_id, int slot_id, int room_id, String training_date, String from_time, String to_time, boolean status) {
        String sql = "update schedule set slot_id=?, room_id=?, training_date=?, from_time=?, to_time=?, status=? where schedule_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, slot_id);
            ps.setInt(2, room_id);
            ps.setString(3, training_date);
            ps.setString(4, from_time);
            ps.setString(5, to_time);
            ps.setBoolean(6, status);
            ps.setInt(7, schedule_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void DeleteSchedule(int schedule_id) {
        String sql = "DELETE FROM schedule WHERE schedule_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public static void main(String[] args) {
        ScheduleDAO cs = new ScheduleDAO();
//        cs.UpdateSchedule(2, 3, "van vay a", "okioki", "ko order ha", true, "love u chu ca mo", 2);
//        cs.DeleteSchedule(24);
//        System.out.println(cs.getSettingbyid("2").getSetting_tiltle());
        List<Schedule> list = cs.searchSchedule("SE1627", "active");
        for (Schedule item : list) {
            System.out.println(item.getSchedule_id());
        }
    }
}
