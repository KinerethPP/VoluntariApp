<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuenta Voluntarios</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png" />
    <link rel="stylesheet" href="../../assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/css/register.css">
    <link rel="stylesheet" href="{pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
    <div class="text-md-start p-4">
        <img src="../assets/images/logos_voluntariapp/logo_extend.png" style="width:200px"  alt="">
    </div>
    <div class="container-fluid d-flex align-items-center justify-content-center">
        <div class="container bg-white rounded shadow">
            <!-- shadow -->

            <div class="row align-items-stretch">
                <div class="col bg-white p-5 rounded-end">
                    <h3 class="fw-bold text-center ">Crear una cuenta de VoluntariApp</h3>
                    <h4 class="fw-bold text-center colorcito_azulito">Voluntario</h4>
                    <br>
                    <!-- Register -->
                    <form id="volunteer-form" class="needs-validation" novalidate
                          action="/volunteer/save" method="post">
                        <div class="row ">
                            <div class="col-md-6 mb-4">
                                <div class="form-floating">
                                    <input name="name" type="text" id="name" class="form-control" placeholder="Nombre" required>
                                    <label for="name">Nombre</label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="form-floating">
                                    <input name="surname" type="text" id="surname" class="form-control" placeholder="Apellidos"
                                        required>
                                    <label for="surname">Apellido Paterno</label>
                                </div>
                            </div>

                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="lastanme" type="text" id="lastanme" class="form-control" placeholder="Apellidos"
                                       required>
                                <label for="lastanme">Apellido Materno</label>
                            </div>
                        </div>



                            <div class="col-md-6 mb-4">
                                <div class="form-floating">
                                    <input  name="birthday" type="date" id="birthday" class="form-control"
                                        placeholder="Fecha de Nacimiento" required>
                                    <label for="birthday">Fecha de Nacimiento</label>
                                </div>
                            </div>

                            <div class="col-md-6 mb-4">
                                <div class="form-floating">
                                    <input  name="address" type="text" id="address" class="form-control" placeholder="Direccion"
                                        required>
                                    <label for="address">Direccion</label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="form-floating">
                                    <input name="phone" type="tel" id="phone" class="form-control" placeholder="Teléfono"
                                        pattern="[0-9]{10}" required>
                                    <label for="phone">Teléfono</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-0 mb-4">
                                <div class="form-floating">
                                    <input  name="curp" type="text" id="curp" class="form-control" placeholder="Curp" required>
                                    <label for="curp">Curp</label>
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-md-0 mb-4">
                                <div class="form-floating">
                                    <input  name="email" type="email" id="email" class="form-control" placeholder="Email" required>
                                    <label for="email">Email</label>
                                </div>
                            </div>
                            <div class="col-md-0 mb-4">
                                <div class="form-floating form-control-icon">
                                    <input name="password" type="password" id="password" class="form-control" placeholder="Contraseña"
                                        required>
                                    <label for="password">Contraseña</label>
                                    <div class="password-toggle" onclick="togglePasswordVisibility('password')">
                                        <i id="password-toggle-icon" class="bi bi-eye-slash"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-0 mb-4">
                                <div class="form-floating form-control-icon">
                                    <input type="password" id="confirm_password" class="form-control"
                                        placeholder="Confirmar Contraseña" required>
                                    <label for="confirm_password">Confirmar Contraseña</label>
                                    <div class="password-toggle" onclick="togglePasswordVisibility('confirm_password')">
                                        <i id="confirm-password-toggle-icon" class="bi bi-eye-slash"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-outline-primary">Crear cuenta</button>
                        </div>
                        <br>
                        <div class="text-center">
                            <span>¿Ya tienes una cuenta? <a href="/user/login">Inicia sesión</a></span>
                        </div>
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