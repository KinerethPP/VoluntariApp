package mx.edu.utez.voluntariapp_final.models.organization;

import mx.edu.utez.voluntariapp_final.models.user.User;
import mx.edu.utez.voluntariapp_final.models.volunteer.Volunteer;

public class Post {
    private long id;
    private boolean is_accept;
    private String volunteer_id;
    private String user_id;
    private String event_id;
    private User user;
    private Event event;
    private Volunteer volunteer;

    public Post() {
    }

    public Post(long id, boolean is_accept, String volunteer_id, String user_id, String event_id, User user, Event event, Volunteer volunteer) {
        this.id = id;
        this.is_accept = is_accept;
        this.volunteer_id = volunteer_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.user = user;
        this.event = event;
        this.volunteer = volunteer;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isIs_accept() {
        return is_accept;
    }

    public void setIs_accept(boolean is_accept) {
        this.is_accept = is_accept;
    }

    public String getVolunteer_id() {
        return volunteer_id;
    }

    public void setVolunteer_id(String volunteer_id) {
        this.volunteer_id = volunteer_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Volunteer getVolunteer() {
        return volunteer;
    }

    public void setVolunteer(Volunteer volunteer) {
        this.volunteer = volunteer;
    }
}
