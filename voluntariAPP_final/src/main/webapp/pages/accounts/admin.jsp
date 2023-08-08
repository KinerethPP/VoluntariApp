<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuenta Administrador</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
<a href="/user/role">
    <div class="text-md-start p-4">
        <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png" style="width:200px" alt="">
    </div>
</a>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <!-- shadow -->

        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center ">Crear una cuenta de VoluntariApp</h3>
                <h4 class="fw-bold text-center c-blu">Administrador</h4>
                <br>
                <!-- Register -->
                <form class="needs-validation" id="admin-form" novalidate action="/admin/save" method="post">
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input type="email" id="email" name="email" class="form-control" placeholder="Correo"
                                       required>
                                <label for="email">Email</label>
                            </div>
                        </div>
                        <div class="col-md-0 mb-4">
                            <div class="form-floating form-control-icon">
                                <input type="password" id="password" name="password" class="form-control"
                                       placeholder="Contraseña"
                                       required>
                                <label for="password">Contraseña</label>
                                <div class="password-toggle" onclick="togglePasswordVisibility('password')">
                                    <i id="password-toggle-icon" class="bi bi-eye-slash"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-outline-primary">Crear cuenta</button>
                    </div>
                </form>
                <br>
                <div class="text-center">
                    <span>¿Ya tienes una cuenta? <a href="/user/login">Inicia sesión</a></span>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/register_login.js"></script>
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