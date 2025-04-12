document.addEventListener('DOMContentLoaded', () => {
    cargarCategorias();
    cargarDestinos();
    cargarEmpresas();
  
    const formulario = document.querySelector('form');
    formulario.addEventListener('submit', function (e) {
      e.preventDefault(); // Evita el envío normal del formulario
  
      const formData = new FormData(formulario);
  
      fetch('/api/contenido/agregar_contenido', {
        method: 'POST',
        body: formData
      })
        .then(res => {
          if (res.ok) {
            alert('Contenido agregado correctamente');
            window.location.href = 'empresa.html'; // Redirige al terminar
          } else {
            return res.text().then(text => {
              throw new Error(text || 'Error al guardar el contenido');
            });
          }
        })
        .catch(err => {
          console.error('Error:', err);
          alert('Hubo un problema al guardar el contenido.');
        });
    });
  });
  
  function cargarCategorias() {
    fetch('/api/contenido/categorias')
      .then(res => res.json())
      .then(data => {
        const select = document.getElementById('id_categoria');
        data.forEach(categoria => {
          const option = document.createElement('option');
          option.value = categoria.id_categoria;
          option.textContent = categoria.nombre;
          select.appendChild(option);
        });
      })
      .catch(error => console.error('Error al cargar categorías:', error));
  }
  
  function cargarDestinos() {
    fetch('/api/contenido/destinos')
      .then(res => res.json())
      .then(data => {
        const select = document.getElementById('id_destino');
        data.forEach(destino => {
          const option = document.createElement('option');
          option.value = destino.id_destino;
          option.textContent = destino.nombre;
          select.appendChild(option);
        });
      })
      .catch(error => console.error('Error al cargar destinos:', error));
  }
  
  function cargarEmpresas() {
    fetch('/api/contenido/empresas')
      .then(res => res.json())
      .then(data => {
        const select = document.getElementById('id_empresa');
        data.forEach(empresa => {
          const option = document.createElement('option');
          option.value = empresa.id_empresa;
          option.textContent = empresa.nombre;
          select.appendChild(option);
        });
      })
      .catch(error => console.error('Error al cargar empresas:', error));
  }
  