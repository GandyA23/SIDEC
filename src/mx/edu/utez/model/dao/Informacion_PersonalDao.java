package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Informacion_PersonalDao extends conexion {
	public static String idTutor;

	public int insertarDatos(EstudianteBean alumno, TutorBean tutor, DomicilioBean domicilio) {
		try {
			String idTutor = null;
			int check1, check2, check3;
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("INSERT INTO estudiante values('" + alumno.getMatricula() + "','" + alumno.getCurp() + "','" + alumno.getNombre() + "','" + alumno.getApellido1() + "','" + alumno.getApellido2() + "','" + alumno.getFechaNacimiento() + "','" + alumno.getTelefono() + "','" + alumno.getCorreo() + "','" + alumno.getGenero() + "','" + alumno.getCicloEscolar() + "','" + alumno.getNivelActual() + "','" + alumno.getStatus() + "');");
			check1 = sentencia.executeUpdate();
			if (check1 == 1) {
				System.out.println("Se ejecuto el Alumno");
			}
			sentencia = null;
			sentencia = crearConexion().prepareStatement("INSERT INTO tutor values(null,'" + tutor.getNombre() + "','" + tutor.getApellido1() + "','" + tutor.getApellido2() + "','" + tutor.getTelefonoPersonal() + "','" + tutor.getTelefonoTrabajo() + "','" + tutor.getCorreo() + "','" + tutor.getGenero() + "')");
			check2 = sentencia.executeUpdate();
			if (check2 == 1) {
				System.out.println("Se ejecuto el tutor");
			}
			sentencia = null;
			ResultSet consulta;
			sentencia = crearConexion().prepareStatement("SELECT Id from tutor WHERE Nombre = '" + tutor.getNombre() + "' AND Apellido1 ='" + tutor.getApellido1() + "' AND Apellido2 ='" + tutor.getApellido2() + "'");
			consulta = sentencia.executeQuery();
			if (consulta.next()) {
				idTutor = consulta.getString("Id");
			}
			sentencia = null;
			sentencia = crearConexion().prepareStatement("INSERT INTO domicilio values('" + domicilio.getMatriculaEstudiante() + "', '" + idTutor + "'  ,'" + domicilio.getCalle() + "','" + domicilio.getNoExterior() + "','" + domicilio.getNoInterior() + "','" + domicilio.getColonia() + "','" + domicilio.getMunicipio() + "','" + domicilio.getCodigoPostal() + "')");
			check3 = sentencia.executeUpdate();
			if (check3 == 1) {
				System.out.println("Se ejecuto docimilio");
			}
			return (check1 == check2 && check2 == check3) ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int eliminarDatos(String matricula) {
		try {
			int estado;
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("UPDATE estudiante SET Status = 0 WHERE Matricula = '" + matricula + "'");
			estado = sentencia.executeUpdate();
			if (estado == 1) {
				return estado;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
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
			if (resultSet.next()) {
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
				System.out.println("Id del Tutor: "+idTutor);
				domicilio.add(new DomicilioBean(resultSet.getString("MatEstudiante"), resultSet.getString("Calle"), resultSet.getString("NoExterior"), resultSet.getString("NoInterior"), resultSet.getString("Colonia"), resultSet.getString("Municipio"), resultSet.getString("CodigoPostal")));
				return domicilio;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void modificarDatos(EstudianteBean alumno, DomicilioBean domicilio, TutorBean tutor) {
		try {
			PreparedStatement sentencia = null;
			sentencia = crearConexion().prepareStatement("UPDATE estudiante SET Curp = ?, Nombre = ?, Apellido1 = ?, Apellido2 = ?, FechaNacimiento = ?, Telefono = ?, Correo = ?, Genero=?,CicloEscolar=?,NivelActual=? WHERE Matricula = ? AND Status = 1");
			sentencia.setString(1, alumno.getCurp());
			sentencia.setString(2, alumno.getNombre());
			sentencia.setString(3, alumno.getApellido1());
			sentencia.setString(4, alumno.getApellido2());
			sentencia.setString(5, alumno.getFechaNacimiento());
			sentencia.setString(6, alumno.getTelefono());
			sentencia.setString(7, alumno.getCorreo());
			sentencia.setString(8, alumno.getGenero());
			sentencia.setString(9, alumno.getCicloEscolar());
			sentencia.setString(10, alumno.getNivelActual());
			sentencia.setString(11, alumno.getMatricula());
			if(sentencia.executeUpdate()>0)
				System.out.println("ALUMNO");

			sentencia = null;
			sentencia = crearConexion().prepareStatement("UPDATE tutor SET Nombre = '"+tutor.getNombre()+"', Apellido1 = '"+tutor.getApellido1()+"', Apellido2 = '"+tutor.getApellido2()+"', TelefonoPersonal = '"+tutor.getTelefonoPersonal()+"', TelefonoTrabajo = '"+tutor.getTelefonoTrabajo()+"', Correo = '"+tutor.getCorreo()+"', Genero = '"+tutor.getGenero()+"' WHERE Id = '"+idTutor+"'");
			System.out.println(idTutor);
			if(sentencia.executeUpdate()>0)
				System.out.println("TUTOR");

			sentencia = null;
			sentencia = crearConexion().prepareStatement("UPDATE domicilio SET Calle = '"+domicilio.getCalle()+"', NoExterior = '"+domicilio.getNoExterior()+"', NoInterior = '"+domicilio.getNoInterior()+"', Colonia = '"+domicilio.getColonia()+"', Municipio = '"+domicilio.getMunicipio()+"', CodigoPostal = '"+domicilio.getCodigoPostal()+"' WHERE MatEstudiante = '"+alumno.getMatricula()+"' AND IdTutor = '"+idTutor+"'");
			System.out.println(idTutor);
			System.out.println(alumno.getMatricula());
			if(sentencia.executeUpdate()>0)
				System.out.println("DOMICILIO");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
