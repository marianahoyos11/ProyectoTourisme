window.onload = function () {
    google.accounts.id.initialize({
        client_id: "378126372935-d2n8i4nmj0ap0h0av3e9nquorcmk1kd8.apps.googleusercontent.com", 
        callback: handleGoogleLogin
    });

    document.getElementById("googleLoginBtn").addEventListener("click", function () {
        google.accounts.id.prompt(); // Muestra el popup de Google
    });
};

function handleGoogleLogin(response) {
    const id_token = response.credential;

    fetch('/api/google-login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ id_token })
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            if (data.rol === 'usuario') {
                window.location.href = 'index.html';
            } else if (data.rol === 'negocio') {
                window.location.href = 'empresa.html';
            } else {
                alert('Rol no reconocido');
            }
        } else {
            alert(data.error || 'Error al iniciar sesión con Google');
        }
    })
    .catch(err => {
        console.error('Error en login con Google:', err);
    });
}
