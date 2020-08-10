package mx.edu.utez.model.dao;

import com.sun.java.browser.plugin2.liveconnect.v1.Result;
import mx.edu.utez.controller.AcademicoServlet;
import mx.edu.utez.model.bean.*;
import mx.edu.utez.utility.conexion;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Informacion_AcademicaDao extends conexion {

	public int insertarDatos(AcademicoBean academicoBean) {
		try {
			CallableStatement statement = crearConexion().prepareCall("{call Verificar_Estudiante(?)}");
			statement.setString(1,academicoBean.getMatricula().getMatricula());
			statement.execute();
			ResultSet rs = statement.getResultSet();
			if(rs.next()){
				CallableStatement stm = crearConexion().prepareCall("{call Add_Informacion_Academica(?,?,?,?,?,?)}");
				stm.setString(1, academicoBean.getMatricula().getMatricula());
				stm.setString(2, academicoBean.getDiploma());
				stm.setString(3, academicoBean.getReconocimiento());
				stm.setString(4, academicoBean.getMencion());
				stm.setString(5, academicoBean.getCertificacion());
				stm.setString(6, academicoBean.getObservacion());
				stm.execute();
				stm.close();
			}
			statement.close();
			rs.close();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<AcademicoBean> consultarDatos(String matricula) {
		try {
			List<AcademicoBean> listAcademico = new ArrayList<>();
			CallableStatement stm = crearConexion().prepareCall("{call Select_Informacion_Academica(?)}");
			stm.setString(1, matricula);
			stm.execute();
			ResultSet resultSet = stm.getResultSet();
			if (resultSet.next()) {
				String diploma = resultSet.getString("Diploma");
				String recono = resultSet.getString("Reconocimiento");
				String mencion = resultSet.getString("Mencion");
				String certi = resultSet.getString("Certificacion");
				String obser = resultSet.getString("Observacion");
				listAcademico.add(new AcademicoBean(new EstudianteBean(matricula), diploma, recono, mencion, certi, obser));
				return listAcademico;
			}else return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int eliminarDatos(String matricula) {
		try {
			CallableStatement stm = crearConexion().prepareCall("{call Delete_Informacion_Academica(?)}");
			stm.setString(1, matricula);
			boolean resul = stm.execute();
			stm.close();
			if (!resul) return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int modificarDatos(AcademicoBean academicoBean) {
		try{
			CallableStatement stm = crearConexion().prepareCall("{call Update_Informacion_Academica(?,?,?,?,?,?)}");
			stm.setString(1, academicoBean.getDiploma());
			stm.setString(2, academicoBean.getReconocimiento());
			stm.setString(3, academicoBean.getMencion());
			stm.setString(4, academicoBean.getCertificacion());
			stm.setString(5, academicoBean.getObservacion());
			stm.setString(6, academicoBean.getMatricula().getMatricula());
			boolean resul = stm.execute();
			stm.close();
			if (!resul) return 1;
		}catch (SQLException e){
			e.printStackTrace();
		}
		return 0;
	}

	public int traerFolio() {
		try{
			CallableStatement stm = crearConexion().prepareCall("{call Select_Folio()}");
			stm.execute();
			ResultSet resultSet = stm.getResultSet();
			if(resultSet.next()){
				int folio = resultSet.getInt("Folio");
				stm.close();
				resultSet.close();
				return (folio+1);
			}else{
				return 1;
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return 0;
	}

	public List<ControlBean> listaEstudiantesReportados() {
		List<ControlBean> controlBean = new ArrayList<>();
		try {
			CallableStatement stm = crearConexion().prepareCall("{call Select_Estudiante_Reportado()}");
			stm.execute();
			ResultSet resultSet = stm.getResultSet();
			while (resultSet.next()){
				int folio = resultSet.getInt("r.Folio");
				String fecha = resultSet.getString("r.Fecha");
				String motivo = resultSet.getString("r.Motivo");
				String descripcion = resultSet.getString("r.Descripcion");
				String canalizacion = resultSet.getString("r.Canalizacion");
				String CCT = resultSet.getString("r.CCT");
				String matricula = resultSet.getString("r.MatEstudiante");
				String nombre = resultSet.getString("e.Nombre");
				String apellido1 = resultSet.getString("e.Apellido1");
				String apellido2 = resultSet.getString("e.Apellido2");
				controlBean.add(new ControlBean(folio, fecha, motivo, descripcion, canalizacion, CCT, matricula, nombre, apellido1, apellido2));
			}
			stm.close();
			resultSet.close();
		}catch (SQLException e){
			e.printStackTrace();
		}
		return controlBean;
	}

	public int insertarReporte(ReporteBean reporteBean) {
		try{
			CallableStatement statement = crearConexion().prepareCall("{call Verificar_Estudiante(?)}");
			statement.setString(1,reporteBean.getMatricula().getMatricula());
			statement.execute();
			ResultSet rs = statement.getResultSet();
			if(rs.next()){
				CallableStatement stm = crearConexion().prepareCall("{call Add_Reporte(?,?,?,?,?,?,?)}");
				stm.setInt(1, reporteBean.getFolio());
				stm.setString(2, reporteBean.getFecha());
				stm.setString(3, reporteBean.getMotivo());
				stm.setString(4, reporteBean.getDescripcion());
				stm.setString(5, reporteBean.getCanalizacion());
				stm.setString(6, reporteBean.getCct().getCct());
				stm.setString(7, reporteBean.getMatricula().getMatricula());
				stm.execute();
			}
			rs.close();
			statement.close();
			return 1;
		}catch (SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
