document.getElementById('loginForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();

    try {
        const response = await fetch('/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();

        if (response.ok) {
            // Mostrar alerta sin botones y redirigir automáticamente
            let redirectUrl = data.rol === 'usuario' ? 'home.html' :
                              data.rol === 'negocio' ? 'empresa.html' :
                              null;

            if (redirectUrl) {
                Swal.fire({
                    icon: 'success',
                    title: '¡Bienvenido!',
                    text: 'Inicio de sesión exitoso',
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true
                });

                setTimeout(() => {
                    window.location.href = redirectUrl;
                }, 2000);
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Rol no reconocido',
                    text: 'Por favor, contacta con soporte.'
                });
            }

        } else {
            if (data.error === 'Usuario no encontrado') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Usuario no encontrado',
                    text: '¿Deseas registrarte?',
                    confirmButtonText: 'Ir al registro',
                    showCancelButton: true,
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'registro.html';
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Credenciales inválidas',
                    text: data.error || 'Correo o contraseña incorrectos'
                });
            }
        }

    } catch (error) {
        console.error('Error al enviar login:', error);
        Swal.fire({
            icon: 'error',
            title: 'Error de conexión',
            text: 'No se pudo conectar con el servidor.'
        });
    }
});
