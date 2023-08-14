package mx.edu.utez.voluntariapp_final.models.organization;

public class Answer {
    private Long id_answer;
    private String answer;
    private String is_correct;
    private String id_question;
    private Question question;
    private Forms forms;

    public Answer() {
    }

    public Answer(Long id_answer, String answer, String is_correct, String id_question, Question question, Forms forms) {
        this.id_answer = id_answer;
        this.answer = answer;
        this.is_correct = is_correct;
        this.id_question = id_question;
        this.question = question;
        this.forms = forms;
    }

    public Long getId_answer() {
        return id_answer;
    }

    public void setId_answer(Long id_answer) {
        this.id_answer = id_answer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getIs_correct() {
        return is_correct;
    }

    public void setIs_correct(String is_correct) {
        this.is_correct = is_correct;
    }

    public String getId_question() {
        return id_question;
    }

    public void setId_question(String id_question) {
        this.id_question = id_question;
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
                ", answer='" + answer + '\'' +
                ", is_correct='" + is_correct + '\'' +
                ", id_question='" + id_question + '\'' +
                ", question=" + question +
                ", forms=" + forms +
                '}';
    }
}
