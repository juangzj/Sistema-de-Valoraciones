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
                        <!-- Botón para abrir el modal de ver -->
                        <button type="button" class="btn btn-success verValoracion-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#exampleModalVer" 
                                data-nombre="<%= v.getNombre()%>"
                                data-fecha="<%= v.getFecha()%>"
                                data-correo="<%= v.getCorreo()%>"
                                data-negocio="<%= v.getNegocio()%>"
                                data-puntuacion="<%= v.getPuntuacion()%>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                            </svg>
                        </button>


                        <!-- Botón para abrir el modal de edicion -->
                        <button type="button" class="btn btn-info editarValoracion-btn" data-bs-toggle="modal" data-bs-target="#exampleModalEditar" data-id="<%=v.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                            </svg></button>
                        <!-- Botón para abrir el modal de eliminacion  -->
                        <button type="button" class="btn btn-danger eliminarValoracion-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= v.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                            </svg></button>


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

<!-- Incluir jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Importamos el modal de edicion -->
<%@include file="verValoracionModal.jsp" %>

<!-- Importamos el modal de edicion -->
<%@include file="EditarValoracionModal.jsp" %>

<!-- Importamos el modal de eliminacion -->
<%@include file="EliminarValoracionModal.jsp" %>











