package mx.edu.utez.voluntariapp_final.models.organization;

public class Question {
    private String id_question;
    private String question;
    private String id_form;

    private Forms forms;

    public Question() {
    }

    public Question(String id_question, String question, String id_form, Forms forms) {
        this.id_question = id_question;
        this.question = question;
        this.id_form = id_form;
        this.forms = forms;
    }

    public String getId_question() {
        return id_question;
    }

    public void setId_question(String id_question) {
        this.id_question = id_question;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getId_form() {
        return id_form;
    }

    public void setId_form(String id_form) {
        this.id_form = id_form;
    }

    public Forms getForms() {
        return forms;
    }

    public void setForms(Forms forms) {
        this.forms = forms;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id_question='" + id_question + '\'' +
                ", question='" + question + '\'' +
                ", id_form='" + id_form + '\'' +
                ", forms=" + forms +
                '}';
    }
}
