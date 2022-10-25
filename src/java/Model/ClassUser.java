/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Hp
 */
public class ClassUser {
    private int class_id, user_id, team_id;
    private boolean team_leader, status;
    private String note;
    private Date dropoutDate;

    public ClassUser() {
    }

    public ClassUser(int class_id, int user_id, int team_id, boolean team_leader, boolean status, String note, Date dropoutDate) {
        this.class_id = class_id;
        this.user_id = user_id;
        this.team_id = team_id;
        this.team_leader = team_leader;
        this.status = status;
        this.note = note;
        this.dropoutDate = dropoutDate;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTeam_id() {
        return team_id;
    }

    public void setTeam_id(int team_id) {
        this.team_id = team_id;
    }

    public boolean isTeam_leader() {
        return team_leader;
    }

    public void setTeam_leader(boolean team_leader) {
        this.team_leader = team_leader;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getDropoutDate() {
        return dropoutDate;
    }

    public void setDropoutDate(Date dropoutDate) {
        this.dropoutDate = dropoutDate;
    }
    
}
