<%--
  Created by IntelliJ IDEA.
  User: pccom
  Date: 01/08/2023
  Time: 02:10 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Evento</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
<div class="text-md-start p-4">
    <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png" width="200" alt="">
</div>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <!-- shadow -->

        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center ">Crea tu Evento</h3>
                <br>
                <!-- Register -->
                <form class="needs-validation" id="event-form" novalidate action="/event/save" method="post">
                    <div class="row ">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="name" name="name" class="form-control"
                                       placeholder="Nombre del evento" required>
                                <label for="name">Nombre del Evento</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="description" name="description" class="form-control"
                                       placeholder="Descripcion" required>
                                <label for="description">Descripcion</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="date" id="event_day" name="event_day" class="form-control"
                                       placeholder="Fecha del Evento" required>
                                <label for="event_day">Fecha del Evento</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="time" id="event_time" name="event_time" class="form-control"
                                       placeholder="Hora del Evento" required>
                                <label for="event_time">Hora del Evento</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="state" name="state" class="form-control" placeholder="Estado"
                                       required>
                                <label for="state">Estado</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="municipality" name="municipality" class="form-control"
                                       placeholder="Municipio" required>
                                <label for="municipality">Municipio</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="postal_code" name="postal_code" class="form-control"
                                       placeholder="Codigo Postal" pattern="[0-9]{5}"
                                       required>
                                <label for="postal_code">Codigo Postal</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="street" name="street" class="form-control" placeholder="Calle"
                                       required>
                                <label for="street">Calle</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="cologne" name="cologne" class="form-control"
                                       placeholder="Colonia" required>
                                <label for="cologne">Colonia</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <label for="validationCustom04" class="form-label"></label>
                                <select class="form-select" id="validationCustom04" required>
                                    <option selected disabled value="">Selecciona la Categoria...</option>
                                    <option value="Benefico">Benefico</option>
                                    <option value="Caridad">Caridad</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-outline-primary">Crear Evento</button>
                    </div>
                    <br>
                    <div class="text-center">
                        <span><a href="/organ/main">Cancelar</a></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/register_login.js"></script>
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
