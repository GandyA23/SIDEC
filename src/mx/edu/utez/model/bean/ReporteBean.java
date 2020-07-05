package mx.edu.utez.model.bean;

import java.util.Date;

public class ReporteBean {
    private int folio;
    private Date fecha;
    private String motivo;
    private String descripcion;
    private String canalizacion;
    private String cct;
    private String matEstudiante;

    public ReporteBean(int folio, Date fecha, String motivo, String descripcion, String canalizacion, String cct, String matEstudiante) {
        this.folio = folio;
        this.fecha = fecha;
        this.motivo = motivo;
        this.descripcion = descripcion;
        this.canalizacion = canalizacion;
        this.cct = cct;
        this.matEstudiante = matEstudiante;
    }

    public int getFolio() {
        return folio;
    }

    public void setFolio(int folio) {
        this.folio = folio;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCanalizacion() {
        return canalizacion;
    }

    public void setCanalizacion(String canalizacion) {
        this.canalizacion = canalizacion;
    }

    public String getCct() {
        return cct;
    }

    public void setCct(String cct) {
        this.cct = cct;
    }

    public String getMatEstudiante() {
        return matEstudiante;
    }

    public void setMatEstudiante(String matEstudiante) {
        this.matEstudiante = matEstudiante;
    }
}
