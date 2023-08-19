package mx.edu.utez.voluntariapp_final.models.organization;

public class Answer {
    private Long id_answer;
    private String answer1,answer2,answer3;

    private String id_question;
    private String form_id;
    private Question question;
    private Forms forms;

    public Answer() {
    }

    public Answer(Long id_answer, String answer1, String answer2, String answer3, String id_question, String form_id, Question question, Forms forms) {
        this.id_answer = id_answer;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.id_question = id_question;
        this.form_id = form_id;
        this.question = question;
        this.forms = forms;
    }

    public Long getId_answer() {
        return id_answer;
    }

    public void setId_answer(Long id_answer) {
        this.id_answer = id_answer;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getId_question() {
        return id_question;
    }

    public void setId_question(String id_question) {
        this.id_question = id_question;
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Forms getForms() {
        return forms;
    }

    public void setForms(Forms forms) {
        this.forms = forms;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id_answer=" + id_answer +
                ", answer1='" + answer1 + '\'' +
                ", answer2='" + answer2 + '\'' +
                ", answer3='" + answer3 + '\'' +
                ", id_question='" + id_question + '\'' +
                ", form_id='" + form_id + '\'' +
                ", question=" + question +
                ", forms=" + forms +
                '}';
    }
}
