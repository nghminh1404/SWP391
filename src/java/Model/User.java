/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
        
/**
 *
 * @author kieut
 */
public class User {

    int user_id;
    String full_name;
    String email;
    String mobile;
    String password;
    String avatar_url;
    Boolean status;
    String note;

    public User() {
    }

    public User(int user_id, String full_name, String email, String mobile, String password, String avatar_url, Boolean status, String note) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.mobile = mobile;
        this.password = password;
        if (avatar_url.isEmpty()) {
            this.avatar_url = "assets/img/profiles/avatar-main.jpg";
        } else {
            this.avatar_url = avatar_url;            
        }
        this.status = status;
        this.note = note;
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", full_name=" + full_name + ", email=" + email + ", mobile=" + mobile + ", password=" + password + ", avatar_url=" + avatar_url + ", status=" + status + ", note=" + note + '}';
    }

}
