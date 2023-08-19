package mx.edu.utez.voluntariapp_final.models.organization;

public class Question {
    private Long id_question;
    private String question;
    private String form_id;

    private Forms forms;
    private Answer answer;

    public Question() {
    }

    public Question(Long id_question, String question, String form_id, Forms forms, Answer answer) {
        this.id_question = id_question;
        this.question = question;
        this.form_id = form_id;
        this.forms = forms;
        this.answer = answer;
    }

    public Long getId_question() {
        return id_question;
    }

    public void setId_question(Long id_question) {
        this.id_question = id_question;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public Forms getForms() {
        return forms;
    }

    public void setForms(Forms forms) {
        this.forms = forms;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id_question=" + id_question +
                ", question='" + question + '\'' +
                ", form_id='" + form_id + '\'' +
                ", forms=" + forms +
                ", answer=" + answer +
                '}';
    }
}
