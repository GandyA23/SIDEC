package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Informacion_PersonalDao extends conexion {
	String idTutor;
	public int insertarDatos(EstudianteBean alumno, TutorBean tutor, DomicilioBean domicilio) {

		try {
			String idTutor = null;
			int estado;

			PreparedStatement sentencia = null;

			sentencia = crearConexion().prepareStatement("INSERT INTO estudiante values('" + alumno.getMatricula() + "','" + alumno.getCurp() + "','" + alumno.getNombre() + "','" + alumno.getApellido1() + "','" + alumno.getApellido2() + "','" + alumno.getFechaNacimiento() + "','" + alumno.getTelefono() + "','" + alumno.getCorreo() + "','" + alumno.getGenero() + "','" + alumno.getCicloEscolar() + "','" + alumno.getNivelActual() + "','" + alumno.getStatus() + "');");
			estado = sentencia.executeUpdate();
			if (estado == 1) {
				System.out.println("Se ejecuto el Alumno");
			}

			sentencia = null;

			sentencia = crearConexion().prepareStatement("INSERT INTO tutor values(null,'" + tutor.getNombre() + "','" + tutor.getApellido1() + "','" + tutor.getApellido2() + "','" + tutor.getTelefonoPersonal() + "','" + tutor.getTelefonoTrabajo() + "','" + tutor.getCorreo() + "','" + tutor.getGenero() + "')");
			estado = sentencia.executeUpdate();
			if (estado == 1) {
				System.out.println("Se ejecuto el tutor");
			}

			sentencia = null;

			ResultSet consulta;
			sentencia = crearConexion().prepareStatement("SELECT Id from tutor WHERE Nombre = '" + tutor.getNombre() + "' AND Apellido1 ='" + tutor.getApellido1() + "' AND Apellido2 ='" + tutor.getApellido2() + "'");
			consulta = sentencia.executeQuery();
			if (consulta.next()) {
				idTutor = consulta.getString("Id");
				System.out.println(idTutor);
			}

			sentencia = null;

			sentencia = crearConexion().prepareStatement("INSERT INTO domicilio values('" + domicilio.getMatriculaEstudiante() + "', '" + idTutor + "'  ,'" + domicilio.getCalle() + "','" + domicilio.getNoExterior() + "','" + domicilio.getNoInterior() + "','" + domicilio.getColonia() + "','" + domicilio.getMunicipio() + "','" + domicilio.getCodigoPostal() + "')");
			estado = sentencia.executeUpdate();
			if (estado == 1) {
				System.out.println("Se ejecuto docimilio");
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public void eliminarDatos(String matricula) {
		try {
			System.out.println(matricula);
			System.out.println("entro a la llamada");
			int estado;
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("UPDATE estudiante SET Status = 0 WHERE Matricula = '"+matricula+"'");
			estado = sentencia.executeUpdate();
			if (estado == 1) {
				System.out.println("Eliminado Exitoso");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EstudianteBean> datosEstudiante(String matricula) {
		try {
			List<EstudianteBean> alumno = new ArrayList<>();
			ResultSet resultSet = null;
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("SELECT * FROM estudiante WHERE Matricula = '" + matricula + "' AND Status = 1");
			resultSet = sentencia.executeQuery();
			if (resultSet.next()) {
				alumno.add(new EstudianteBean(resultSet.getString("Matricula"), resultSet.getString("Curp"), resultSet.getString("Nombre"), resultSet.getString("Apellido1"), resultSet.getString("Apellido2"), resultSet.getString("FechaNacimiento"), resultSet.getString("Telefono"), resultSet.getString("Correo"), resultSet.getString("Genero"), resultSet.getString("CicloEscolar"), resultSet.getString("NivelActual")));
				return alumno;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<TutorBean> datosTutor() {
		try {
			List<TutorBean> tutor = new ArrayList<>();
			PreparedStatement sentencia = null;
			ResultSet resultSet = null;
			sentencia = crearConexion().prepareStatement("SELECT * FROM tutor WHERE Id ='" + idTutor + "'");
			resultSet = sentencia.executeQuery();
			if(resultSet.next()){
				tutor.add(new TutorBean(resultSet.getString("Nombre"), resultSet.getString("Apellido1"), resultSet.getString("Apellido2"), resultSet.getString("TelefonoPersonal"), resultSet.getString("TelefonoTrabajo"), resultSet.getString("Correo"), resultSet.getString("Genero")));
				return tutor;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<DomicilioBean> datosDomicilio(String matricula) {
		try {
			List<DomicilioBean> domicilio = new ArrayList<>();
			ResultSet resultSet = null;
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("SELECT * FROM domicilio WHERE MatEstudiante = '" + matricula + "'");
			resultSet = sentencia.executeQuery();
			if (resultSet.next()) {
				idTutor = resultSet.getString("IdTutor");
				System.out.println(idTutor);
				domicilio.add(new DomicilioBean(resultSet.getString("MatEstudiante"), resultSet.getString("Calle"), resultSet.getString("NoExterior"), resultSet.getString("NoInterior"), resultSet.getString("Colonia"), resultSet.getString("Municipio"), resultSet.getString("CodigoPostal")));
				return domicilio;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String modificarDatos(String matricula, String nombre, String apellido1, String apellido2, String genero1, String dia, String mes, String año, String telefono, String correo, String añoInicio, String añoFin, String seleccion, String calle, String interior, String exterior, String codigoPostal, String colonia, String municipio, String tutorNombre, String tutorApellido1, String tutorApellido2, String genero2, String tutorCorreo, String tutorTelefono, String tutorTelTrabajo) {
		return "1";
	}

}
