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
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="../../assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center">Crear Preguntas</h3>
                <br>
                <form class="needs-validation" id="event-form" action="/questions/save" method="post">
                    <input hidden value="${id}" name="formId">
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="question" name="question" class="form-control" required>
                                <label for="question">¿Pregunta?</label>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="answer1" name="answer1" class="form-control"  required>
                                <label for="answer1">Respuesta</label>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="answer2" name="answer2" class="form-control" required>
                                <label for="answer2">Respuestas</label>
                            </div>
                        </div>
                    </div><br>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="answer3" name="answer3" class="form-control" required>
                                <label for="answer3">Respuestas</label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <button type="submit" class="btn btn-outline-primary mb-3">Guardar</button>
                            <a href="/organ/surveys" class="btn btn-outline-danger">
                                <span>Cancelar</span>
                            </a>
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
    (function () {
        'use strict'
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })();
</script>

</body>

</html>