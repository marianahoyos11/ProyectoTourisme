document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("modalCategoria");
  const btnAbrirModal = document.querySelector(".add-btn-categoria");
  const btnCerrarModal = document.querySelector(".close-categoria");
  const formCategoria = document.getElementById("formCategoria");
  const tablaCategorias = document.getElementById("categorias-tbody");
  let modoEdicion = false;
  let categoriaEditar = null;

  // Abrir modal
  btnAbrirModal.addEventListener("click", () => {
    modal.style.display = "block";
    document.getElementById("modalCategoriaTitulo").innerText = "Añadir Categoría";
    formCategoria.reset();
    modoEdicion = false;
  });

  // Cerrar modal
  btnCerrarModal.addEventListener("click", () => {
    modal.style.display = "none";
  });

  // Cargar categorías al inicio
  async function cargarCategorias() {
    try {
      const res = await fetch("/api/categorias");
      const categorias = await res.json();

      tablaCategorias.innerHTML = "";

      categorias.forEach(cat => {
        const fila = document.createElement("tr");
        fila.innerHTML = `
          <td>${cat.id_categoria}</td>
          <td>${cat.nombre}</td>
          <td>${cat.descripcion}</td>
          <td class="actions">
            <button class="action-btn edit-btn-categoria" data-id="${cat.id_categoria}"><i class="fas fa-edit"></i></button>
            <button class="action-btn delete-btn-categoria" data-id="${cat.id_categoria}"><i class="fas fa-trash"></i></button>
          </td>
        `;
        tablaCategorias.appendChild(fila);
      });

      // Botón editar
      document.querySelectorAll(".edit-btn-categoria").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;
          const res = await fetch(`/api/categorias/${id}`);
          const cat = await res.json();

          document.getElementById("nombre_categoria").value = cat.nombre;
          document.getElementById("descripcion_categoria").value = cat.descripcion;
          categoriaEditar = id;
          modoEdicion = true;

          document.getElementById("modalCategoriaTitulo").innerText = "Editar Categoría";
          modal.style.display = "block";
        });
      });

      // Botón eliminar con SweetAlert2
      document.querySelectorAll(".delete-btn-categoria").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;

          const result = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¡No podrás revertir esto!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
          });

          if (result.isConfirmed) {
            await fetch(`/api/categorias/${id}`, { method: "DELETE" });
            await cargarCategorias();

            Swal.fire({
              icon: 'success',
              title: '¡Eliminado!',
              text: 'La categoría ha sido eliminada.'
            });
          }
        });
      });
    } catch (err) {
      console.error("Error cargando categorías:", err);
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se pudieron cargar las categorías'
      });
    }
  }

  // Enviar formulario (crear o editar)
  formCategoria.addEventListener("submit", async (e) => {
    e.preventDefault();
    const nombre = document.getElementById("nombre_categoria").value;
    const descripcion = document.getElementById("descripcion_categoria").value;

    try {
      if (modoEdicion) {
        await fetch(`/api/categorias/${categoriaEditar}`, {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ nombre, descripcion })
        });

        Swal.fire({
          icon: 'success',
          title: '¡Actualizado!',
          text: 'La categoría fue actualizada correctamente.'
        });
      } else {
        await fetch("/api/categorias", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ nombre, descripcion })
        });

        Swal.fire({
          icon: 'success',
          title: '¡Agregado!',
          text: 'La categoría fue agregada correctamente.'
        });
      }

      modal.style.display = "none";
      cargarCategorias();
    } catch (err) {
      console.error("Error al guardar la categoría:", err);
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se pudo guardar la categoría.'
      });
    }
  });

  cargarCategorias(); // Inicializar
});
