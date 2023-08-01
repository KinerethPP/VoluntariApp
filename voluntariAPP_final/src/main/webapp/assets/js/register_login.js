/* ======= DASHBOARD ======= */

document.addEventListener("DOMContentLoaded", function (event) {
    // ... (código del dashboard)
});

var myLink = document.querySelector('a[href="#"]');
myLink.addEventListener('click', function (e) {
    e.preventDefault();
});
/* ======= FIN DASHBOARD ======= */


/*====== Login icono vistas de contraseña y Validacion de Formulario ======*/

function validateFormAndRedirect() {
    if (validateForm()) {
        window.location.href = "";
    }
    return false;
}

function validateForm() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirm_password').value;
    var telefono = document.getElementById('telefono').value;
    var codigoPostal = document.getElementById('codigo_postal').value;

    // Validación de correo electrónico
    if (!email.includes('@')) {
        alert('El correo electrónico debe contener un "@"');
        return false;
    }

    // Validación de contraseña
    if (password !== confirmPassword) {
        alert('Las contraseñas no coinciden');
        return false;
    }

    // Validación de teléfono (10 dígitos numéricos)
    if (!/^\d{10}$/.test(telefono)) {
        alert('El teléfono debe contener exactamente 10 dígitos numéricos');
        return false;
    }

    // Validación de código postal (solo números)
    if (!/^\d{5}$/.test(codigoPostal)) {
        alert('Faltan dígitos en el código postal');
        return false;
    }

    return true;
}

function togglePasswordVisibility(inputId) {
    var passwordInput = document.getElementById(inputId);
    var passwordToggleIcon = document.getElementById(inputId + '-toggle-icon');

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        passwordToggleIcon.classList.remove('bi-eye-slash');
        passwordToggleIcon.classList.add('bi-eye');
    } else {
        passwordInput.type = "password";
        passwordToggleIcon.classList.remove('bi-eye');
        passwordToggleIcon.classList.add('bi-eye-slash');
    }
}
/*====== FIN Login icono vistas de contraseña y Validacion de Formulario ======*/