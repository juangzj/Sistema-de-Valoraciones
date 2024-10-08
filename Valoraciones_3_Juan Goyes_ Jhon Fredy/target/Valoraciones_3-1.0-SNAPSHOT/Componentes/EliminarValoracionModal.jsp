

<!-- Modal Para Eliminar una valoracion-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>�Est�s seguro de que deseas ELIMINAR el archivo con ID: <span id="valoracionIdEliminar"></span>?</p>
            </div>
            <form action="SvEliminarValoracion" method="POST">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" name="confirmacionEliminacion" value="confirmacionEliminar" >Eliminar</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Script para obtener el id de la valoracion que se va a elimnar y despues enviarla por ajaxx al servlet -->
    <script>
        // Captur clic y mandar el id de la  valoracion que se va a eliminar 
        $('.eliminarValoracion-btn').on('click', function () {
            // Obtener el ID de la valoracion
            const idValoracionEliminar = $(this).data('id');
            // Mostrar el ID en el modal de eliminaci�n
            $('#valoracionIdEliminar').text(idValoracionEliminar);

            // Env�o de ID al servlet a trav�s de AJAX (m�todo POST)
            $.ajax({
                url: 'SvEliminarValoracion', // Url donde se enviara los datos(en este caso el id)
                method: 'POST', // M�todo de solicitud por donde llegara la informaci�n al servlet
                data: {idValoracionEliminar: idValoracionEliminar}, // Datos a enviar (en este caso, el ID)
                success: function (response) {
                    // Manejar la respuesta del servidor si es necesario
                },
                error: function (xhr, status, error) {
                    console.error('Error al enviar la solicitud:', error);
                }
            });
        });
    </script>