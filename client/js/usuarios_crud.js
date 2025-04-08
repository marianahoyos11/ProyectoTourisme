document.addEventListener("DOMContentLoaded", function () {
    const tabla = document.querySelector(".admin-table tbody");
    const modal = document.getElementById("modalUsuario");
    const form = document.getElementById("formUsuario");
    const btnAdd = document.querySelector(".add-btn-usuario");
    const spanCerrar = document.querySelector(".close-usuario");
  
    // Mostrar usuarios al cargar
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
        });
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
  
    // Abrir modal para añadir
    btnAdd.addEventListener("click", () => {
      form.reset();
      form.dataset.id_usuario = "";
      document.getElementById("modalTitulo").textContent = "Añadir Usuario";
      modal.style.display = "block";
    });
  
    // Cerrar modal
    spanCerrar.onclick = () => modal.style.display = "none";
    window.onclick = e => {
      if (e.target === modal) modal.style.display = "none";
    };
  
    // Guardar usuario (crear o editar)
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
      });
    });
  
    // Delegación para editar y eliminar
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
        if (confirm("¿Estás seguro de eliminar este usuario?")) {
          fetch(`/api/usuarios/${id}`, { method: "DELETE" })
            .then(res => res.json())
            .then(() => cargarUsuarios());
        }
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
  