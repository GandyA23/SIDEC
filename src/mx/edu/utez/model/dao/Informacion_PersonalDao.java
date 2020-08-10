package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Informacion_PersonalDao extends conexion {
	public  String idTutor;

	public int insertarDatos(EstudianteBean alumno, TutorBean tutor, DomicilioBean domicilio) {
		try {
			String idTutor = null;
			boolean check1, check2, check3;
			CallableStatement sentencia = crearConexion().prepareCall("{call Add_Estudiante(?,?,?,?,?,?,?,?,?,?,?,?)}");
			sentencia.setString(1,alumno.getMatricula());
			sentencia.setString(2,alumno.getCurp());
			sentencia.setString(3,alumno.getNombre());
			sentencia.setString(4,alumno.getApellido1());
			sentencia.setString(5,alumno.getApellido2());
			sentencia.setString(6,alumno.getFechaNacimiento());
			sentencia.setString(7,alumno.getTelefono());
			sentencia.setString(8,alumno.getCorreo());
			sentencia.setString(9,alumno.getGenero());
			sentencia.setString(10,alumno.getCicloEscolar());
			sentencia.setString(11,alumno.getNivelActual());
			sentencia.setBlob(12, alumno.getFoto());
			check1 = sentencia.execute();

			sentencia = null;
			sentencia = crearConexion().prepareCall("{call Add_Tutor(null,?,?,?,?,?,?,?)}");
			sentencia.setString(1,tutor.getNombre());
			sentencia.setString(2,tutor.getApellido1());
			sentencia.setString(3,tutor.getApellido2());
			sentencia.setString(4,tutor.getTelefonoPersonal());
			sentencia.setString(5,tutor.getTelefonoTrabajo());
			sentencia.setString(6,tutor.getCorreo());
			sentencia.setString(7,tutor.getGenero());
			check2 = sentencia.execute();

			CallableStatement stn = crearConexion().prepareCall("{call Verificar_Tutor(?,?,?)}");
			stn.setString(1,tutor.getNombre());
			stn.setString(2,tutor.getApellido1());
			stn.setString(3,tutor.getApellido2());
			stn.execute();
			ResultSet consulta = stn.getResultSet();
			if(consulta.next()) idTutor = consulta.getString("Id");

			sentencia = null;
			sentencia = crearConexion().prepareCall("{call Add_Domicilio(?,?,?,?,?,?,?,?)}");
			sentencia.setString(1,domicilio.getMatriculaEstudiante().getMatricula());
			sentencia.setString(2,idTutor);
			sentencia.setString(3,domicilio.getCalle());
			sentencia.setString(4,domicilio.getNoExterior());
			sentencia.setString(5,domicilio.getNoInterior());
			sentencia.setString(6,domicilio.getColonia());
			sentencia.setString(7,domicilio.getMunicipio());
			sentencia.setString(8,domicilio.getCodigoPostal());
			check3 = sentencia.execute();

			return (check1 == check2 && check2 == check3) ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int eliminarDatos(String matricula) {
		try {
			CallableStatement sentencia = crearConexion().prepareCall("{call Delete_Estudiante(?)}");
			sentencia.setString(1, matricula);
			sentencia.execute();
			sentencia.close();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<EstudianteBean> datosEstudiante(String matricula) {
		try {
			List<EstudianteBean> alumno = new ArrayList<>();
			CallableStatement sentencia = crearConexion().prepareCall("{CALL Verificar_Estudiante(?)}");
			sentencia.setString(1,matricula);
			sentencia.execute();
			ResultSet resultSet = sentencia.getResultSet();
			if (resultSet.next()) {
				alumno.add(new EstudianteBean(resultSet.getString("Matricula"), resultSet.getString("Curp"), resultSet.getString("Nombre"), resultSet.getString("Apellido1"), resultSet.getString("Apellido2"), resultSet.getString("FechaNacimiento"), resultSet.getString("Telefono"), resultSet.getString("Correo"), resultSet.getString("Genero"), resultSet.getString("CicloEscolar"), resultSet.getString("NivelActual")));
				sentencia.close();
				resultSet.close();
			}else{
				return null;
			}

			return alumno;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<TutorBean> datosTutor() {
		try {
			List<TutorBean> tutor = new ArrayList<>();
			CallableStatement sentencia = crearConexion().prepareCall("{call Select_Tutor(?)}");
			sentencia.setInt(1,Integer.parseInt(idTutor));
			sentencia.execute();
			ResultSet resultSet = sentencia.getResultSet();
			if (resultSet.next()) {
				tutor.add(new TutorBean(resultSet.getString("Nombre"), resultSet.getString("Apellido1"), resultSet.getString("Apellido2"), resultSet.getString("TelefonoPersonal"), resultSet.getString("TelefonoTrabajo"), resultSet.getString("Correo"), resultSet.getString("Genero")));
			}
			sentencia.close();
			resultSet.close();
			return tutor;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<DomicilioBean> datosDomicilio(String matricula) {
		try {
			List<DomicilioBean> domicilio = new ArrayList<>();
			CallableStatement sentencia = crearConexion().prepareCall("{call Select_Domicilio(?)}");
			sentencia.setString(1,matricula);
			sentencia.execute();
			ResultSet resultSet = sentencia.getResultSet();
			if (resultSet.next()) {
				idTutor = resultSet.getString("IdTutor");
				domicilio.add(new DomicilioBean(new EstudianteBean(resultSet.getString("MatEstudiante")), resultSet.getString("Calle"), resultSet.getString("NoExterior"), resultSet.getString("NoInterior"), resultSet.getString("Colonia"), resultSet.getString("Municipio"), resultSet.getString("CodigoPostal")));
			}
			sentencia.close();
			resultSet.close();
			return domicilio;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int modificarDatos(EstudianteBean alumno, DomicilioBean domicilio, TutorBean tutor) {
		try {
			boolean check1, check2, check3;
			CallableStatement sentencia = null;
			sentencia = crearConexion().prepareCall("{call Update_Estudiante(?,?,?,?,?,?,?,?,?,?,?)}");
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
			check1 = sentencia.execute();

			sentencia = null;
			sentencia = crearConexion().prepareCall("{call Update_Tutor(?,?,?,?,?,?,?,?)}");
			sentencia.setString(1,tutor.getNombre());
			sentencia.setString(2,tutor.getApellido1());
			sentencia.setString(3,tutor.getApellido2());
			sentencia.setString(4,tutor.getTelefonoPersonal());
			sentencia.setString(5,tutor.getTelefonoTrabajo());
			sentencia.setString(6,tutor.getCorreo());
			sentencia.setString(7,tutor.getGenero());
			sentencia.setString(8, idTutor);
			check2 = sentencia.execute();

			sentencia = null;
			sentencia = crearConexion().prepareCall("{call Update_Domicilio(?,?,?,?,?,?,?,?)}");
			sentencia.setString(1,domicilio.getCalle());
			sentencia.setString(2,domicilio.getNoExterior());
			sentencia.setString(3,domicilio.getNoInterior());
			sentencia.setString(4,domicilio.getColonia());
			sentencia.setString(5,domicilio.getMunicipio());
			sentencia.setString(6,domicilio.getCodigoPostal());
			sentencia.setString(7,alumno.getMatricula());
			sentencia.setString(8,idTutor);
			check3 = sentencia.execute();
			sentencia.close();
			return (check1 == check2 && check2 == check3) ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public void consultarFoto(String matFoto, HttpServletResponse response) {
		InputStream is = null;
		OutputStream os = null;
		BufferedOutputStream bos = null;
		BufferedInputStream bis = null;
		response.setContentType("image/*");
		try {
			os = response.getOutputStream();
			CallableStatement pst = crearConexion().prepareCall("{call Select_Estudiante_Foto(?)}");
			pst.setString(1, matFoto);
			pst.execute();
			ResultSet rs = pst.getResultSet();
			if(rs.next())
				is = rs.getBinaryStream("Foto");
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(os);
			int i = 0;
			while((i=bis.read())!=-1){
				bos.write(i);
			}
			bos.close();
			bis.close();
			rs.close();
		}catch (SQLException | IOException e){
			e.printStackTrace();
		}
	}

	public void actualizarFoto(InputStream foto, String matricula) {
		try{
			CallableStatement sentencia = crearConexion().prepareCall("{call Update_Estudiante_Foto(?,?)}");
			sentencia.setBlob(1,foto);
			sentencia.setString(2,matricula);
			sentencia.execute();
			sentencia.close();
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
}
