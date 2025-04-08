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

      // Agregar eventos a botones
      document.querySelectorAll(".edit-btn-categoria").forEach(btn => {
        btn.addEventListener("click", async (e) => {
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

      document.querySelectorAll(".delete-btn-categoria").forEach(btn => {
        btn.addEventListener("click", async (e) => {
          const id = btn.dataset.id;
          if (confirm("¿Estás seguro de eliminar esta categoría?")) {
            await fetch(`/api/categorias/${id}`, { method: "DELETE" });
            cargarCategorias();
          }
        });
      });
    } catch (err) {
      console.error("Error cargando categorías:", err);
    }
  }

  // Enviar formulario
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
      } else {
        await fetch("/api/categorias", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ nombre, descripcion })
        });
      }

      modal.style.display = "none";
      cargarCategorias();
    } catch (err) {
      console.error("Error al guardar la categoría:", err);
    }
  });

  cargarCategorias(); // Inicializar
});
