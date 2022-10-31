/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.Dao;
import dal.TeamDAO;
import java.util.List;

/**
 *
 * @author Hp
 */
public class Team_member {
    private int team_id, user_id;
    private boolean is_leader, is_active;

    public Team_member() {
    }

    public Team_member(int team_id, int user_id, boolean is_leader, boolean is_active) {
        this.team_id = team_id;
        this.user_id = user_id;
        this.is_leader = is_leader;
        this.is_active = is_active;
    }

    public int getTeam_id() {
        return team_id;
    }

    public void setTeam_id(int team_id) {
        this.team_id = team_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isIs_leader() {
        return is_leader;
    }

    public void setIs_leader(boolean is_leader) {
        this.is_leader = is_leader;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }
    
    public User getUser(){
        Dao dao = new Dao();
        User u = dao.getUserbyID(user_id);
        return u;
    }
}
