package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.user.User;

public class Event {

    private Long id;
    private String name;
    private String event_date;
    private String description;
    private String street;
    private String cologne;
    private String postal_code;
    private String municipality;
    private String state ;
    private String event_time;
    private String category;
    private String user_id;
    private String organization_id;
    private Boolean status ;

    private User user;
    private Organ organ;


    public Event() {
    }

    public Event(Long id, String name, String event_date, String description, String street, String cologne, String postal_code, String municipality, String state, String event_time, String category, String user_id, String organization_id, Boolean status, User user, Organ organ) {
        this.id = id;
        this.name = name;
        this.event_date = event_date;
        this.description = description;
        this.street = street;
        this.cologne = cologne;
        this.postal_code = postal_code;
        this.municipality = municipality;
        this.state = state;
        this.event_time = event_time;
        this.category = category;
        this.user_id = user_id;
        this.organization_id = organization_id;
        this.status = status;
        this.user = user;
        this.organ = organ;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEvent_date() {
        return event_date;
    }

    public void setEvent_date(String event_date) {
        this.event_date = event_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEvent_time() {
        return event_time;
    }

    public void setEvent_time(String event_time) {
        this.event_time = event_time;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getOrganization_id() {
        return organization_id;
    }

    public void setOrganization_id(String organization_id) {
        this.organization_id = organization_id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Organ getOrgan() {
        return organ;
    }

    public void setOrgan(Organ organ) {
        this.organ = organ;
    }


    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", event_date='" + event_date + '\'' +
                ", description='" + description + '\'' +
                ", street='" + street + '\'' +
                ", cologne='" + cologne + '\'' +
                ", postal_code='" + postal_code + '\'' +
                ", municipality='" + municipality + '\'' +
                ", state='" + state + '\'' +
                ", event_time='" + event_time + '\'' +
                ", category='" + category + '\'' +
                ", user_id='" + user_id + '\'' +
                ", organization_id='" + organization_id + '\'' +
                ", user=" + user +
                ", organ=" + organ +

                '}';
    }
}