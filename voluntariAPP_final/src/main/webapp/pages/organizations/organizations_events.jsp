
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Eventos</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="../../assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="../../assets/css/styles.min.css"/>
    <link rel="stylesheet" href="../../assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
    <link rel="stylesheet" href="../../assets/css/css/sweetalert2.min.css">
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
                <a href="/organ/main" class="text-nowrap logo-img">
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
                        <a class="sidebar-link" href="/organ/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Organización</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Administrar</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/events" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                            <span class="hide-menu">Eventos</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/surveys" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-text"></i>
                </span>
                            <span class="hide-menu">Encuestas</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/postulations" aria-expanded="false">
                <span>
                  <i class="ti ti-man"></i>
                </span>
                            <span class="hide-menu">Postulados</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/aprob" aria-expanded="false">
                <span>
                  <i class="ti ti-check"></i>
                </span>
                            <span class="hide-menu">Aprobar</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/organ/porfile" aria-expanded="false">
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
                                    <a href="/organ/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>
                                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-tools fs-6"></i>
                                        <p class="mb-0 fs-3">Perzonalizar</p>
                                    </a>
                                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-list-check fs-6"></i>
                                        <p class="mb-0 fs-3">Otros</p>
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
        <div class="container-fluid">

            <!-- Inicio Contenedor (Central) -->
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item text-b">
                        <i class="ti ti-calendar-event fs-6"></i>
                        <h3 class="mb-0 text-b">Tus Eventos</h3>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>
            <!-- Fin Contenedor (Central) -->

            <!-- Inicia la tabla para los eventos -->
            <div class="row">
                <!-- Aqui inicia el codigo 242 -->
                <div class="col-lg- d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-3">
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <!--  -->
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Foto</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Nombre del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Descricpión</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Fecha del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Hora del evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Estado</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Calle</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Colonia</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Tipo de evento</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Editar</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Eliminar</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eventito" items="${events2}">
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">

                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.name}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-1">
                                                    <c:out value="${eventito.description}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.event_date}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.event_time}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.state}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.municipality}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.postal_code}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.street}"/>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">
                                                    <c:out value="${eventito.cologne}"/>
                                                </h6>
                                            </td>
                                        <%--                     Aqui esta el STATUS                       --%>
                                        <%-- <td class="border-bottom-0">--%>
                                        <%--   <div class="d-flex align-items-center gap-2">--%>
                                        <%--    <span--%>
                                        <%--        class="badge bg-danger rounded-3 fw-semibold"> <c:out value="${orga.user.status}"/>--%>
                                        <%--    </span>--%>
                                        <%--   </div>--%>
                                        <%-- </td>--%>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">
                                                    <c:out value="${eventito.category}"/>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">

                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-normal">

                                                </p>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="container barra-pading text-center">
                <div class="event-card card ">
                    <a class="event-action add-button" href="/organ/create_event" aria-expanded="false">
                                <span>
                                    <i class="ti ti-circle-plus"></i>
                                </span>
                    </a>
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
<script src="../../assets/js/sweetalert2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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

<script>
    // ... Tu código JavaScript anterior ...

    // Función para mostrar la alerta de confirmación de actualización
    function mostrarAlertaActualizacion() {
        Swal.fire({
            title: '¿Estás seguro?',
            text: 'Se realizarán los cambios. ¿Estás seguro de continuar?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'Cancelar',
        }).then((result) => {
            if (result.isConfirmed) {
                // Si el usuario hace clic en "Sí", procedemos a enviar el formulario manualmente.
                enviarFormulario();
            }
        });
    }

    // ... Tu código JavaScript posterior ...
</script>

<script>
    function mostrarConfirmacionEliminar() {
        Swal.fire({
            title: '¿Estás seguro de eliminar este evento?',
            text: "Esta acción no se puede deshacer.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'No, cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Aquí puedes colocar la lógica para eliminar el evento
                // Por ejemplo, puedes hacer una petición AJAX al servidor
                Swal.fire(
                    'Eliminado',
                    'El evento ha sido eliminado.',
                    'success'
                );
            }
        });
    }
</script>

</body>

</html>