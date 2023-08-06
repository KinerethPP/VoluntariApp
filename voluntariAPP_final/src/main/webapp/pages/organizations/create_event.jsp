<%--
  Created by IntelliJ IDEA.
  User: pccom
  Date: 01/08/2023
  Time: 02:10 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Evento</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
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
                <form action="#" onsubmit="return validateForm()">
                    <div class="row ">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="name" class="form-control" placeholder="#" required>
                                <label for="name">Nombre del Evento</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="text" id="description" class="form-control" placeholder="#" required>
                                <label for="description">Descripcion</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="date" id="event_day" class="form-control" placeholder="#" required>
                                <label for="event_day">Fecha del Evento</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="time" id="event_time" class="form-control" placeholder="#" required>
                                <label for="event_time">Hora del Evento</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="municypaly" class="form-control" placeholder="#" required>
                                <label for="municypaly">Municipio</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="number" id="postal_code" class="form-control" placeholder="#" pattern="[0-5]{6}"
                                       required>
                                <label for="postal_code">Codigo Postal</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="street" class="form-control" placeholder="#" required>
                                <label for="street">Calle</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input type="text" id="colagne" class="form-control" placeholder="#" required>
                                <label for="colagne">Colonia</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Categoria</option>
                                    <option value="1">Benefico</option>
                                    <option value="2">Caridad</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-outline-primary" onclick="return validateForm()">Crear Evento</button>
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
</body>

</html>
