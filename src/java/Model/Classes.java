/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Classes {
     private int class_id;
     private String class_code;
     private boolean status;
     private String description;
     private Setting term_id;
     private User trainer_id;
     private Subject subject;
     private User supporter_id;
     private int created_by;
     private Date created_at;
     private int modified_by;
     private Date modified_at;

     public int getClass_id() {
          return class_id;
     }

     public void setClass_id(int class_id) {
          this.class_id = class_id;
     }

     public String getClass_code() {
          return class_code;
     }

     public void setClass_code(String class_code) {
          this.class_code = class_code;
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

     public Setting getTerm_id() {
          return term_id;
     }

     public void setTerm_id(Setting term_id) {
          this.term_id = term_id;
     }

     public User getTrainer_id() {
          return trainer_id;
     }

     public void setTrainer_id(User trainer_id) {
          this.trainer_id = trainer_id;
     }

     public Subject getSubject() {
          return subject;
     }

     public void setSubject(Subject subject) {
          this.subject = subject;
     }

     public User getSupporter_id() {
          return supporter_id;
     }

     public void setSupporter_id(User supporter_id) {
          this.supporter_id = supporter_id;
     }

     public int getCreated_by() {
          return created_by;
     }

     public void setCreated_by(int created_by) {
          this.created_by = created_by;
     }

     public Date getCreated_at() {
          return created_at;
     }

     public void setCreated_at(Date created_at) {
          this.created_at = created_at;
     }

     public int getModified_by() {
          return modified_by;
     }

     public void setModified_by(int modified_by) {
          this.modified_by = modified_by;
     }

     public Date getModified_at() {
          return modified_at;
     }

     public void setModified_at(Date modified_at) {
          this.modified_at = modified_at;
     }
     
     
}
