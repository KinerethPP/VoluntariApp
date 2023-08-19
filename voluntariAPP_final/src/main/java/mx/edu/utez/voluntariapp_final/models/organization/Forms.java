package mx.edu.utez.voluntariapp_final.models.organization;

public class Forms {
    private Long id_forms;
    private String instructions;
    private String name_form;
    private String event_id;
    private Boolean status;
    private Organ organ ;
    private Event event;
    public Forms() {
    }

    public Forms(Long id_forms, String instructions, String name_form, String event_id, Boolean status, Organ organ, Event event) {
        this.id_forms = id_forms;
        this.instructions = instructions;
        this.name_form = name_form;
        this.event_id = event_id;
        this.status = status;
        this.organ = organ;
        this.event = event;
    }

    public Long getId_forms() {
        return id_forms;
    }

    public void setId_forms(Long id_forms) {
        this.id_forms = id_forms;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getName_form() {
        return name_form;
    }

    public void setName_form(String name_form) {
        this.name_form = name_form;
    }

    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Organ getOrgan() {
        return organ;
    }

    public void setOrgan(Organ organ) {
        this.organ = organ;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    @Override
    public String toString() {
        return "Forms{" +
                "id_forms=" + id_forms +
                ", instructions='" + instructions + '\'' +
                ", name_form='" + name_form + '\'' +
                ", event_id='" + event_id + '\'' +
                ", status=" + status +
                ", organ=" + organ +
                ", event=" + event +
                '}';
    }
}
