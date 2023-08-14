<%--
  Created by IntelliJ IDEA.
  User: pccom
  Date: 04/08/2023
  Time: 11:28 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Formulario</title>
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
    <link rel="stylesheet" href="../../assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
<div class="text-md-start p-4">
    <img src="../assets/images/logos_voluntariapp/logo_extend.png" width="200" alt="">
</div>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center">Crear Formulario</h3>
                <br>
                <form action="#" onsubmit="return validateForm()">
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="name" class="form-control" placeholder="#" required>
                                <label for="name">Nombre del Formulario</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-0 mb-0">
                            <div class="form-floating">
                                <input type="text" id="description" class="form-control" placeholder="#"
                                       required>
                                <label for="description">Descripción</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <div id="questions-container">
                                <!-- Aquí se agregarán dinámicamente las preguntas y respuestas -->
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 mb-5 d-grid">
                            <button type="button" class="btn btn-outline-primary"
                                    onclick="addQuestion()"><i class="bi bi-plus"></i> Agregar Pregunta</button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-0 mb-2 text-center">
                            <button type="submit" class="btn btn-outline-primary">Guardar Encuesta</button>
                        </div>
                        <div class="text-center">
                            <span><a href="/organ/main">Cancelar</a></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    let questions = [];

    function addQuestion() {
        const questionsContainer = document.getElementById("questions-container");

        const questionContainer = document.createElement("div");
        questionContainer.classList.add("border", "p-3", "my-3", "rounded");

        const questionNumber = questions.length + 1;

        const questionHeader = document.createElement("div");
        questionHeader.classList.add("d-flex", "align-items-center", "mb-2");

        const questionInput = document.createElement("input");
        questionInput.name.add("question")
        questionInput.classList.add("form-control", "mb-2");
        questionInput.placeholder = "Pregunta " + questionNumber;

        const removeQuestionBtn = document.createElement("button");
        removeQuestionBtn.classList.add("btn", "ms-2");
        removeQuestionBtn.innerHTML = '<i class="bi bi-x-lg"></i>';
        removeQuestionBtn.addEventListener("click", () => {
            questionContainer.remove();
            questions.splice(questionNumber - 1, 1);
            resetQuestionNumbers();
        });

        questionHeader.appendChild(questionInput);
        questionHeader.appendChild(removeQuestionBtn);

        const answersContainer = document.createElement("div");

        // Automatically create three answer inputs when adding a question
        for (let i = 1; i <= 3; i++) {
            const answerInput = createAnswerInput(questionNumber, i);
            answersContainer.appendChild(answerInput);
        }

        questionContainer.appendChild(questionHeader);
        questionContainer.appendChild(answersContainer);

        questions.push(questionContainer);
        questionsContainer.appendChild(questionContainer);
        resetQuestionNumbers();
    }

    function createAnswerInput(questionNumber, answerNumber) {
        const answerContainer = document.createElement("div");
        answerContainer.classList.add("d-flex", "align-items-center", "mb-2");

        const radioInput = document.createElement("input");
        radioInput.type = "radio";
        radioInput.name = `correct-answer`;
        radioInput.value = answerNumber;

        const answerInput = document.createElement("input");
        answerInput.classList.add("form-control", "ms-2");
        answerInput.name.add("anwer")
        answerInput.placeholder = `Respuesta`;

        answerContainer.appendChild(radioInput);
        answerContainer.appendChild(answerInput);

        return answerContainer;
    }

    function resetAnswerNumbers() {
        const answerInputs = document.querySelectorAll(`#questions-container div[placeholder^='Respuesta'] input`);
        answerInputs.forEach((input, index) => {
            const questionNumber = Math.floor(index / 3) + 1;
            const answerNumber = index % 3 + 1;
            input.placeholder = `Respuesta ${answerNumber} (Pregunta ${questionNumber})`;
        });
    }

    function resetQuestionNumbers() {
        questions.forEach((q, index) => {
            const questionInput = q.querySelector("input[placeholder^='Pregunta']");
            questionInput.placeholder = `Pregunta ${index + 1}`;
        });

        resetAnswerNumbers();
    }

</script>

</body>

</html>
