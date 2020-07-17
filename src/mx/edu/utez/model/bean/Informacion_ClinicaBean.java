package mx.edu.utez.model.bean;

public class Informacion_ClinicaBean {

    private String matricula = "01234";//new EstudianteBean().getMatricula();
    private double peso = 68.2;
    private double estatura = 1.80;
    private double imc = 32.01;
    private String tipoSangre = "A+";
    private String numeroSeguro = "1233454";
    private String unidadMedica = "111114";
    private String alergias = "Al pasto";
    private String enferCronicas = "Ninguna";
    private String enferHereditarias = "Ninguna";
    private String discapacidades = "Ninguna";
    private String diagPsico = "Es algo nervioso";

    /*public Informacion_ClinicaBean(double peso, double estatura, double imc, String tipoSangre, String numeroSeguro,
                                   String unidadMedica, String alergias, String enferCronicas, String enferHereditarias,
                                   String discapacidades, String diagPsico) {
        this.peso = peso;
        this.estatura = estatura;
        this.imc = imc;
        this.tipoSangre = tipoSangre;
        this.numeroSeguro = numeroSeguro;
        this.unidadMedica = unidadMedica;
        this.alergias = alergias;
        this.enferCronicas = enferCronicas;
        this.enferHereditarias = enferHereditarias;
        this.discapacidades = discapacidades;
        this.diagPsico = diagPsico;
    }*/

    public String getMatricula() { return matricula; }

    public void setMatricula(String matricula) { this.matricula = matricula; }

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
