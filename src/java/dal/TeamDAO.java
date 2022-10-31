/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ClassModel;
import Model.Team;
import Model.Team_member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hp
 */
public class TeamDAO {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Team> getTeam() {
        List<Team> list = new ArrayList<>();
        String query = "SELECT * FROM team";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Team> getTeamlist(int limit, int curPage) {
        List<Team> list = new ArrayList<>();
        int offset = (curPage - 1) * limit;
        String query = "select * from team limit ? offset ?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Team getTeambyid(String id) {
        String query = "SELECT * FROM swp.team where team_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Team(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Team> searchTeam(String classmodel, String status, String name) {       
        List<Team> list = new ArrayList<>();
        String query = "SELECT * FROM team;";

        if (classmodel.equalsIgnoreCase("all")) {
            classmodel = "%%";
        }
        if (status.equalsIgnoreCase("active")) {
            status = "= 1";
        } else if (status.equalsIgnoreCase("deactive")) {
            status = "= 0";
        } else {
            status = "is not null";
        }
        name = "%" + name + "%";
        query = "SELECT * FROM team  WHERE class_id like ? and team_code like ? and status " + status;
        System.out.println(query);
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, classmodel);
            ps.setString(2, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Team> searchTeamLimit(String classmodel, String status, String name, int curpage) {
        int offset = (curpage - 1) * 10;
        List<Team> list = new ArrayList<>();
        String query = "SELECT * FROM team;";

        if (classmodel.equalsIgnoreCase("all")) {
            classmodel = "%%";
        }
        if (status.equalsIgnoreCase("active")) {
            status = "= 1";
        } else if (status.equalsIgnoreCase("deactive")) {
            status = "= 0";
        } else {
            status = "is not null";
        }
        name = "%" + name + "%";
        query = "SELECT * FROM team  WHERE class_id like ? and team_code like ? and status " + status + " limit 10 offset ?";
        System.out.println(query);
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, classmodel);
            ps.setString(2, name);
            ps.setInt(3, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public void InsertTeam(int class_id, String team_code, String topic_name, boolean status, String description) {
        String sql = "insert into team (class_id, team_code, topic_name, status, description) values (?, ?, ?, ?, ?);";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, class_id);
            ps.setString(2, team_code);
            ps.setString(3, topic_name);
            ps.setBoolean(4, status);
            ps.setString(5, description);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("inserted");
    }

    public void UpdateTeam(int team_id, String team_code, String topic_name, boolean status, String description) {
        String sql = "update team set team_code=?, topic_name=?, status=?, description=? where team_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, team_code);
            ps.setString(2, topic_name);
            ps.setBoolean(3, status);
            ps.setString(4, description);
            ps.setInt(5, team_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void DeleteTeam(int team_id) {
        String sql = "DELETE FROM team WHERE team_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, team_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public int cloneByID(int team_id) {
        Team t = getTeambyid(team_id+"");
        InsertTeam(t.getClass_id(), t.getTeam_code(), t.getTopic_name(), t.getStatus(), t.getDescription());
        List<Team> list = getTeam();
        int id = list.get(list.size()-1).getTeam_id();
        TeamMemberDAO td = new TeamMemberDAO();
        List<Team_member> tm = td.getTeam_memberByTeamID(team_id);
        for (Team_member item : tm) {
            td.InsertTeam_member(id, item.getUser_id(), item.isIs_leader(), item.isIs_active());
        }
        return id;
    }
    public static void main(String[] args) {
        TeamDAO cs = new TeamDAO();
//        cs.UpdateTeam(2, 3, "van vay a", "okioki", "ko order ha", true, "love u chu ca mo", 2);
//        cs.DeleteTeam(24);
//        System.out.println(cs.getSettingbyid("2").getSetting_tiltle());

        List<Team> list = cs.searchTeam("2", "deactive", "");

        for (Team item : list) {
            System.out.println(item.getTeam_id());
        }

        int page = (int) 15 / 10 + (15 % 10 == 0 ? 0 : 1);
//        cs.DeleteTeam();
        System.out.println(page);
    }
}
