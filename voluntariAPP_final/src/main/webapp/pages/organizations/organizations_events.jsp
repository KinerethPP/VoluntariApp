<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

            <div class="row">
                <!-- Inicio de barras de eventos -->
                <div class="container barra-pading">
                    <div class="event-card card">
                        <div class="event-details">
                            <div>
                                <img src="https://lacensura.com/wp-content/uploads/2021/06/utez_14-01-21.jpg"
                                     alt="Imagen del evento">
                            </div>
                            <div class="event-info">
                                <h5 class="card-title">Nombre del Evento</h5>
                            </div>


                            <%--            Botones del Crud de Eventos                --%>
                            <div class="event-actions">


                                <!-- Boton vista -->
                                <a class="event-action" href="#" aria-expanded="false" data-bs-toggle="modal"
                                   data-bs-target="#viewModal">
                                    <span>
                                        <i class="ti ti-eye"></i>
                                    </span>
                                </a>
                                <!-- Boton actualizar -->
                                <a class="event-action" href="#" aria-expanded="false" data-bs-toggle="modal"
                                   data-bs-target="#editModal">
                                    <span>
                                        <i class="ti ti-edit"></i>
                                    </span>
                                </a>
                                <!-- Boton Eliminar  -->
                                <a class="event-action" href="#" aria-expanded="false"
                                   onclick="mostrarConfirmacionEliminar()">
                                    <span>
                                        <i class="ti ti-trash-x"></i>
                                    </span>
                                </a>
                            </div>


                            <!-- Modal de Vista -->
                            <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="viewModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="viewModalLabel">Detalles del Evento</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Cerrar"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <div class="text-center">
                                                    <img src="https://lacensura.com/wp-content/uploads/2021/06/utez_14-01-21.jpg"
                                                         class="img-fluid" alt="Imagen del Evento"
                                                         style="width: 100%; max-height: 500px; object-fit: cover;">
                                                </div>

                                                <div class="row">
                                                    <br><br>
                                                    <hr>
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Nombre del Evento</h6>
                                                        <c:out value="${evento.name}"/>
                                                    </div>
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Fecha y Hora</h6>
                                                        <c:out value="${evento.event_day} ${evento.event_time}"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Descripción</h6>
                                                        <c:out value="${evento.description}"/>
                                                    </div>
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Categoría</h6>
                                                        <c:out value="${evento.category}"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Estado</h6>
                                                        <c:out value="${evento.state}"/>
                                                    </div>
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Municipio</h6>
                                                        <c:out value="${evento.municipality}"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Código Postal</h6>
                                                        <c:out value="${evento.postal_code}"/>
                                                    </div>
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Calle</h6>
                                                        <c:out value="${evento.street}"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <h6>Colonia</h6>
                                                        <c:out value="${evento.cologne}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal de Actualización -->
                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel">Editar Evento</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Cerrar"></button>
                                    </div>

                                    <div class="modal-body">
                                        <form class="needs-validation" id="event-form" novalidate
                                              action="<%--/event/update--%>" method="post">
                                            <div class="row ">
                                                <!--  <div class="form-floating">
                                                      <input type="text" name="user_id" id="id_user" class="form-control" value=""  disabled>

                                                      <label for="id_user">User Id</label>
                                                  </div>-->
                                                <div class="form-floating">
                                                    <div class="form-floating">
                                                        <input type="text" id="organ_id" name="organ_id" value="1"
                                                               class="form-control">

                                                    </div>
                                                    <div class="form-floating">
                                                        <input type="text" id="user_id" name="user_id" value="2"
                                                               class="form-control">
                                                    </div>

                                                </div>
                                                <div class="col-md-6 mb-4">
                                                </div>

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
                                                        <input type="text" id="description" name="description"
                                                               class="form-control"
                                                               placeholder="Descripcion" required>
                                                        <label for="description">Descripcion</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="date" id="event_day" name="event_day"
                                                               class="form-control"
                                                               placeholder="Fecha del Evento" required>
                                                        <label for="event_day">Fecha del Evento</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="time" id="event_time" name="event_time"
                                                               class="form-control"
                                                               placeholder="Hora del Evento" required>
                                                        <label for="event_time">Hora del Evento</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="text" id="state" name="state" class="form-control"
                                                               placeholder="Estado"
                                                               required>
                                                        <label for="state">Estado</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="text" id="municipality" name="municipality"
                                                               class="form-control"
                                                               placeholder="Municipio" required>
                                                        <label for="municipality">Municipio</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="text" id="postal_code" name="postal_code"
                                                               class="form-control"
                                                               placeholder="Codigo Postal" pattern="[0-9]{5}"
                                                               required>
                                                        <label for="postal_code">Codigo Postal</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="text" id="street" name="street"
                                                               class="form-control" placeholder="Calle"
                                                               required>
                                                        <label for="street">Calle</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <input type="text" id="cologne" name="cologne"
                                                               class="form-control"
                                                               placeholder="Colonia" required>
                                                        <label for="cologne">Colonia</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-floating">
                                                        <label for="validationCustom04" class="form-label"></label>
                                                        <select class="form-select" name="category"
                                                                id="validationCustom04" required>
                                                            <option selected disabled value="">Selecciona la
                                                                Categoria...
                                                            </option>
                                                            <option value="Benefico">Benefico</option>
                                                            <option value="Caridad">Caridad</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger btn-sm"
                                                        data-bs-dismiss="modal" aria-label="Close">
                                                    Cancelar
                                                </button>
                                                <button type="button" class="btn btn-warning btn-sm"
                                                        onclick="mostrarAlertaActualizacion()">
                                                    Actualizar
                                                </button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin de barras de eventos -->
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