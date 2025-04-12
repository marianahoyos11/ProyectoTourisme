document.addEventListener("DOMContentLoaded", function () {
  const tabla = document.querySelector(".admin-table tbody");
  const modal = document.getElementById("modalUsuario");
  const form = document.getElementById("formUsuario");
  const btnAdd = document.querySelector(".add-btn-usuario");
  const spanCerrar = document.querySelector(".close-usuario");

  cargarUsuarios();

  function cargarUsuarios() {
    fetch("/api/usuarios")
      .then(res => res.json())
      .then(data => {
        tabla.innerHTML = "";
        data.forEach(usuario => {
          const fila = document.createElement("tr");
          fila.innerHTML = `
            <td>${usuario.id_usuario}</td>
            <td>${usuario.nombre}</td>
            <td>${usuario.correo}</td>
            <td>${new Date(usuario.fecha_registro).toLocaleDateString()}</td>
            <td><span class="badge ${asignarClaseRol(usuario.id_rol)}">${nombreRol(usuario.id_rol)}</span></td>
            <td class="actions">
              <button class="action-btn edit-btn-usuario"><i class="fas fa-edit"></i></button>
              <button class="action-btn delete-btn-usuario"><i class="fas fa-trash"></i></button>
            </td>
          `;
          tabla.appendChild(fila);
        });
      })
      // .catch(error => {
      //   console.error("Error al cargar usuarios:", error);
      //   Swal.fire("Error", "No se pudieron cargar los usuarios", "error");
      // });
  }

  function asignarClaseRol(idRol) {
    if (idRol == 1) return "badge-user";
    if (idRol == 2) return "badge-business";
    if (idRol == 3) return "badge-admin";
    return "badge-user";
  }

  function nombreRol(idRol) {
    if (idRol == 1) return "Usuario";
    if (idRol == 2) return "Negocio";
    if (idRol == 3) return "Administrador";
    return "Usuario";
  }

  btnAdd.addEventListener("click", () => {
    form.reset();
    form.dataset.id_usuario = "";
    document.getElementById("modalTitulo").textContent = "Añadir Usuario";
    modal.style.display = "block";
  });

  spanCerrar.onclick = () => modal.style.display = "none";
  window.onclick = e => {
    if (e.target === modal) modal.style.display = "none";
  };

  form.addEventListener("submit", function (e) {
    e.preventDefault();

    const usuario = {
      nombre: form.nombre.value,
      correo: form.correo.value,
      id_rol: parseInt(form.id_rol.value)
    };

    const id = form.dataset.id_usuario;
    const url = id ? `/api/usuarios/${id}` : "/api/usuarios";
    const method = id ? "PUT" : "POST";

    fetch(url, {
      method,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(usuario)
    })
    .then(res => res.json())
    .then(() => {
      modal.style.display = "none";
      cargarUsuarios();
      Swal.fire({
        icon: "success",
        title: id ? "Usuario actualizado" : "Usuario creado",
        text: id ? "Los datos del usuario se actualizaron correctamente." : "El usuario fue creado con éxito.",
      });
    })
    .catch(error => {
      console.error("Error al guardar usuario:", error);
      Swal.fire("Error", "No se pudo guardar el usuario", "error");
    });
  });

  tabla.addEventListener("click", function (e) {
    const fila = e.target.closest("tr");

    // Editar
    if (e.target.closest(".edit-btn-usuario")) {
      const usuario = {
        id_usuario: fila.cells[0].textContent,
        nombre: fila.cells[1].textContent,
        correo: fila.cells[2].textContent,
        id_rol: obtenerIdRolDesdeTexto(fila.cells[4].textContent.trim())
      };

      form.nombre.value = usuario.nombre;
      form.correo.value = usuario.correo;
      form.id_rol.value = usuario.id_rol;
      form.dataset.id_usuario = usuario.id_usuario;

      document.getElementById("modalTitulo").textContent = "Editar Usuario";
      modal.style.display = "block";
    }

    // Eliminar
    if (e.target.closest(".delete-btn-usuario")) {
      const id = fila.cells[0].textContent;

      Swal.fire({
        title: "¿Eliminar usuario?",
        text: "Esta acción no se puede deshacer.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Sí, eliminar",
        cancelButtonText: "Cancelar"
      }).then(result => {
        if (result.isConfirmed) {
          fetch(`/api/usuarios/${id}`, { method: "DELETE" })
            .then(res => res.json())
            .then(() => {
              cargarUsuarios();
              Swal.fire("¡Eliminado!", "El usuario ha sido eliminado.", "success");
            })
            .catch(error => {
              console.error("Error al eliminar usuario:", error);
              Swal.fire("Error", "No se pudo eliminar el usuario", "error");
            });
        }
      });
    }
  });

  function obtenerIdRolDesdeTexto(texto) {
    texto = texto.toLowerCase();
    if (texto.includes("usuario")) return 1;
    if (texto.includes("negocio")) return 2;
    if (texto.includes("admin")) return 3;
    return 1;
  }
});
