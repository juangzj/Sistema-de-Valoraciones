<%@ page import="mundo.GestionarValoracion" %>
<%@ page import="java.util.List" %>
<%@ page import="mundo.Valoracion" %>
<%@ page import="mundo.Serializacion" %> <!-- Importar la clase Serializacion -->

<%
    // Llamado a la clase GestionarValoracion para acceder a sus métodos
    GestionarValoracion gestiona = new GestionarValoracion();

    // Llamado a la clase Serializacion para acceder a sus métodos
    Serializacion ser = new Serializacion();

    // Obtenemos la dirección donde se encuentran las valoraciones serializadas
    String path = gestiona.getPATH();

    // Obtenemos el contexto del servlet
    ServletContext context = getServletContext();

    // Obtenemos la lista de valoraciones
    List<Valoracion> misValoraciones = ser.desArchivoSer(context, path);
%>

<!-- Columna para la tabla -->
<div class="col-md-8">
    <div class="card card-body">
        <table class="table table-bordered mt-3">  
            <thead>  
                <tr>
                    <th>ID</th> 
                    <th>Nombre</th> 
                    <th>Fecha</th>
                    <th>Correo</th>
                    <th>Negocio</th>
                    <th>Puntuación</th>
                    <th>Acciones</th>
                </tr>
            </thead> 
            <tbody>
                <%
                    // Verificar
                    if (misValoraciones != null) {
                        for (Valoracion v : misValoraciones) {%>
                <tr> 
                    <td><%= v.getId()%></td> 
                    <td><%= v.getNombre()%></td>  
                    <td><%= v.getFecha()%></td>
                    <td><%= v.getCorreo()%></td>
                    <td><%= v.getNegocio()%></td>
                    <td><%= v.getPuntuacion()%></td>
                    <td>
                        <!-- Botón para abrir el modal de edicion -->
                        <button type="button" class="btn btn-info editarValoracion-btn" data-bs-toggle="modal" data-bs-target="#exampleModalEditar" data-id="<%=v.getId()%>">Editar</button>
                        <!-- Botón para abrir el modal de eliminacion  -->
                        <button type="button" class="btn btn-danger eliminarValoracion-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= v.getId()%>">Eliminar</button>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr> 
                    <td colspan="6">No hay datos que mostrar</td>
                </tr>
                <% }%>
            </tbody>  
        </table>       
    </div>
</div>

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
                    <select class="form-control" name="negocioEditar required">
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

<!-- Incluir jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Modal Para Eliminar una valoracion-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas ELIMINAR el archivo con ID: <span id="valoracionIdEliminar"></span>?</p>
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
            // Mostrar el ID en el modal de eliminación
            $('#valoracionIdEliminar').text(idValoracionEliminar);

            // Envío de ID al servlet a través de AJAX (método POST)
            $.ajax({
                url: 'SvEliminarValoracion', // Url donde se enviara los datos(en este caso el id)
                method: 'POST', // Método de solicitud por donde llegara la información al servlet
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

