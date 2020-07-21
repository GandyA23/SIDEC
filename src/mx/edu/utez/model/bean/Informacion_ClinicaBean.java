package mx.edu.utez.model.bean;

public class Informacion_ClinicaBean {
	private String matricula;
	private String peso;
	private String estatura;
	private String imc;
	private String tipoSangre;
	private String numeroSeguro;
	private String unidadMedica;

	private String tipoalergias;
	private String alergias;

	private String tipoEnferCronicas;
	private String enferCronicas;

	private String tipoEnferHereditarias;
	private String enferHereditarias;

	private String tipoDiscapacidades;
	private String discapacidades;

	private String diagPsico;

	public Informacion_ClinicaBean() {
	}

	public Informacion_ClinicaBean(String matricula, String peso, String estatura, String imc, String tipoSangre, String numeroSeguro,
	                               String unidadMedica, String tipoalegias, String alergias, String tipoEnferCronicas, String enferCronicas,
	                               String tipoEnferHereditarias, String enferHereditarias, String tipoDiscapacidades, String discapacidades,
	                               String diagPsico) {
		this.matricula = matricula;
		this.peso = peso;
		this.estatura = estatura;
		this.imc = imc;
		this.tipoSangre = tipoSangre;
		this.numeroSeguro = numeroSeguro;
		this.unidadMedica = unidadMedica;
		this.tipoalergias = tipoalegias;
		this.alergias = alergias;
		this.tipoEnferCronicas = tipoEnferCronicas;
		this.enferCronicas = enferCronicas;
		this.tipoEnferHereditarias = tipoEnferHereditarias;
		this.enferHereditarias = enferHereditarias;
		this.tipoDiscapacidades = tipoDiscapacidades;
		this.discapacidades = discapacidades;
		this.diagPsico = diagPsico;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getEstatura() {
		return estatura;
	}

	public void setEstatura(String estatura) {
		this.estatura = estatura;
	}

	public String getImc() {
		return imc;
	}

	public void setImc(String imc) {
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

	public String getTipoalergias() {
		return tipoalergias;
	}

	public void setTipoalergias(String tipoalergias) {
		this.tipoalergias = tipoalergias;
	}

	public String getAlergias() {
		return alergias;
	}

	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}

	public String getTipoEnferCronicas() {
		return tipoEnferCronicas;
	}

	public void setTipoEnferCronicas(String tipoEnferCronicas) {
		this.tipoEnferCronicas = tipoEnferCronicas;
	}

	public String getEnferCronicas() {
		return enferCronicas;
	}

	public void setEnferCronicas(String enferCronicas) {
		this.enferCronicas = enferCronicas;
	}

	public String getTipoEnferHereditarias() {
		return tipoEnferHereditarias;
	}

	public void setTipoEnferHereditarias(String tipoEnferHereditarias) {
		this.tipoEnferHereditarias = tipoEnferHereditarias;
	}

	public String getEnferHereditarias() {
		return enferHereditarias;
	}

	public void setEnferHereditarias(String enferHereditarias) {
		this.enferHereditarias = enferHereditarias;
	}

	public String getTipoDiscapacidades() {
		return tipoDiscapacidades;
	}

	public void setTipoDiscapacidades(String tipoDiscapacidades) {
		this.tipoDiscapacidades = tipoDiscapacidades;
	}

	public String getDiscapacidades(){
		return  discapacidades;
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
