<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VoluntariApp</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="../../assets/css/styles.min.css"/>
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>

<body>
<!-- Incio del copipage Plantilla (DASHBOARD) -->
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <!-- localizatodo en su lugar -->
    <aside class="left-sidebar"> <!-- COLOR == | Fondo Barra Lateral Izquierdo | ==-->
        <!-- Sidebar scroll-->
        <!-- Localiza la barra superior en su lugar -->
        <div>
            <!-- Imagen del logo de la app -->
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="/volunteer/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="../../assets/images/logos_voluntariapp/logo_extend.png" style="width:180px"
                         alt=""/><!-- Logo de la barra lateral -->
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Fin Imagen del logo de la app -->
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Principal</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/events" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                            <span class="hide-menu">Eventos</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/forms" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-text"></i>
                </span>
                            <span class="hide-menu">Encuestas</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/volunteer/porfile" aria-expanded="false">
                <span>
                  <i class="ti ti-user-circle"></i>
                </span>
                            <span class="hide-menu">Perfil</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Fin Sidebar navigation-->


    <!--  Main wrapper -->
    <div class="body-wrapper"> <!-- COLOR == | Fondo Central | ==-->
        <!--  Header Start -->
        <header class="app-header"> <!-- COLOR == | Barra Navegacion Superior | ==-->
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="ti ti-menu-2"></i>
                        </a>
                    </li>
                </ul>
                <!-- Nav parte superior de iconos -->
                <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                        <!-- Etiqueta para meter cosas -->
                        <li class="nav-item d-none d-lg-block">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" data-bs-toggle="modal"
                               data-bs-target="#exampleModal">
                                <i class="ti ti-search"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                <i class="ti ti-bell-ringing"></i>
                                <div class="notification bg-primary rounded-circle"></div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-icon-hover">
                                <i class="ti ti-question-mark"></i>
                            </a>
                        </li>
                        <!-- Foto de perfil -->
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="../../assets/images/user-1.jpg" alt="" style="width:35px; height:35px"
                                     class="rounded-circle">
                            </a>

                            <!-- Menu desplegable del la Foto fe perfil -->
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                                 aria-labelledby="drop2">
                                <!-- COLOR == | Fondo Desplegable Foto Perfil | ==    (Codigo de arriba)  -->
                                <div class="message-body">
                                    <a href="/volunteer/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>

                                    <a href="/user/login" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar
                                        Sesion</a>
                                </div>
                            </div>
                            <!-- Fin del Menu desplegable del la Foto fe perfil -->
                        </li>
                        <!-- Fin Foto de perfil -->
                    </ul>
                </div>
            </nav>
        </header>
        <!--  Header End -->
        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid" class="ayuda">
            <div class="row">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex align-items-center gap-2 dropdown-item">
                            <i class="ti ti-user-circle fs-6"></i>
                            <p class="mb-0 fs-3">Perfil</p>
                            <br><br>
                        </div>
                    </div>
                </div>
                <hr>
            </div>

            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-6 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-white"
                                 style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; position: relative;">
                                <img src="../../assets/images/user-1.jpg" alt="Imagen" class="img-fluid my-5"
                                     style="width: 130px; border-radius: 50%;"/>

                                <i class="ti ti-user"></i>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h6>Información</h6>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Nombre</h6>
                                            <c:out value="${volunteer.name}"/> <c:out value="${volunteer.surname}"/>


                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Apellido</h6>
                                            <c:out value="${volunteer.lastanme}"/>
                                        </div>
                                    </div>
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Dirección</h6>
                                            <c:out value="${volunteer.address}"/>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Año de nacimiento</h6>
                                            <c:out value="${volunteer.birthday}"/>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Telefono</h6>
                                            <c:out value="${volunteer.phone}"/>
                                        </div>

                                        <div class="col-6 mb-3">
                                            <h6>Curp</h6>
                                            <c:out value="${volunteer.curp}"/>
                                        </div>

                                    </div>


                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Correo</h6>
                                            <c:out value="${user.email}"/>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Contraseña</h6>
                                            <c:out value="${user.password}"/>
                                        </div>
                                    </div>
                                    <!-- Boton Modal -->
                                    <div class="row pt-8">
                                        <button type="button" class="btn btn-warning " data-bs-toggle="modal"
                                                data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">
                                            Editar
                                        </button>
                                        <hr>
                                        <button type="button" class="btn btn-danger ">Eliminar cuenta</button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Actualización de
                                                            Perfil
                                                        </h5>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="volunteer-form" class="needs-validation" novalidate
                                                              action="/volunteer/update" method="post">
                                                            <input hidden value="${volunteer.id}" name="id">
                                                            <div class="row ">
                                                                <!-- Muestra el id del voluntario-->
                                                                <!-- <div class="col-md-6 mb-4">
                                                                      <div class="form-floating">
                                                                          <input type="text" name="id" id="id" class="form-control" value="" placeholder="name" disabled>

                                                                          <label for="id">Id</label>
                                                                      </div>
                                                                  </div>-->
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">

                                                                        <input type="text" name="name" id="name"
                                                                               class="form-control"
                                                                               value="${volunteer.name}"
                                                                               placeholder="name" disabled>
                                                                        <label for="name">Primer Nombre</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="surname" id="surname"
                                                                               value="${volunteer.surname}"
                                                                               class="form-control"
                                                                               placeholder="surname"
                                                                               disabled>
                                                                        <label for="surname">Segundo nombre</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">

                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="latanme" id="latanme"
                                                                               value="${volunteer.lastanme}"
                                                                               class="form-control"
                                                                               placeholder="latanme"
                                                                               disabled>
                                                                        <label for="latanme">Apellido</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="date" name="birthday" id="birthday"
                                                                               class="form-control"
                                                                               placeholder="birthday"
                                                                               value="${volunteer.birthday}" disabled>
                                                                        <label for="birthday">Fecha de
                                                                            Nacimiento</label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="address" id="address"
                                                                               class="form-control"
                                                                               value="${volunteer.address}"
                                                                               placeholder="address"
                                                                               required>
                                                                        <label for="address">Dirección</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="curp" id="curp"
                                                                               value="${volunteer.curp}"
                                                                               class="form-control" disabled>
                                                                        <label for="curp">Curp</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="tel" name="phone" id="phone"
                                                                               value="${volunteer.phone}"
                                                                               class="form-control"
                                                                               pattern="[0-9]{10}" required>
                                                                        <label for="phone">Teléfono</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="email" name="email" id="email"
                                                                               value="${user.email}"
                                                                               class="form-control" required>
                                                                        <label for="email">Email</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating form-control-icon">
                                                                        <input type="password" name="password"
                                                                               id="password" value="${user.password}"
                                                                               class="form-control"
                                                                               required>
                                                                        <label for="password">Contraseña</label>
                                                                        <div class="password-toggle"
                                                                             onclick="togglePasswordVisibility('password')">
                                                                            <i id="password-toggle-icon"
                                                                               class="bi bi-eye-slash"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger btn-sm"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                    Cancelar
                                                                </button>
                                                                <button type="submit" class="btn btn-warning btn-sm">
                                                                    Actualizar
                                                                </button>

                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--  -->
                                </div>


                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </div>
        <!-- Fin Contenedor (Principal) -->
    </div>
</div>

<!-- JS -->
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/js/sidebarmenu.js"></script>
<script src="../../assets/js/app.min.js"></script>
<!-- Estadisticas Library -->
<script src="../../assets/js/apexcharts.min.js"></script>
<script src="../../assets/js/dashboard.js"></script>
<script>
    (function () {
        const form = document.getElementById("volunteer-form");
        form.addEventListener("submit", function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add("was-validated");
        }, false);
    })();
</script>


</body>

</html>