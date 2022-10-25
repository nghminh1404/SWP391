/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Hp
 */
public class ClassModel {
    private int class_id;
    private int subject_id;
    private String class_code;
    private int trainer_id, supporter_id, term_id;
    private boolean status;
    private String description;    

    public ClassModel() {
    }

    public ClassModel(int class_id, int subject_id, String class_code, int trainer_id, int supporter_id, int term_id, boolean status, String description) {
        this.class_id = class_id;
        this.subject_id = subject_id;
        this.class_code = class_code;
        this.trainer_id = trainer_id;
        this.supporter_id = supporter_id;
        this.term_id = term_id;
        this.status = status;
        this.description = description;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getClass_code() {
        return class_code;
    }

    public void setClass_code(String class_code) {
        this.class_code = class_code;
    }

    public int getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(int trainer_id) {
        this.trainer_id = trainer_id;
    }

    public int getSupporter_id() {
        return supporter_id;
    }

    public void setSupporter_id(int supporter_id) {
        this.supporter_id = supporter_id;
    }

    public int getTerm_id() {
        return term_id;
    }

    public void setTerm_id(int term_id) {
        this.term_id = term_id;
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

}
