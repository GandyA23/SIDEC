package mx.edu.utez.model.bean;

public class ReporteBean {

    private int folio;
    private String fecha;
    private String motivo;
    private String descripcion;
    private String canalizacion;
    private UsuarioBean cct;
    private EstudianteBean matricula;

    public ReporteBean() {
    }

    public int getFolio() {
        return folio;
    }

    public void setFolio(int folio) {
        this.folio = folio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
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

    public UsuarioBean getCct() {
        return cct;
    }

    public void setCct(UsuarioBean cct) {
        this.cct = cct;
    }

    public EstudianteBean getMatricula() {
        return matricula;
    }

    public void setMatricula(EstudianteBean matricula) {
        this.matricula = matricula;
    }
}
