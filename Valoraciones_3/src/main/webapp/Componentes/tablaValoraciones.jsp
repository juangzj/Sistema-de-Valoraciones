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
        <a href="index.jsp">Agregar nueva valoración</a> 
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
                        for (Valoracion v : misValoraciones) { %>
                <tr> 
                    <td><%= v.getId()%></td> 
                    <td><%= v.getNombre() %></td>  
                    <td><%= v.getFecha() %></td>
                    <td><%= v.getCorreo() %></td>
                    <td><%= v.getNegocio() %></td>
                    <td><%= v.getPuntuacion() %></td>
                    <td>
                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModalEditar" data-id="<%= v.getId() %>">Editar</button>
                        <button type="button" class="btn btn-danger eliminarValoracion-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= v.getId() %>">Eliminar</button>
                    </td>
                </tr>
                <% }
                    } else { %>
                <tr> 
                    <td colspan="6">No hay datos que mostrar</td>
                </tr>
                <% } %>
            </tbody>  
        </table>       
    </div>
</div>
