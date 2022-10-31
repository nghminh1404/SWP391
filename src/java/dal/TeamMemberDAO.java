/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class TeamMemberDAO {
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Team_member> getTeam_member() {
        List<Team_member> list = new ArrayList<>();
        String query = "SELECT * FROM team_member";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team_member(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4)                        
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Team_member> getTeam_memberByTeamID(int team_id) {
        List<Team_member> list = new ArrayList<>();
        String query = "select * from team_member where team_id = ?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, team_id);            
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Team_member(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Team_member getSettingbyid(String id) {
        String query = "SELECT * FROM swp.team_member where team_member_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Team_member(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4));
            }
        } catch (Exception e) {
        }
        return null;
    }        

    public void InsertTeam_member(int team_id, int user_id, boolean is_leader, boolean is_active) {
        String sql = "insert into team_member values (?, ?, ?, ?);";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, team_id);
            ps.setInt(2, user_id);
            ps.setBoolean(3, is_leader);
            ps.setBoolean(4, is_active);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("inserted");
    }

    public void UpdateTeam_member(int team_member_id, String team_member_code, String topic_name, boolean status, String description) {
        String sql = "update team_member set team_member_code=?, topic_name=?, status=?, description=? where team_member_id=?;";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, team_member_code);
            ps.setString(2, topic_name);
            ps.setBoolean(3, status);
            ps.setString(4, description);
            ps.setInt(5, team_member_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public void DeleteTeam_member(int team_member_id) {
        String sql = "DELETE FROM team_member WHERE team_member_id=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, team_member_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("updated");
    }

    public static void main(String[] args) {
        TeamMemberDAO cs = new TeamMemberDAO();
//        cs.UpdateTeam_member(2, 3, "van vay a", "okioki", "ko order ha", true, "love u chu ca mo", 2);
//        cs.DeleteTeam_member(24);
//        System.out.println(cs.getSettingbyid("2").getSetting_tiltle());

        List<Team_member> list = cs.getTeam_memberByTeamID(2);

        for (Team_member item : list) {
            System.out.println(item.getUser().getFull_name());
        }
//
//        int page = (int) 15 / 10 + (15 % 10 == 0 ? 0 : 1);
//
//        System.out.println(page);
    }

}
