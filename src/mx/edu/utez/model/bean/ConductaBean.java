package mx.edu.utez.model.bean;

import java.util.Date;

public class ConductaBean {
    private String matEstudiante;
    private Date fecha;
    private String observaciones;

    public ConductaBean(String matEstudiante, Date fecha, String observaciones) {
        this.matEstudiante = matEstudiante;
        this.fecha = fecha;
        this.observaciones = observaciones;
    }

    public String getMatEstudiante() {
        return matEstudiante;
    }

    public void setMatEstudiante(String matEstudiante) {
        this.matEstudiante = matEstudiante;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
