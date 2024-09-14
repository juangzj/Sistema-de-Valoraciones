package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.GestionarValoracion;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEliminarValoracion", urlPatterns = {"/SvEliminarValoracion"})
public class SvEliminarValoracion extends HttpServlet {

    //Variable donde se guardará el id temporalmente
    String id = "";
    
    //LLamado a la clase Gestionar Valoracion para acceder a sus metodos
    GestionarValoracion gestiona = new GestionarValoracion();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Obtenemos los datos para la emiminacion 
        String idValoracion = request.getParameter("idValoracionEliminar");
        String confirmacionEliminar = request.getParameter("confirmacionEliminacion");
        //Obtenemos el contexto del servlet
        ServletContext context = getServletContext();

        System.out.println("el ID es: " + idValoracion);
        System.out.println("La confirmacion es: " + confirmacionEliminar);
        
        //Guardamos el id temporalmente
        if(idValoracion != null){
            id = idValoracion;
        }
        //Realizamos la eliminacion de la valoracion segun el id
        if(confirmacionEliminar != null){
            gestiona.eliminarValoracion(id, context);
        }

        
        // Redirigir a la página listar
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
