package mx.edu.utez.voluntariapp_final.models.administrators;
import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.User;


public class Admin {

    private Long id_admin;
    private String name;
    private String user_id;
    private  User user;
    private Role role;
    private String Filename;
    private byte[] imageUser;

    public Admin() {
    }

    public Admin(Long id_admin, String name, String user_id, User user, Role role) {
        this.id_admin = id_admin;
        this.name = name;
        this.user_id = user_id;
        this.user = user;
        this.role = role;
    }

    public String getFilename() {
        return Filename;
    }

    public void setFilename(String filename) {
        Filename = filename;
    }

    public byte[] getImageUser() {
        return imageUser;
    }

    public void setImageUser(byte[] imageUser) {
        this.imageUser = imageUser;
    }

    public Long getId_admin() {
        return id_admin;
    }

    public void setId_admin(Long id_admin) {
        this.id_admin = id_admin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id_admin=" + id_admin +
                ", name='" + name + '\'' +
                ", user_id='" + user_id + '\'' +
                ", user=" + user +
                ", role=" + role +
                '}';
    }
}
