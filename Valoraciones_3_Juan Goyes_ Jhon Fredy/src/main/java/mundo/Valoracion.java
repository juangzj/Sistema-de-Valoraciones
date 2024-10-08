package mundo;

import java.io.Serializable;

/**
 *
 * @author Juan Goyes_ Jhon Fredy
 */
public class Valoracion implements Serializable {

    private static final long serialVersionUID = 1L; // Versión de serialización

    //Atributos 
    private String nombre;
    private String fecha;
    private String correo;
    private String negocio;
    private String puntuacion;
    private String id;

    //constructores
    public Valoracion() {
    }

    public Valoracion(String id, String nombre, String fecha, String correo, String negocio, String puntuacion) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.correo = correo;
        this.negocio = negocio;
        this.puntuacion = puntuacion;
        this.id = id;
    }

    //getters and setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNegocio() {
        return negocio;
    }

    public void setNegocio(String negocio) {
        this.negocio = negocio;
    }

    public String getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(String puntuacion) {
        this.puntuacion = puntuacion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
