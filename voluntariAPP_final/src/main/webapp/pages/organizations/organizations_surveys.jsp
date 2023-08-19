<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Encuestas</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <jsp:include page="../../layouts/head.jsp"/>
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
            <jsp:include page="../../layouts/sidebar.jsp"/>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Fin Sidebar navigation-->


    <!--  Main wrapper -->
    <div class="body-wrapper"> <!-- COLOR == | Fondo Central | ==-->
        <!--  Header Start -->
        <header class="app-header"> <!-- COLOR == | Barra Navegacion Superior | ==-->
            <jsp:include page="../../layouts/navbar.jsp"/>
        </header>
        <!--  Header End -->
        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid d-block">
            <!-- Inicio Contenedor (Central) -->
            <div class="row">
                <div class="col">
                    <div class="d-flex align-items-center gap-2 dropdown-item text-b">
                        <i class="ti ti-clipboard-text fs-8"></i>
                        <h3 class="mb-0 text-b">Tus Encuestas</h3>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>
            <!-- Fin Contenedor (Central) -->
            <div class="row mt-2 mb-2">
                <div class="col">
                    <label for="opciones">Seleccionar evento</label>
                    <select name="opciones" id="opciones" class="form-select" onchange="getallForms()">
                        <option value="">Seleccione...</option>
                        <c:forEach var="event" items="${events}">
                            <option value="${event.id}">
                                <c:out value="${event.name}"/>
                                <c:out value="${event.event_date}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row">
                <!-- Inicio de barras de eventos -->
                <div class="col">
                    <div id="showForms"></div>
                </div>
                <!-- Fin de barras de eventos -->
            </div>


            <div class="row">
                <div class="col container barra-pading text-center">
                    <div class="event-card card ">
                        <a class="event-action add-button" href="/organ/create_forms" aria-expanded="false">
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
<jsp:include page="../../layouts/footer.jsp"/>
<script>
    const getallForms = async () => {
        const select = document.getElementById("opciones").value;
        const response = await fetch('http://localhost:8080/forms?id=' + select);
        const data = await response.json();
        const text = document.getElementById("opciones").options[document.getElementById("opciones").selectedIndex].text;
        const div = document.getElementById('showForms');
        div.innerHTML = '';
        let content = ``;
        data?.map((form) => {
            content += `<div class="container barra-pading">
                    <div class="event-card card">
                        <div class="event-details">
                            <img src="https://lacensura.com/wp-content/uploads/2021/06/utez_14-01-21.jpg"
                                 alt="Imagen del evento">
                            <div class="event-info">
                                <h5 class="card-title">` + form.name_form + `</h5>
                                <h6>` + text + `</h6>
                            </div>
                            <div class="event-actions">
                                <a class="event-action" href="/forms/create-question?id=` + form.id_forms + `" aria-expanded="false">
                                        <span>
                                            <i class="ti ti-list"></i>
                                        </span>
                                </a>
                                <a class="event-action" href="#` + form.id_forms + `" aria-expanded="false">
                                        <span>
                                            <i class="ti ti-edit"></i>
                                        </span>
                                </a>
                                <a class="event-action" href="#" aria-expanded="false">
                                        <span>
                                            <i class="ti ti-trash-x"></i>
                                        </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>`;
        });
        div.innerHTML = content;
    }
    window.addEventListener("DOMContentLoaded", () => {
        if (!${param['result']==false?param['result']:true}) {
            Swal.fire({
                title: 'Accion realizada correctamente...',
                text: '${param['message']}',
                icon: 'error',
                confirmButtonText: 'Aceptar'
            });
        }
        if (${param['result']==true?param['result']:false}) {
            Swal.fire({
                title: 'Error ¡Intenta de  nuevo!...',
                text: '${param['message']}',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
        }
    }, false);
</script>
</body>
</html>