package mx.edu.utez.model.bean;

import java.util.Date;

public class Log_EstBean {

    private EstudianteBean estudiante = new EstudianteBean();
    private LogroBean logro = new LogroBean();

    private int folio;
    private String descripcion;
    private Date fecha;

    public EstudianteBean getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(EstudianteBean estudiante) {
        this.estudiante = estudiante;
    }

    public LogroBean getLogro() {
        return logro;
    }

    public void setLogro(LogroBean logro) {
        this.logro = logro;
    }

    public int getFolio() {
        return folio;
    }

    public void setFolio(int folio) {
        this.folio = folio;
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
