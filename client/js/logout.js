document.addEventListener('DOMContentLoaded', () => {
    const logoutBtn = document.getElementById('logoutBtn');
  
    if (logoutBtn) {
      logoutBtn.addEventListener('click', async () => {
        try {
          const response = await fetch('/api/auth/logout');
          const data = await response.json();
  
          console.log(data.message);
          alert('Sesión cerrada correctamente.');
  
          // Redirigir a la página principal o de inicio de sesión
          window.location.href = '/index.html';
        } catch (error) {
          console.error('Error al cerrar sesión:', error);
          alert('Ocurrió un error al cerrar sesión. Intenta nuevamente.');
        }
      });
    }
  });
  