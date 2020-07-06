package mx.edu.utez.model.bean;

import java.util.Date;

public class ReporteBean {

    private EstudianteBean estudiante = new EstudianteBean();
    private TutorBean tutor = new TutorBean();

    private int folio;
    private Date fecha;
    private String motivo;
    private String descripcion;
    private String canalizacion;

    public EstudianteBean getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(EstudianteBean estudiante) {
        this.estudiante = estudiante;
    }

    public TutorBean getTutor() {
        return tutor;
    }

    public void setTutor(TutorBean tutor) {
        this.tutor = tutor;
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
}
