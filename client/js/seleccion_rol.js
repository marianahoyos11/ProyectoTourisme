document.addEventListener('DOMContentLoaded', () => {
    const btnTurista = document.getElementById('btnTurista');
    const btnNegocio = document.getElementById('btnNegocio');
  
    const seleccionarRol = async (rol) => {
      try {
        const response = await fetch('/api/seleccionar-rol', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ rol })
        });
  
        const data = await response.json();
  
        if (data.success) {
          // Redirige según el rol
          if (rol === 'turista') {
            window.location.href = '/inicio-turista.html';
          } else if (rol === 'negocio') {
            window.location.href = '/inicio-negocio.html';
          }
        } else {
          alert('Hubo un error al seleccionar el rol');
        }
  
      } catch (err) {
        console.error('Error al enviar el rol:', err);
        alert('Error al comunicar con el servidor');
      }
    };
  
    btnTurista.addEventListener('click', () => seleccionarRol('turista'));
    btnNegocio.addEventListener('click', () => seleccionarRol('negocio'));
  });
  