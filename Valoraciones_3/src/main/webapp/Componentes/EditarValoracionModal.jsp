<!-- Modal Para Editar una valoracion-->
<div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="SvEditarValoracion" method="POST">
                <div class="modal-body">
                    <p>¿Estás seguro de que deseas EDITAR el archivo con ID: <span id="valoracionIdEditar"></span>?</p>


                    <label>Nombre:</label>
                    <input class="form-control" type="text" id="nombre" name="nombreEditar" required><br>
                    <label>Fecha:</label>
                    <input class="form-control" type="date" id="fecha" name="fechaEditar" required><br>
                    <label>Correo:</label>
                    <input class="form-control" type="text" id="correo" name="correoEditar" required><br>
                    <label>Negocio:</label>
                    <select class="form-control" name="negocioEditar" required>
                        <option value="0">Seleccione</option>
                        <option value="1">Mr.Pollo</option>
                        <option value="2">LA MERCED</option>
                    </select><br>
                    <label for="puntuacion">Puntuación:</label>
                    <select class="form-control" name="puntuacionEditar" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select><br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Editar</button>
                </div>
            </form>


        </div>
    </div>
</div>   
<!-- Script para obtener el id de la valoracion que se va a editar y despues enviarla por ajaxx al servlet -->
<script>
    // Captur clic y mandar el id de la  valoracion que se va a editar 
    $('.editarValoracion-btn').on('click', function () {
        // Obtener el ID de la valoracion
        const idValoracionEditar = $(this).data('id');
        // Mostrar el ID en el modal de la edicion
        $('#valoracionIdEditar').text(idValoracionEditar);

        // Envío de ID al servlet a través de AJAX (método POST)
        $.ajax({
            url: 'SvEditarValoracion', // Url donde se enviara los datos(en este caso el id)
            method: 'POST', // Método de solicitud por donde llegara la información al servlet
            data: {idValoracionEditar: idValoracionEditar}, // Datos a enviar (en este caso, el ID)
            success: function (response) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function (xhr, status, error) {
                console.error('Error al enviar la solicitud:', error);
            }
        });
    });
</script>