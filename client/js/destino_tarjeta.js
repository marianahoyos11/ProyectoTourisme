document.addEventListener("DOMContentLoaded", () => {
  cargarDestinos()
})

function cargarDestinos() {
  fetch("http://localhost:3000/api/destinos")
    .then(response => response.json())
    .then(data => {
      renderizarDestinos(data)
    })
    .catch(error => {
      console.error("Error cargando destinos:", error)
    })
}


// RENDERIZAR DESTINOS EN EL HTML
function renderizarDestinos(lista) {
  const contenedor = document.getElementById("contenedor-destinos")
  contenedor.innerHTML = ""

  if (!lista || lista.length === 0) {
    contenedor.innerHTML = `
      <div class="no-resultados">
        <p>No se encontraron destinos.</p>
      </div>
    `
    return
  }

  lista.forEach(destino => {

    const imagen = destino.imagen 
      ? `/uploads/${destino.imagen}` 
      : "/images/default.jpg"   // Imagen por defecto si no hay

    const descripcionCorta = destino.descripcion
      ? destino.descripcion.substring(0, 120) + "..."
      : "Sin descripción disponible."

    const card = `
      <div class="destino-card">
        <div class="destino-img">
          <img src="${imagen}" alt="${destino.nombre}">
        </div>
        <div class="destino-content">
          <h3>${destino.nombre}</h3>
          <div class="ubicacion">
            <i class="fas fa-map-marker-alt"></i>
            <span>${destino.ciudad}</span>
          </div>
          <p>${descripcionCorta}</p>
          <div class="destino-footer">
            <button 
              class="btn btn-primary btn-detalle" 
              data-id="${destino.id_destino}">
              Ver detalles
            </button>
          </div>
        </div>
      </div>
    `

    contenedor.innerHTML += card
  })

  activarBotonesDetalle()
}


// ACTIVAR BOTONES
function activarBotonesDetalle() {
  const botones = document.querySelectorAll(".btn-detalle")

  botones.forEach(boton => {
    boton.addEventListener("click", function () {
      const id = this.getAttribute("data-id")
      window.location.href = `destino_detalle.html?id=${id}`
    })
  })
}
