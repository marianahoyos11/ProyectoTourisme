
let destinos = []
let destinosFiltrados = []

// CARGAR DESTINOS Y FILTRARLOS EN EL HTML //

async function cargarDestinos() {
  try {
    const response = await fetch("http://localhost:3000/api/destinos")
    destinos = await response.json()
    destinosFiltrados = destinos

    renderizarDestinos(destinosFiltrados)
    generarUbicaciones()

  } catch (error) {
    console.error("Error cargando destinos:", error)
  }
}


// CARGAR CATEGORIAS EN EL HTML //

async function cargarCategorias() {
  try {
    const response = await fetch("http://localhost:3000/api/categorias")
    const categorias = await response.json()

    const select = document.getElementById("categoria")
    select.innerHTML = '<option value="todos">Todas las categorias</option>'

    categorias.forEach(cat => {
      const option = document.createElement("option")
      option.value = cat.id_categoria
      option.textContent = cat.nombre
      select.appendChild(option)
    })

  } catch (error) {
    console.error("Error cargando categorías:", error)
  }
}


// GENERAR UBICACIONES EN EL HTML //

function generarUbicaciones() {
  const select = document.getElementById("ubicacion")
  select.innerHTML = '<option value="todos">Todas las ubicaciones</option>'

  const ciudades = [...new Set(destinos.map(d => d.ciudad).filter(Boolean))]

  ciudades.forEach(ciudad => {
    const option = document.createElement("option")
    option.value = ciudad
    option.textContent = ciudad
    select.appendChild(option)
  })
}


// RENDERIZAR DESTINOS EN EL HTML //

function renderizarDestinos(lista) {
  const contenedor = document.getElementById("contenedor-destinos")
  contenedor.innerHTML = ""

  if (lista.length === 0) {
    contenedor.innerHTML = `
      <div class="no-resultados">
        <p>No se encontraron destinos.</p>
      </div>
    `
    return
  }

  lista.forEach(destino => {

    // Imagen priniicpal por id 
    const imagenPrincipal = `img/destinos/${destino.id}1.jpg`
    
    const card = `
      <div class="destino-card">
        <div class="destino-img">
          <img src="${imagenPrincipal}" 
               alt="${destino.nombre}"
               onerror="this.src='img/default.jpg'">
        </div>
        <div class="destino-content">
          <h3>${destino.nombre}</h3>
          <div class="ubicacion">
            <i class="fas fa-map-marker-alt"></i>
            <span>${destino.ciudad}</span>
          </div>
          <p>${destino.descripcion || ''}</p>
          <div class="destino-footer">
            <a href="/destino_tarjeta.html?id=${destino.id}">
              <button class="btn btn-primary">Ver detalles</button>
            </a>
          </div>
        </div>
      </div>
    `
    contenedor.innerHTML += card
  })
}



// FILTRAR DESTINOS EN EL HTML //

function filtrarDestinos() {
  const categoria = document.getElementById("categoria").value
  const ubicacion = document.getElementById("ubicacion").value
  const busqueda = document.getElementById("busqueda").value.toLowerCase().trim()

  destinosFiltrados = destinos.filter(d => {

    const coincideCategoria =
      categoria === "todos" || d.id_categoria == categoria

    const coincideUbicacion =
      ubicacion === "todos" || d.ciudad === ubicacion

    const coincideBusqueda =
      busqueda === "" ||
      d.nombre.toLowerCase().includes(busqueda) ||
      (d.descripcion && d.descripcion.toLowerCase().includes(busqueda))

    return coincideCategoria && coincideUbicacion && coincideBusqueda
  })

  renderizarDestinos(destinosFiltrados)
}


// INICIALIZAR EL HTML //

document.addEventListener("DOMContentLoaded", () => {

  cargarDestinos()
  cargarCategorias()

  document.getElementById("categoria").addEventListener("change", filtrarDestinos)
  document.getElementById("ubicacion").addEventListener("change", filtrarDestinos)
  document.getElementById("busqueda").addEventListener("input", filtrarDestinos)
  document.querySelector(".btn-buscar").addEventListener("click", filtrarDestinos)

  document.getElementById("year").textContent = new Date().getFullYear()

})


