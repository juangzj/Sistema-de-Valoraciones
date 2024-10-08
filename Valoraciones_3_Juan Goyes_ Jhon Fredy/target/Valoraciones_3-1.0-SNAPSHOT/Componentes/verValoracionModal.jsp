<!-- Modal -->
<div class="modal fade" id="exampleModalVer" tabindex="-1" aria-labelledby="exampleModalVerLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalVerLabel">Ver Valoración</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Mostrar información de la valoración -->
        <form>
          <label for="modalNombre">Nombre:</label>
          <input class="form-control" type="text" id="modalNombre" readonly><br>
          <label for="modalFecha">Fecha:</label>
          <input class="form-control" type="text" id="modalFecha" readonly><br>
          <label for="modalCorreo">Correo:</label>
          <input class="form-control" type="text" id="modalCorreo" readonly><br>
          <label for="modalNegocio">Negocio:</label>
          <input class="form-control" type="text" id="modalNegocio" readonly><br>
          <label for="modalPuntuacion">Puntuación:</label>
          <input class="form-control" type="text" id="modalPuntuacion" readonly><br>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalVer').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var nombre = button.data('nombre');
        var fecha = button.data('fecha');
        var correo = button.data('correo');
        var negocio = button.data('negocio');
        var puntuacion = button.data('puntuacion');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#modalNombre').val(nombre);
        modal.find('#modalFecha').val(fecha);
        modal.find('#modalCorreo').val(correo);
        modal.find('#modalNegocio').val(negocio);
        modal.find('#modalPuntuacion').val(puntuacion);
    });
});

</script>