document.addEventListener("DOMContentLoaded", async () => {

  // Obtener ID desde la URL
  const params = new URLSearchParams(window.location.search)
  const id = params.get("id")

  if (!id) {
    window.location.href = "index.html"
    return
  }

  try {
    const response = await fetch("http://localhost:3000/api/destinos")
    const destinos = await response.json()

    const destino = destinos.find(d => d.id == id)

    if (!destino) {
      window.location.href = "index.html"
      return
    }

    // Rellenar datos en el HTML
    document.getElementById("destino-nombre").textContent = destino.nombre
    document.getElementById("destino-breadcrumb").textContent = destino.nombre
    document.getElementById("destino-descripcion").textContent = destino.descripcion
    document.getElementById("destino-ubicacion").textContent = destino.ciudad
    document.getElementById("destino-visitas").textContent = destino.visitas || 0
    document.getElementById("destino-rating").textContent = destino.rating || "0"
    document.getElementById("destino-reviews").textContent = destino.reviews || 0

    // Generar estrellas dinámicas
    generarEstrellas(destino.rating || 0)

  } catch (error) {
    console.error("Error cargando detalle:", error)
  }
})

function generarEstrellas(rating) {
  const contenedor = document.getElementById("destino-estrellas")
  contenedor.innerHTML = ""

  const estrellasLlenas = Math.floor(rating)

  for (let i = 0; i < 5; i++) {
    if (i < estrellasLlenas) {
      contenedor.innerHTML += '<i class="fas fa-star"></i>'
    } else {
      contenedor.innerHTML += '<i class="far fa-star"></i>'
    }
  }
}
