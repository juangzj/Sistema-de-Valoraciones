package mundo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletContext;
import mundo.Valoracion;

public class GestionarValoracion implements Serializable  {

    private final String PATH = "./data/ListaValoraciones.dat";

    /**
     * Método para obtener la dirección path donde se encuentra serializado el archivo de valoraciones
     * @return 
     */
    public String getPATH() {
        return PATH;
    }

    //metodo constructor
    public GestionarValoracion() {
    }

    
    /**
     * Método para generar un id de 4 números
     * @return 
     */
    public String generarId() {
        Random random = new Random();
        int id = random.nextInt(9000) + 1000; // Genera un número entre 1000 y 9999
        return String.valueOf(id);
    }

    /**
     * Método para agregar una nueva valoración con ID generado
     * @param context
     * @param nombre
     * @param fecha
     * @param correo
     * @param negocio
     * @param puntuacion
     */
    public void agregarValoracion(ServletContext context, String nombre, String fecha, String correo, String negocio, String puntuacion) {
        Serializacion ser = new Serializacion();
        ArrayList<Valoracion> misValoraciones = ser.desArchivoSer(context, getPATH());

        // Verificar si la lista es null y, si es así, inicializarla
        if (misValoraciones == null) {
            misValoraciones = new ArrayList<>();
        }

        // Generar ID aleatorio y crear nueva valoración
        String id = generarId();
        Valoracion miValoracion = new Valoracion(id, nombre, fecha, correo, negocio, puntuacion);

        // Añadir la nueva valoración a la lista
        misValoraciones.add(miValoracion);

        // Serializar la lista actualizada
      ser.serializar(misValoraciones, context, PATH);
    }
}
