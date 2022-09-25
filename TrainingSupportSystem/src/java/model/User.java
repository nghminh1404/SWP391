/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class User {
     private int user_id;
     private String full_name;
     private String email;
     private String mobile;
     private String password;
     private String avatar_url;
     private boolean status;
     private String note;
     private Setting setting;

     public Setting getSetting() {
          return setting;
     }

     public void setSetting(Setting setting) {
          this.setting = setting;
     }


     public int getUser_id() {
          return user_id;
     }

     public void setUser_id(int user_id) {
          this.user_id = user_id;
     }

     public String getFull_name() {
          return full_name;
     }

     public void setFull_name(String full_name) {
          this.full_name = full_name;
     }

     public String getEmail() {
          return email;
     }

     public void setEmail(String email) {
          this.email = email;
     }

     public String getMobile() {
          return mobile;
     }

     public void setMobile(String mobile) {
          this.mobile = mobile;
     }

     public String getPassword() {
          return password;
     }

     public void setPassword(String password) {
          this.password = password;
     }

     public String getAvatar_url() {
          return avatar_url;
     }

     public void setAvatar_url(String avatar_url) {
          this.avatar_url = avatar_url;
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
     
}
