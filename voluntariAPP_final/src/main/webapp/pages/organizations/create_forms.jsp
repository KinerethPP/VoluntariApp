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
    <!-- Se inserta la foto del logo de la empresa -->
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
                <h3 class="fw-bold text-center ">Crear Formulario</h3>
                <br>
                <!-- Register -->
                <form action="#" onsubmit="return validateForm()">
                    <div class="row ">
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
                                <input type="text" id="description" class="form-control" placeholder="#" required>
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
                            <button type="button" class="btn btn-outline-primary" onclick="addQuestion()"><i class="bi bi-plus"></i></button>
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

<!-- Agregamos las referencias a las bibliotecas de Bootstrap y Popper.js -->
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
        questionInput.classList.add("form-control", "mb-2");
        questionInput.placeholder = "Pregunta " + questionNumber;

        const removeQuestionBtn = document.createElement("button");
        removeQuestionBtn.classList.add("btn", "ms-2");
        removeQuestionBtn.innerHTML = '<i class="bi bi-x-lg"></i>';
        removeQuestionBtn.addEventListener("click", () => {
            questionContainer.remove();
            questions = questions.filter((q) => q !== questionContainer);
            resetQuestionNumbers();
        });

        questionHeader.appendChild(questionInput);
        questionHeader.appendChild(removeQuestionBtn);

        const answersContainer = document.createElement("div");
        const answerCountMap = new Map(); // Map to keep track of answer counts per question

        function createAnswerInput(questionNumber) {
            const answerNumber = (answerCountMap.get(questionNumber) || 1);

            const answerInput = document.createElement("input");
            answerInput.classList.add("form-control", "mb-2");
            answerInput.placeholder = `Respuesta ${answerNumber}`;

            const removeAnswerBtn = document.createElement("button");
            removeAnswerBtn.type = "button";
            removeAnswerBtn.classList.add("btn","ms-2");
            removeAnswerBtn.innerHTML = '<i class="bi bi-x-lg"></i>';
            removeAnswerBtn.addEventListener("click", () => {
                answerContainer.remove();
                answerCountMap.set(questionNumber, (answerCountMap.get(questionNumber) || 1) - 1);
                resetAnswerNumbers(questionNumber);
            });

            const answerContainer = document.createElement("div");
            answerContainer.classList.add("d-flex", "align-items-center");
            answerContainer.appendChild(answerInput);
            answerContainer.appendChild(removeAnswerBtn);

            answerCountMap.set(questionNumber, (answerCountMap.get(questionNumber) || 1) + 1);

            return answerContainer;
        }

        const addAnswerBtn = document.createElement("button");
        addAnswerBtn.type = "button";
        addAnswerBtn.classList.add("btn", "btn-outline-black", "mt-2");
        addAnswerBtn.innerHTML = 'Añadir otra opcion <i class="bi bi-plus"></i>';
        addAnswerBtn.addEventListener("click", () => {
            const answerInput = createAnswerInput(questionNumber);
            answersContainer.appendChild(answerInput);
        });

        questionContainer.appendChild(questionHeader);
        questionContainer.appendChild(answersContainer);
        questionContainer.appendChild(addAnswerBtn);

        questions.push(questionContainer);
        questionsContainer.appendChild(questionContainer);
    }

    function resetAnswerNumbers(questionNumber) {
        const answerInputs = document.querySelectorAll(`#questions-container div[placeholder^='Respuesta'] input`);
        const answers = Array.from(answerInputs).filter((input) => input.placeholder.includes(questionNumber));
        answers.forEach((answer, index) => {
            const newAnswerNumber = index + 1;
            answer.placeholder = `Respuesta ${newAnswerNumber}`;
        });
    }

    function resetQuestionNumbers() {
        questions.forEach((q, index) => {
            const questionInput = q.querySelector("input[placeholder^='Pregunta']");
            questionInput.placeholder = `Pregunta ${index + 1}`;
        });
    }
</script>
</body>

</html>
