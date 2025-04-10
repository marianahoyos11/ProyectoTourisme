// // alerts.js

// // function alertaGuardado(mensaje) {
//     Swal.fire({
//       icon: 'success',
//       title: 'Éxito',
//       text: mensaje,
//       confirmButtonText: 'Aceptar',
//       timer: 2000
//     });
//   }
  
//   function confirmarEliminacion(callback, texto = "¿Estás seguro?", textoExito = "Eliminado correctamente.") {
//     Swal.fire({
//       title: texto,
//       icon: 'warning',
//       showCancelButton: true,
//       confirmButtonColor: '#d33',
//       cancelButtonColor: '#3085d6',
//       confirmButtonText: 'Sí, eliminar',
//       cancelButtonText: 'Cancelar'
//     }).then((result) => {
//       if (result.isConfirmed) {
//         callback();
//         Swal.fire({
//           icon: 'success',
//           title: 'Eliminado',
//           text: textoExito,
//           timer: 2000
//         });
//       }
//     });
//   }
  