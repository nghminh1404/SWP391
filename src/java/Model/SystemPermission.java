package Model;

/**
 *
 * @author SMILY
 */
public class SystemPermission {
    private String role_name;
    private int screen_id;
    private String screen_name;
    private int setting_id;
    private boolean get_all_data;
    private boolean can_delete;
    private boolean can_add;
    private boolean can_edit;

    public SystemPermission() {
    }

    public SystemPermission(String role_name, int screen_id, String screen_name, int setting_id, boolean get_all_data, boolean can_delete, boolean can_add, boolean can_edit) {
        this.role_name = role_name;
        this.screen_id = screen_id;
        this.screen_name = screen_name;
        this.setting_id = setting_id;
        this.get_all_data = get_all_data;
        this.can_delete = can_delete;
        this.can_add = can_add;
        this.can_edit = can_edit;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public int getScreen_id() {
        return screen_id;
    }

    public void setScreen_id(int screen_id) {
        this.screen_id = screen_id;
    }

    public String getScreen_name() {
        return screen_name;
    }

    public void setScreen_name(String screen_name) {
        this.screen_name = screen_name;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public boolean isGet_all_data() {
        return get_all_data;
    }

    public void setGet_all_data(boolean get_all_data) {
        this.get_all_data = get_all_data;
    }

    public boolean isCan_delete() {
        return can_delete;
    }

    public void setCan_delete(boolean can_delete) {
        this.can_delete = can_delete;
    }

    public boolean isCan_add() {
        return can_add;
    }

    public void setCan_add(boolean can_add) {
        this.can_add = can_add;
    }

    public boolean isCan_edit() {
        return can_edit;
    }

    public void setCan_edit(boolean can_edit) {
        this.can_edit = can_edit;
    }
    
    

    
}
