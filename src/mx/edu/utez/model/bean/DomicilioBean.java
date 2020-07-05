package mx.edu.utez.model.bean;

public class DomicilioBean {
    private String matEstudiante;
    private int idTutor;
    private String calle;
    private String noExterior;
    private String noInterior;
    private String colonia;
    private String municipio;
    private String codigoPostal;

    public DomicilioBean(String matEstudiante, int idTutor, String calle, String noExterior, String noInterior, String colonia, String municipio, String codigoPostal) {
        this.matEstudiante = matEstudiante;
        this.idTutor = idTutor;
        this.calle = calle;
        this.noExterior = noExterior;
        this.noInterior = noInterior;
        this.colonia = colonia;
        this.municipio = municipio;
        this.codigoPostal = codigoPostal;
    }

    public String getMatEstudiante() {
        return matEstudiante;
    }

    public void setMatEstudiante(String matEstudiante) {
        this.matEstudiante = matEstudiante;
    }

    public int getIdTutor() {
        return idTutor;
    }

    public void setIdTutor(int idTutor) {
        this.idTutor = idTutor;
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
