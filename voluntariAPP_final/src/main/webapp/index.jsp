<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <jsp:include page="/layouts/head.jsp"/>

</head>
<body>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end d-flex align-items-center justify-content-center">

                <div class="col bg-white p-5 rounded-end">
                    <div class="text-center">
                        <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png"
                             style="width:200px" alt="">
                    </div>
                    <div class="fw-bold text-center py-5">
                        <h3 class="fw-bold text-center">Bienvenido a VoluntariApp</h3>
                        <p class="text-center">Inicia sesion con tu cuenta</p>
                    </div>


                    <form id="user-form" method="post" action="/user/main" novalidate class="needs-validation">

                        <div class="form-outline mb-4">
                            <input name="email" type="email" id="email" class="form-control" placeholder="Correo"/>
                            <div class="invalid-feedback">Campo Obligatorio</div>
                        </div>
                        <div class="form-outline mb-4">
                            <div class="form-control-icon">
                                <input name="password" type="password" id="password" class="form-control"
                                       placeholder="Contraseña"/>
                                <span class="password-toggle" onclick="togglePasswordVisibility('password')">
                                    <i id="password-toggle-icon" class="bi bi-eye-slash"></i>
                            </span>
                                <div class="invalid-feedback">Campo Obligatorio</div>
                            </div>
                        </div>
                        <!-- <div class="mb-4 form-check">
                            <input type="checkbox" name="connected" class="form-check-input">
                            <label for="connected" class="form-check-label">Mantenerme Conectado</label>
                        </div> -->
                        <div class="d-grid">
                            <button id="login" type="submit" class="btn btn-primary w-100 mt-4 fw-semibold">Iniciar
                                sesión
                            </button>
                        </div>
                        <div class="my-3">
                            <span>¿No tienes cuenta? <a href="/user/role">Regístrate</a></span><br>
                        </div>
                    </form>


                </div>
            </div>
            <div class="col d-none d-lg-block col-md-5 col-lg-5 col-xl-7 rounded">
                <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"
                     class="d-block w-100" alt="Imagen 1">
            </div>

        </div>
    </div>
</div>

<jsp:include page="./layouts/footer.jsp"/>
<script>
    window.addEventListener("DOMContentLoaded", () => {
        const form = document.getElementById("user-form");
        const btn = document.getElementById("login");
        const asd = document.getElementById("email");
        const asd1 = document.getElementById("password");
        console.log(asd + asd1 + "sdf");
        form.addEventListener("submit", function (event) {
            btn.innerHTML = `<div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>`;
            btn.classList.add("disabled");
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
                btn.classList.remove("disabled");
            }
            form.classList.add("was-validated");

        }, false);
        // Verificar si el parámetro 'result' es igual a 'false'
        if ('${param['result']}' === 'false') {
            Swal.fire({
                title: 'Acceso denegado',
                text: '${param['message']}',
                icon: 'error',
                confirmButtonText: 'Aceptar'
            });
        }

        // Verificar si el parámetro 'result' es igual a 'true'
        if ('${param['result']}' === 'true') {
            Swal.fire({
                title: 'Accion realizada correctamente',
                text: '${param['message']}',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
        }
    }, false);
</script>
<script>


    window.history.pushState(null, "", window.location.href);
    window.onpopstate = function (event) {
        window.history.pushState(null, "", window.location.href);
    };
</script>
</body>
</html>