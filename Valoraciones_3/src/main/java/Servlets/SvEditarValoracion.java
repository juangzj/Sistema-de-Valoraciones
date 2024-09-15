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
@WebServlet(name = "SvEditarValoracion", urlPatterns = {"/SvEditarValoracion"})
public class SvEditarValoracion extends HttpServlet {

    //Variable donde se guardará el id temporalmente
    String id = "";
    //LLamado a la clase GestionaValoracion para acceder a sus metodos
    GestionarValoracion gestiona = new GestionarValoracion();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtenemos los datos para la edicion
        String idValoracion = request.getParameter("idValoracionEditar");
        String nombreEditar = request.getParameter("nombreEditar");
        String fechaEditar = request.getParameter("fechaEditar");
        String correoEditar = request.getParameter("correoEditar");
        String negocioEditar = request.getParameter("negocioEditar");
        String puntuacionEditar = request.getParameter("puntuacionEditar");
        //Obtenemos el contexto del servlet
        ServletContext context = getServletContext();

        //System.out.println("EDICION: " + idValoracion);
        // System.out.println("nombreEditar: " + nombreEditar);
        
        if(idValoracion != null ){
            id = idValoracion;
        }
        if(nombreEditar != null ){
            gestiona.editarValoracion(id, nombreEditar, fechaEditar, correoEditar, negocioEditar, puntuacionEditar, context);
        }
        
        // Redirigir a la página listar
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
