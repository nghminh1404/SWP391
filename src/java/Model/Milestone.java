/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.ClassDAO;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Hp
 */
public class Milestone {
    private int milestone_id, ass_id, class_id;
    private Date from_date, to_date;
    private String title, description;
    private boolean status;

    public Milestone() {
    }

    public Milestone(int milestone_id, int ass_id, int class_id, Date from_date, Date to_date, String title, String description, boolean status) {
        this.milestone_id = milestone_id;
        this.ass_id = ass_id;
        this.class_id = class_id;
        this.from_date = from_date;
        this.to_date = to_date;
        this.title = title;
        this.description = description;
        this.status = status;
    }

    public int getMilestone_id() {
        return milestone_id;
    }

    public void setMilestone_id(int milestone_id) {
        this.milestone_id = milestone_id;
    }

    public int getAss_id() {
        return ass_id;
    }

    public void setAss_id(int ass_id) {
        this.ass_id = ass_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public Date getFrom_date() {
        return from_date;
    }

    public void setFrom_date(Date from_date) {
        this.from_date = from_date;
    }

    public Date getTo_date() {
        return to_date;
    }

    public void setTo_date(Date to_date) {
        this.to_date = to_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public ClassModel searchByID() {
        ClassDAO c = new ClassDAO();
        List<ClassModel> list = c.getClasslist();
        for (ClassModel item : list) {
            if (item.getClass_id() == class_id) {
                return item;
            }
        }
        return null;
    }
}
