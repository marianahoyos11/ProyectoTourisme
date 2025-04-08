document.addEventListener('DOMContentLoaded', () => {
  const logoutBtn = document.getElementById('logoutBtn');
  const logoutModal = document.getElementById('logoutModal');
  const confirmLogout = document.getElementById('confirmLogout');
  const cancelLogout = document.getElementById('cancelLogout');

  if (logoutBtn && logoutModal && confirmLogout && cancelLogout) {
      // Al hacer clic en "Cerrar sesión", mostrar el modal
      logoutBtn.addEventListener('click', () => {
          logoutModal.style.display = 'block';
      });

      // Al hacer clic en "No", cerrar el modal
      cancelLogout.addEventListener('click', () => {
          logoutModal.style.display = 'none';
      });

      // Al hacer clic en "Sí", cerrar sesión y redirigir
      confirmLogout.addEventListener('click', async () => {
          try {
              const response = await fetch('/api/auth/logout');
              const data = await response.json();

              console.log(data.message);
              alert('Sesión cerrada correctamente.');

              window.location.href = '/index.html';
          } catch (error) {
              console.error('Error al cerrar sesión:', error);
              alert('Ocurrió un error al cerrar sesión. Intenta nuevamente.');
          } finally {
              logoutModal.style.display = 'none';
          }
      });
  }
});
