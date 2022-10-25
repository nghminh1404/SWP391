/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.ClassDAO;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 *
 * @author Hp
 */
public class Schedule {

    private int schedule_id, class_id, slot_id, room_id;
    private String training_date, from_time, to_time;
    private boolean status;

    public Schedule() {
    }

    public Schedule(int schedule_id, int class_id, int slot_id, int room_id, String training_date, Time from_time, Time to_time, boolean status) throws ParseException {
        this.schedule_id = schedule_id;
        this.class_id = class_id;
        this.slot_id = slot_id;
        this.room_id = room_id;
        this.training_date = training_date;
        SimpleDateFormat timeformat = new SimpleDateFormat("hh:mm");
        this.from_time = timeformat.format(from_time);
        this.to_time = timeformat.format(to_time);
        this.status = status;
    }

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getTraining_date() {
        return training_date;
    }

    public void setTraining_date(String training_date) {
        this.training_date = training_date;
    }

    public String getFrom_time() {
        return from_time;
    }

    public void setFrom_time(String from_time) {
        this.from_time = from_time;
    }

    public String getTo_time() {
        return to_time;
    }

    public void setTo_time(String to_time) {
        this.to_time = to_time;
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
