document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("modalEmpresa");
    const btnAbrir = document.querySelector(".add-btn-empresa");
    const btnCerrar = document.querySelector(".close-empresa");
    const form = document.getElementById("formEmpresa");
    const tabla = document.getElementById("empresas-tbody");
    const selectUsuario = document.getElementById("usuario_empresa");
    const selectDestino = document.getElementById("destino_empresa");
  
    let modoEdicion = false;
    let empresaEditar = null;
  
    btnAbrir.addEventListener("click", () => {
      document.getElementById("modalEmpresaTitulo").innerText = "Añadir Empresa";
      form.reset();
      modal.style.display = "block";
      modoEdicion = false;
    });
  
    btnCerrar.addEventListener("click", () => {
      modal.style.display = "none";
    });
  
    async function cargarOpciones() {
      const [usuarios, destinos] = await Promise.all([
        fetch("/api/usuarios").then(res => res.json()),
        fetch("/api/destinos").then(res => res.json())
      ]);
  
      selectUsuario.innerHTML = "";
      usuarios.forEach(u => {
        const option = document.createElement("option");
        option.value = u.id_usuario;
        option.text = u.nombre;
        selectUsuario.appendChild(option);
      });
  
      selectDestino.innerHTML = "";
      destinos.forEach(d => {
        const option = document.createElement("option");
        option.value = d.id_destino;
        option.text = d.nombre;
        selectDestino.appendChild(option);
      });
    }
  
    async function cargarEmpresas() {
      const res = await fetch("/api/empresas");
      const empresas = await res.json();
  
      tabla.innerHTML = "";
  
      empresas.forEach(emp => {
        const fila = document.createElement("tr");
        fila.innerHTML = `
          <td>${emp.id_empresa}</td>
          <td>${emp.nombre}</td>
          <td>${emp.descripcion}</td>
          <td>${emp.tipo}</td>
          <td>${emp.horario_apertura}</td>
          <td>${emp.horario_cierre}</td>
          <td>${emp.telefono}</td>
          <td>${emp.usuario}</td>
          <td>${emp.destino}</td>
          <td class="actions">
            <button class="action-btn edit-btn-empresa" data-id="${emp.id_empresa}"><i class="fas fa-edit"></i></button>
            <button class="action-btn delete-btn-empresa" data-id="${emp.id_empresa}"><i class="fas fa-trash"></i></button>
          </td>
        `;
        tabla.appendChild(fila);
      });
  
      document.querySelectorAll(".edit-btn-empresa").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;
          const res = await fetch(`/api/empresas/${id}`);
          const emp = await res.json();
  
          document.getElementById("nombre_empresa").value = emp.nombre;
          document.getElementById("descripcion_empresa").value = emp.descripcion;
          document.getElementById("tipo_empresa").value = emp.tipo;
          document.getElementById("horario_apertura_empresa").value = emp.horario_apertura;
          document.getElementById("horario_cierre_empresa").value = emp.horario_cierre;
          document.getElementById("telefono_empresa").value = emp.telefono;
          selectUsuario.value = emp.id_usuario;
          selectDestino.value = emp.id_destino;
  
          empresaEditar = id;
          modoEdicion = true;
          document.getElementById("modalEmpresaTitulo").innerText = "Editar Empresa";
          modal.style.display = "block";
        });
      });
  
      document.querySelectorAll(".delete-btn-empresa").forEach(btn => {
        btn.addEventListener("click", async () => {
          const id = btn.dataset.id;
          if (confirm("¿Estás seguro de eliminar esta empresa?")) {
            await fetch(`/api/empresas/${id}`, { method: "DELETE" });
            cargarEmpresas();
          }
        });
      });
    }
  
    form.addEventListener("submit", async (e) => {
      e.preventDefault();
  
      const empresa = {
        nombre: document.getElementById("nombre_empresa").value,
        descripcion: document.getElementById("descripcion_empresa").value,
        tipo: document.getElementById("tipo_empresa").value,
        horario_apertura: document.getElementById("horario_apertura_empresa").value,
        horario_cierre: document.getElementById("horario_cierre_empresa").value,
        telefono: document.getElementById("telefono_empresa").value,
        id_usuario: selectUsuario.value,
        id_destino: selectDestino.value
      };
  
      if (modoEdicion) {
        await fetch(`/api/empresas/${empresaEditar}`, {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(empresa)
        });
      } else {
        await fetch("/api/empresas", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(empresa)
        });
      }
  
      modal.style.display = "none";
      cargarEmpresas();
    });
  
    cargarOpciones();
    cargarEmpresas();
  });
  