package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.GestionarValoracion;
import mundo.Valoracion;

@WebServlet(name = "SvAniadirValoracion", urlPatterns = {"/SvAniadirValoracion"})
public class SvAniadirValoracion extends HttpServlet {

    // Llamado a la clase GestionarValoracion para acceder a sus métodos
    GestionarValoracion gestiona = new GestionarValoracion();

    // Lista donde se guardarán las valoraciones temporalmente
    ArrayList<Valoracion> valoraciones = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        // Puedes agregar lógica adicional aquí si lo necesitas
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String fecha = request.getParameter("fecha");
        String correo = request.getParameter("correo");
        String negocio = request.getParameter("negocio");
        String puntuacion = request.getParameter("puntuacion");

        // Obtener el contexto del servlet
        ServletContext context = getServletContext();

        // Mostrar los valores obtenidos
        System.out.println("nombre: " + nombre);
        System.out.println("fecha: " + fecha);
        System.out.println("correo: " + correo);
        System.out.println("negocio: " + negocio);
        System.out.println("puntuacion: " + puntuacion);

        // Agregar la nueva valoración
        gestiona.agregarValoracion(context, nombre, fecha, correo, negocio, puntuacion);        

        // Redirigir a la página listar
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para añadir valoraciones";
    }
}
