package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.Role.Role;
import mx.edu.utez.voluntariapp_final.models.user.User;

public class Organ {
    private Long id;
    private String bussines_name;
    private String street;
    private String cologne;
    private String postal_code;
    private String municipality;
    private String rfc;
    private String phone;
    private String user_id;
    private User user;
    private Role role;
    public Organ() {
    }

    public Organ(Long id, String bussines_name, String street, String cologne, String postal_code, String municipality, String rfc, String phone,String user_id, User user, Role role) {
        this.id = id;
        this.bussines_name = bussines_name;
        this.street = street;
        this.cologne = cologne;
        this.postal_code = postal_code;
        this.municipality = municipality;
        this.rfc = rfc;
        this.phone = phone;
        this.user_id = user_id;
        this.user = user;
        this.role = role;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getBussines_name() {
        return bussines_name;
    }
    public void setBussines_name(String bussines_name) {
        this.bussines_name = bussines_name;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getCologne() {
        return cologne;
    }
    public void setCologne(String cologne) {
        this.cologne = cologne;
    }
    public String getPostal_code() {
        return postal_code;
    }
    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getMunicipality() {
        return municipality;
    }

    public void setMunicipality(String municipality) {
        this.municipality = municipality;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Organ{" +
                "id=" + id +
                ", bussines_name='" + bussines_name + '\'' +
                ", street='" + street + '\'' +
                ", cologne='" + cologne + '\'' +
                ", postal_code='" + postal_code + '\'' +
                ", municipality='" + municipality + '\'' +
                ", rfc='" + rfc + '\'' +
                ", phone='" + phone + '\'' +
                ", user_id='" + user_id + '\'' +
                ", user=" + user +
                ", role=" + role +
                '}';
    }
}