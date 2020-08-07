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
			PreparedStatement statement = crearConexion().prepareStatement("SELECT * FROM estudiante WHERE Matricula = '"+academicoBean.getMatricula().getMatricula()+"' AND Status = 1");
			ResultSet rs = statement.executeQuery();
			if(rs.next()){
				CallableStatement stm = crearConexion().prepareCall("{call Add_Informacion_Academica(?,?,?,?,?,?)}");//("INSERT INTO informacion_academica VALUES(?,?,?,?,?,?)");
				stm.setString(1, academicoBean.getMatricula().getMatricula());
				stm.setString(2, academicoBean.getDiploma());
				stm.setString(3, academicoBean.getReconocimiento());
				stm.setString(4, academicoBean.getMencion());
				stm.setString(5, academicoBean.getCertificacion());
				stm.setString(6, academicoBean.getObservacion());
				stm.execute();
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<AcademicoBean> consultarDatos(String matricula) {
		try {
			List<AcademicoBean> listAcademico = new ArrayList<>();
			PreparedStatement stm = crearConexion().prepareStatement("SELECT * FROM informacion_academica WHERE Matricula = ?");
			stm.setString(1, matricula);
			ResultSet resultSet = stm.executeQuery();
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
			PreparedStatement stm = crearConexion().prepareStatement("DELETE FROM informacion_academica WHERE Matricula = ?");
			stm.setString(1, matricula);
			if (stm.executeUpdate() > 0) return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int modificarDatos(AcademicoBean academicoBean) {
		try{
			PreparedStatement stm = crearConexion().prepareStatement("UPDATE informacion_academica SET Diploma = ?, Reconocimiento = ?, Mencion = ?, Certificacion = ?, Observacion = ? WHERE Matricula  =? ");
			stm.setString(1, academicoBean.getDiploma());
			stm.setString(2, academicoBean.getReconocimiento());
			stm.setString(3, academicoBean.getMencion());
			stm.setString(4, academicoBean.getCertificacion());
			stm.setString(5, academicoBean.getObservacion());
			stm.setString(6, academicoBean.getMatricula().getMatricula());
			if (stm.executeUpdate() > 0) return 1;
		}catch (SQLException e){
			e.printStackTrace();
		}
		return 0;
	}

	public int traerFolio() {
		try{
			PreparedStatement stm = crearConexion().prepareStatement("SELECT Folio FROM reporte ORDER BY Folio DESC");
			ResultSet resultSet = stm.executeQuery();
			if(resultSet.next()){
				int folio = resultSet.getInt("Folio");
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
			PreparedStatement stm = crearConexion().prepareStatement("SELECT r.Folio, r.Fecha, r.Motivo, r.Descripcion, r.Canalizacion, r.CCT, r.MatEstudiante, e.Nombre, e.Apellido1, e.Apellido2 FROM reporte r JOIN estudiante e ON (r.MatEstudiante = e.Matricula);");
			ResultSet resultSet = stm.executeQuery();
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
		}catch (SQLException e){
			e.printStackTrace();
		}
		return controlBean;
	}

	public int insertarReporte(ReporteBean reporteBean) {
		try{
			PreparedStatement stme = crearConexion().prepareStatement("SELECT * FROM estudiante WHERE Matricula = '"+reporteBean.getMatricula().getMatricula()+"' AND Status = 1");
			ResultSet rs = stme.executeQuery();
			if(rs.next()){
				CallableStatement stm = crearConexion().prepareCall("{call Add_Reporte(?,?,?,?,?,?,?)}");//("INSERT INTO reporte VALUES(?,?,?,?,?,?,?)");
				stm.setInt(1, reporteBean.getFolio());
				stm.setString(2, reporteBean.getFecha());
				stm.setString(3, reporteBean.getMotivo());
				stm.setString(4, reporteBean.getDescripcion());
				stm.setString(5, reporteBean.getCanalizacion());
				stm.setString(6, reporteBean.getCct().getCct());
				stm.setString(7, reporteBean.getMatricula().getMatricula());
				stm.execute();
				return 1;
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
