package mx.edu.utez.voluntariapp_final.models.organization;

public class Category {
    private Long id;
    private String description;

    public Category() {
    }

    public Category(Long id, String description) {
        this.id = id;
        this.description = description;
    }
    public Category(Long id) {this.id = id;}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
