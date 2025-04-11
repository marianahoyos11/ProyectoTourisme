document.addEventListener('DOMContentLoaded', () => {
    const logoutBtn = document.getElementById('logoutBtn');
  
    if (logoutBtn) {
      logoutBtn.addEventListener('click', (e) => {
        e.preventDefault();
  
        Swal.fire({
          title: '¿Estás seguro de que deseas cerrar sesión?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Sí, salir',
          cancelButtonText: 'No',
          reverseButtons: true
        }).then((result) => {
          if (result.isConfirmed) {
            window.location.href = 'index.html';
          }
        });
      });
    }
  });
  