package mx.edu.utez.model.bean;

public class DomicilioBean {

    private String matriculaEstudiante;
    private String calle;
    private String noExterior;
    private String noInterior;
    private String colonia;
    private String municipio;
    private String codigoPostal;

    public DomicilioBean() {

    }

    public DomicilioBean(String matriculaEstudiante, String calle, String noExterior, String noInterior, String colonia, String municipio, String codigoPostal) {
        this.matriculaEstudiante = matriculaEstudiante;
        this.calle = calle;
        this.noExterior = noExterior;
        this.noInterior = noInterior;
        this.colonia = colonia;
        this.municipio = municipio;
        this.codigoPostal = codigoPostal;
    }

    public String getMatriculaEstudiante() {
        return matriculaEstudiante;
    }

    public void setMatriculaEstudiante(String matriculaEstudiante) {
        this.matriculaEstudiante = matriculaEstudiante;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNoExterior() {
        return noExterior;
    }

    public void setNoExterior(String noExterior) {
        this.noExterior = noExterior;
    }

    public String getNoInterior() {
        return noInterior;
    }

    public void setNoInterior(String noInterior) {
        this.noInterior = noInterior;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }
}
