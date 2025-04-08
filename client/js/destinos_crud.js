document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("modalDestino");
    const btnAbrir = document.querySelector(".add-btn-destino");
    const btnCerrar = document.querySelector(".close-destino");
    const form = document.getElementById("formDestino");
    const tabla = document.getElementById("destinos-tbody");
    const selectCategoria = document.getElementById("categoria_destino");
  
    let modoEdicion = false;
    let destinoEditar = null;
  
    btnAbrir.addEventListener("click", () => {
      document.getElementById("modalDestinoTitulo").innerText = "Añadir Destino";
      form.reset();
      modal.style.display = "block";
      modoEdicion = false;
    });
  
    btnCerrar.addEventListener("click", () => {
      modal.style.display = "none";
    });
  
    async function cargarCategoriasEnSelect() {
      const res = await fetch("/api/categorias");
      const categorias = await res.json();
      selectCategoria.innerHTML = "";
      categorias.forEach(cat => {
        const option = document.createElement("option");
        option.value = cat.id_categoria;
        option.text = cat.nombre;
        selectCategoria.appendChild(option);
      });
    }
  
    async function cargarDestinos() {
      const res = await fetch("/api/destinos");
      const destinos = await res.json();
  
      tabla.innerHTML = "";
  
      destinos.forEach(dest => {
        const fila = document.createElement("tr");
        fila.innerHTML = `
          <td>${dest.id_destino}</td>
          <td>${dest.nombre}</td>
          <td>${dest.descripcion}</td>
          <td>${dest.ciudad}</td>
          <td>${dest.direccion}</td>
          <td>${dest.categoria}</td>
          <td class="actions">
            <button class="action-btn edit-btn-destino" data-id="${dest.id_destino}"><i class="fas fa-edit"></i></button>
            <button class="action-btn delete-btn-destino" data-id="${dest.id_destino}"><i class="fas fa-trash"></i></button>
          </td>

        `;
        tabla.appendChild(fila);
      });
  
      document.querySelectorAll(".edit-btn-destino").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;
          const destinos = await fetch("/api/destinos");
          const lista = await destinos.json();
          const dest = lista.find(d => d.id_destino == id);
  
          document.getElementById("nombre_destino").value = dest.nombre;
          document.getElementById("descripcion_destino").value = dest.descripcion;
          document.getElementById("ciudad_destino").value = dest.ciudad;
          document.getElementById("direccion_destino").value = dest.direccion;
          selectCategoria.value = dest.id_categoria;
  
          destinoEditar = id;
          modoEdicion = true;
          document.getElementById("modalDestinoTitulo").innerText = "Editar Destino";
          modal.style.display = "block";
        });
      });
  
      document.querySelectorAll(".delete-btn-destino").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;
          if (confirm("¿Estás seguro de eliminar este destino?")) {
            await fetch(`/api/destinos/${id}`, { method: "DELETE" });
            cargarDestinos();
          }
        });
      });
    }
  
    form.addEventListener("submit", async (e) => {
      e.preventDefault();
      const destino = {
        nombre: document.getElementById("nombre_destino").value,
        descripcion: document.getElementById("descripcion_destino").value,
        ciudad: document.getElementById("ciudad_destino").value,
        direccion: document.getElementById("direccion_destino").value,
        id_categoria: document.getElementById("categoria_destino").value
      };
  
      if (modoEdicion) {
        await fetch(`/api/destinos/${destinoEditar}`, {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(destino)
        });
      } else {
        await fetch("/api/destinos", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(destino)
        });
      }
  
      modal.style.display = "none";
      cargarDestinos();
    });
  
    cargarCategoriasEnSelect();
    cargarDestinos();
  });
  