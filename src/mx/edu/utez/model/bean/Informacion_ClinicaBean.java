package mx.edu.utez.model.bean;

public class Informacion_ClinicaBean {

    private EstudianteBean estudiante = new EstudianteBean();

    private double peso;
    private double estatura;
    private double imc;
    private String tipoSangre;
    private String numeroSeguro;
    private String unidadMedica;
    private String alergias;
    private String enferCronicas;
    private String enferHereditarias;
    private String discapacidades;
    private String diagPsico;

    public EstudianteBean getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(EstudianteBean estudiante) {
        this.estudiante = estudiante;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public double getImc() {
        return imc;
    }

    public void setImc(double imc) {
        this.imc = imc;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public String getNumeroSeguro() {
        return numeroSeguro;
    }

    public void setNumeroSeguro(String numeroSeguro) {
        this.numeroSeguro = numeroSeguro;
    }

    public String getUnidadMedica() {
        return unidadMedica;
    }

    public void setUnidadMedica(String unidadMedica) {
        this.unidadMedica = unidadMedica;
    }

    public String getAlergias() {
        return alergias;
    }

    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    public String getEnferCronicas() {
        return enferCronicas;
    }

    public void setEnferCronicas(String enferCronicas) {
        this.enferCronicas = enferCronicas;
    }

    public String getEnferHereditarias() {
        return enferHereditarias;
    }

    public void setEnferHereditarias(String enferHereditarias) {
        this.enferHereditarias = enferHereditarias;
    }

    public String getDiscapacidades() {
        return discapacidades;
    }

    public void setDiscapacidades(String discapacidades) {
        this.discapacidades = discapacidades;
    }

    public String getDiagPsico() {
        return diagPsico;
    }

    public void setDiagPsico(String diagPsico) {
        this.diagPsico = diagPsico;
    }
}
