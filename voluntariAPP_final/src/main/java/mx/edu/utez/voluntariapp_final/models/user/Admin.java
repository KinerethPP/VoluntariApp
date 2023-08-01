package mx.edu.utez.voluntariapp_final.models.user;

import mx.edu.utez.voluntariapp_final.models.Role.Role;

public class Admin {
    private long id_user;
    private String email;
    private String password;
    private boolean enable;
    private Role role;

    public Admin() {
    }

    public Admin(long id_user, String email, String password, boolean enable) {
        this.id_user = id_user;
        this.email = email;
        this.password = password;
        this.enable = enable;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public long getId() {
        return id_user;
    }

    public void setId(long id_user) {
        this.id_user = id_user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public boolean getEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }
}



