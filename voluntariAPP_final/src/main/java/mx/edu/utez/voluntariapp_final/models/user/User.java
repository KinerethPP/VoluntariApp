package mx.edu.utez.voluntariapp_final.models.user;

import mx.edu.utez.voluntariapp_final.models.Role.Role;

public class User {
    private Long id_user;
    private String email;
    private String password;
    private String is_active;
    boolean status;

    private Role description;

    public User() {
    }

    public User(Long id_user, String email, String password, String is_active, Role description) {
        this.id_user = id_user;
        this.email = email;
        this.password = password;
        this.is_active = is_active;
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Long getId_user() {return id_user;}
    public void setId_user(Long id_user) {this.id_user = id_user;}

    public String getEmail() {return email;}

    public void setEmail(String email) {this.email = email;}

    public String getPassword() {return password;}

    public void setPassword(String password) {this.password = password;}
    public String getIs_active() {return is_active;}
    public void setIs_active(String is_active) {this.is_active = is_active;}
    public Role getDescription() {
        return description;
    }
    public void setDescription(Role description) {
        this.description = description;
    }
}