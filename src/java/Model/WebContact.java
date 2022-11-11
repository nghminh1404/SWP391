package Model;

/**
 *
 * @author SMILY
 */
public class WebContact {
    private int contact_id;
    private int category_id;
    private int supporter_id;
    private String full_name;
    private String email;
    private String mobile;
    private String message;
    private String response;

    public WebContact() {
    }

    public WebContact(int contact_id, int category_id, int supporter_id, String full_name, String email, String mobile, String message, String response) {
        this.contact_id = contact_id;
        this.category_id = category_id;
        this.supporter_id = supporter_id;
        this.full_name = full_name;
        this.email = email;
        this.mobile = mobile;
        this.message = message;
        this.response = response;
    }
    
    

    public int getContact_id() {
        return contact_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getSupporter_id() {
        return supporter_id;
    }

    public void setSupporter_id(int supporter_id) {
        this.supporter_id = supporter_id;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
    
    
}
<<<<<<< .merge_file_a11536

=======
>>>>>>> .merge_file_a04328
