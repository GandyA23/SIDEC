package mx.edu.utez.model.bean;

import java.util.Date;

public class Log_EstBean {
    private int folio;
    private int idLogro;
    private String matEstudiante;
    private String descripcion;
    private Date fecha;

    public Log_EstBean(int folio, int idLogro, String matEstudiante, String descripcion) {
        this.folio = folio;
        this.idLogro = idLogro;
        this.matEstudiante = matEstudiante;
        this.descripcion = descripcion;
    }
    
    public int getFolio() {
        return folio;
    }

    public void setFolio(int folio) {
        this.folio = folio;
    }

    public int getIdLogro() {
        return idLogro;
    }

    public void setIdLogro(int idLogro) {
        this.idLogro = idLogro;
    }

    public String getMatEstudiante() {
        return matEstudiante;
    }

    public void setMatEstudiante(String matEstudiante) {
        this.matEstudiante = matEstudiante;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
