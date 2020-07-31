package mx.edu.utez.model.bean;

public class AcademicoBean {
	private EstudianteBean matricula;
	private String diploma;
	private String reconocimiento;
	private String mencion;
	private String certificacion;
	private String observacion;


	public AcademicoBean() {
	}

	public AcademicoBean(EstudianteBean matricula, String diploma, String reconocimiento, String mencion, String certificacion, String observacion) {
		this.matricula = matricula;
		this.diploma = diploma;
		this.reconocimiento = reconocimiento;
		this.mencion = mencion;
		this.certificacion = certificacion;
		this.observacion = observacion;
	}

	public EstudianteBean getMatricula() {
		return matricula;
	}

	public void setMatricula(EstudianteBean matricula) {
		this.matricula = matricula;
	}

	public String getDiploma() {
		return diploma;
	}

	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}

	public String getReconocimiento() {
		return reconocimiento;
	}

	public void setReconocimiento(String reconocimiento) {
		this.reconocimiento = reconocimiento;
	}

	public String getMencion() {
		return mencion;
	}

	public void setMencion(String mencion) {
		this.mencion = mencion;
	}

	public String getCertificacion() {
		return certificacion;
	}

	public void setCertificacion(String certificacion) {
		this.certificacion = certificacion;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
}
