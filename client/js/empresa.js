document.addEventListener('DOMContentLoaded', () => {
    const grid = document.querySelector('.contenido-grid');

    fetch('/api/contenido/listar')
        .then(response => response.json())
        .then(data => {
            // Limpiamos las tarjetas estáticas (hardcodeadas)
            grid.innerHTML = '';

            data.forEach(item => {
                const card = document.createElement('div');
                card.classList.add('contenido-card');

                card.innerHTML = `
                    <div class="contenido-img">
                        <img src="/uploads/${item.imagen}" alt="${item.titulo}">
                        <div class="contenido-actions">
                            <button class="action-btn edit-btn"><i class="fas fa-edit"></i></button>
                            <button class="action-btn delete-btn"><i class="fas fa-trash"></i></button>
                        </div>
                    </div>
                    <div class="contenido-info">
                        <h3>${item.titulo}</h3>
                        <p>${item.descripcion}</p>
                        <div class="contenido-meta">
                            <span class="fecha">Publicado: ${new Date(item.fecha_publicacion).toLocaleDateString()}</span>
                        </div>
                        <a href="destino_detalle.html?id=${item.id}" class="btn btn-outline btn-block">Ver Detalles</a>
                    </div>
                `;

                grid.appendChild(card);
            });
        })
        .catch(error => {
            console.error('Error al cargar los contenidos:', error);
        });

        const addContentBtn = document.getElementById('openAddContentModal');
        if (addContentBtn) {
            addContentBtn.addEventListener('click', () => {
                window.location.href = 'contenido_empresa.html';
            });
        }
});
