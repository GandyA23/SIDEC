package mx.edu.utez.model.bean;

public class ControlBean {
	private int folio;
	private String fecha;
	private String motivo;
	private String descripcion;
	private String canalizacion;
	private String CCT;
	private String matricula;
	private String nombre;
	private String apellido1;
	private String apellido2;

	public ControlBean(int folio, String fecha, String motivo, String descripcion, String canalizacion, String CCT, String matricula, String nombre, String apellido1, String apellido2) {
		this.folio = folio;
		this.fecha = fecha;
		this.motivo = motivo;
		this.descripcion = descripcion;
		this.canalizacion = canalizacion;
		this.CCT = CCT;
		this.matricula = matricula;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
	}

	public ControlBean(String matricula, String nombre, String apellido1, String apellido2) {
		this.matricula = matricula;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
	}

	public int getFolio() {
		return folio;
	}

	public void setFolio(int folio) {
		this.folio = folio;
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

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getCCT() {
		return CCT;
	}

	public void setCCT(String CCT) {
		this.CCT = CCT;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido1() {
		return apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	public String getApellido2() {
		return apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}
}
