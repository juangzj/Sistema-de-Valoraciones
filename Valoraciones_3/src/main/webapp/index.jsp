<%@include file="libs/Header.jsp" %>
<h3>Sistema de Gestión de Valoraciones</h3> 
<div class="container p-4">
    <div class="row justify-content-center">
        <!-- Columna para el formulario -->
        <div class="col-md-4">
            <div class="card card-body">
                <form action="SvAniadirValoracion" method="POST">
                    <label>Nombre:</label>
                    <input class="form-control" type="text" id="nombre" name="nombre"><br>
                    <label>Fecha:</label>
                    <input class="form-control" type="date" id="fecha" name="fecha"><br>
                    <label>Correo:</label>
                    <input class="form-control" type="text" id="correo" name="correo"><br>
                    <label>Negocio:</label>
                    <select class="form-control" name="negocio">
                        <option value="0">Seleccione</option>
                        <option value="1">Mr.Pollo</option>
                        <option value="2">LA MERCED</option>
                    </select><br>
                    <label for="puntuacion">Puntuación:</label>
                    <select class="form-control" name="puntuacion">
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
                    <input class="form-control btn btn-success btn-block" type="submit" value="Evaluar">
                </form>
            </div>
        </div>
        <!-- Tabla de valoraciones registrdas -->
        <%@include file="Componentes/tablaValoraciones.jsp" %>>
    </div>
</div>

<%@include file="libs/Foother.jsp" %>