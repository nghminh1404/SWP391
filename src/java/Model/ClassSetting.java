/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.ClassDAO;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ClassSetting {
    private int setting_id, type_id;
    private String setting_tiltle, setting_value, display_order;    
    private boolean status;
    private String description;
    private int class_id;

    public ClassSetting() {
    }

    public ClassSetting(int setting_id, int type_id, String setting_tiltle, String setting_value, String display_order, boolean status, String description, int class_id) {
        this.setting_id = setting_id;
        this.type_id = type_id;
        this.setting_tiltle = setting_tiltle;
        this.setting_value = setting_value;
        this.display_order = display_order;
        this.status = status;
        this.description = description;
        this.class_id = class_id;
    }  

    
    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getSetting_tiltle() {
        return setting_tiltle;
    }

    public void setSetting_tiltle(String setting_tiltle) {
        this.setting_tiltle = setting_tiltle;
    }

    public String getSetting_value() {
        return setting_value;
    }

    public void setSetting_value(String setting_value) {
        this.setting_value = setting_value;
    }

    public String getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(String display_order) {
        this.display_order = display_order;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
