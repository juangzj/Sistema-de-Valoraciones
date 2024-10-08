package mundo;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletContext;
/**
 * 
 * @author Juan Goyes_ Jhon Fredy
 */
public class Serializacion implements Serializable {

    // Método constructor
    public Serializacion() {
    }

    /**
     * Método para serializar una ArrayList con cualquier objeto
     *
     * @param <T>
     * @param archivoSer La lista de objetos a serializar.
     * @param context    El contexto del servlet.
     * @param dir        La ruta del archivo donde se serializará la lista.
     */
    public <T extends Serializable> void serializar(ArrayList archivoSer, ServletContext context, String dir) {
        // Obtener la ruta real del archivo en el servidor
        String Rpath = context.getRealPath(dir);
        try (FileOutputStream archivo = new FileOutputStream(Rpath);
             ObjectOutputStream out = new ObjectOutputStream(archivo)) {
            // Escribir el ArrayList en el archivo
            out.writeObject(archivoSer);
            System.out.println("Serialización exitosa en " + Rpath);
        } catch (IOException i) {
            System.err.println("Error al serializar el archivo: " + i.getMessage());
            i.printStackTrace();
        }
    }

    /**
     * Método para deserializar un ArrayList desde el archivo
     *
     * @param <T>
     * @param context El contexto del servlet.
     * @param dir     La ruta del archivo desde donde se deserializará la lista.
     * @return Un ArrayList deserializado o una nueva lista si el archivo no existe.
     */
    public <T> ArrayList<T> desArchivoSer(ServletContext context, String dir) {
        ArrayList<T> archivoSer = null;
        String Rpath = context.getRealPath(dir);

        // Comprobar si el archivo existe antes de intentar deserializar
        File file = new File(Rpath);
        if (!file.exists()) {
            System.err.println("Archivo no encontrado: " + Rpath + ". Se devolverá una lista vacía.");
            return new ArrayList<>(); // Devuelve una lista vacía si el archivo no existe
        }

        try (FileInputStream archivo = new FileInputStream(Rpath);
             ObjectInputStream in = new ObjectInputStream(archivo)) {
            // Leer el ArrayList del archivo
            archivoSer = (ArrayList<T>) in.readObject();
        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("Error de entrada/salida: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Clase no encontrada: " + e.getMessage());
        } catch (ClassCastException e) {
            System.err.println("Error de cast durante la deserialización: " + e.getMessage());
        }

        // Si la deserialización falla, devolver una lista vacía
        if (archivoSer == null) {
            archivoSer = new ArrayList<>();
        }
        return archivoSer;
    }
}
