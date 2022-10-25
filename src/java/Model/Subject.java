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
public class Subject {
     private int subject_id;
     private String subject_code;
     private String subject_name;
     private boolean status;
     private String body;
     private User manager_id;
     private User expert_id;
     private int created_by;
     private Date created_at;
     private int modified_by;
     private Date modified_at;

     public int getSubject_id() {
          return subject_id;
     }

     public void setSubject_id(int subject_id) {
          this.subject_id = subject_id;
     }

     public String getSubject_code() {
          return subject_code;
     }

     public void setSubject_code(String subject_code) {
          this.subject_code = subject_code;
     }

     public String getSubject_name() {
          return subject_name;
     }

     public void setSubject_name(String subject_name) {
          this.subject_name = subject_name;
     }

     public boolean isStatus() {
          return status;
     }

     public void setStatus(boolean status) {
          this.status = status;
     }

     public String getBody() {
          return body;
     }

     public void setBody(String body) {
          this.body = body;
     }

     public User getManager_id() {
          return manager_id;
     }

     public void setManager_id(User manager_id) {
          this.manager_id = manager_id;
     }

     public User getExpert_id() {
          return expert_id;
     }

     public void setExpert_id(User expert_id) {
          this.expert_id = expert_id;
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
