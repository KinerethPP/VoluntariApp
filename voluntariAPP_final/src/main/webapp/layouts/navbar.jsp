<%--
  Created by IntelliJ IDEA.
  User: Blanch
  Date: 16/08/2023
  Time: 10:58 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
