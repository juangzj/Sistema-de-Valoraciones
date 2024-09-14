package mundo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletContext;
import mundo.Valoracion;

public class GestionarValoracion implements Serializable {

    private final String PATH = "./data/ListaValoraciones.dat";

    /**
     * Método para obtener la dirección path donde se encuentra serializado el
     * archivo de valoraciones
     *
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
     *
     * @return
     */
    public String generarId() {
        Random random = new Random();
        int id = random.nextInt(9000) + 1000; // Genera un número entre 1000 y 9999
        return String.valueOf(id);
    }

    /**
     * Método para agregar una nueva valoración con ID generado
     *
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

    /**+
     * Metodo para eliminar una valoracion
     * @param id
     * @param context
     * @return 
     */
    public boolean eliminarValoracion(String id, ServletContext context) {
        Serializacion ser = new Serializacion();

        // Deserializar la lista de valoraciones
        ArrayList<Valoracion> misValoraciones = ser.desArchivoSer(context, PATH);

        // Verificar si la lista es null o está vacía
        if (misValoraciones == null || misValoraciones.isEmpty()) {
            System.err.println("No hay valoraciones para eliminar.");
            return false;
        }

        // Buscar la valoración con el ID especificado y eliminarla
        boolean eliminado = misValoraciones.removeIf(valoracion -> valoracion.getId().equals(id));

        // Verificar si se eliminó la valoración
        if (eliminado) {
            // Serializar la lista actualizada
            ser.serializar(misValoraciones, context, PATH);
            System.out.println("Valoración con ID " + id + " eliminada exitosamente.");
            return true;
        } else {
            System.err.println("Valoración con ID " + id + " no encontrada.");
            return false;
        }
    }

}
