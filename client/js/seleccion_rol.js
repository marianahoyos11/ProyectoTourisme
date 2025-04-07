document.addEventListener('DOMContentLoaded', () => {
    const btnTurista = document.getElementById('btnTurista');
    const btnNegocio = document.getElementById('btnNegocio');
  
    const enviarRol = (rol) => {
      fetch('/api/google-login/rol', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ rol })
      })
      .then(res => res.json())
      .then(data => {
        console.log(data.message);
        // Redirigir al dashboard o inicio
        window.location.href = '/index.html';
      })
      .catch(error => {
        console.error('Error al guardar el rol:', error);
      });
    };
  
    btnTurista.addEventListener('click', () => enviarRol('turista'));
    btnNegocio.addEventListener('click', () => enviarRol('negocio'));
  });
  