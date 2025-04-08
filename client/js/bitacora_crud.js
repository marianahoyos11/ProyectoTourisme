document.addEventListener("DOMContentLoaded", () => {
    const tablaBitacora = document.getElementById("bitacora-tbody");
  
    async function cargarBitacora() {
      try {
        const res = await fetch("/api/bitacora");
        const data = await res.json();
  
        tablaBitacora.innerHTML = "";
  
        data.forEach((registro) => {
          const fechaCompleta = new Date(registro.fecha);
          const fecha = fechaCompleta.toLocaleDateString();
          const hora = fechaCompleta.toLocaleTimeString();
  
          const fila = document.createElement("tr");
          fila.innerHTML = `
            <td>${registro.id_bitacora}</td>
            <td>${registro.usuario}</td>
            <td>${registro.accion}</td>
            <td>${fecha}</td>
            <td>${hora}</td>
            <td><button class="btn btn-sm btn-info" disabled><i class="fas fa-eye"></i> Ver</button></td>
          `;
          tablaBitacora.appendChild(fila);
        });
      } catch (err) {
        console.error("Error cargando la bitácora:", err);
      }
    }
  
    cargarBitacora();
  });
  