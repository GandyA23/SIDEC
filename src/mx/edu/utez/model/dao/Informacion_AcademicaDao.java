package mx.edu.utez.model.dao;

import com.sun.java.browser.plugin2.liveconnect.v1.Result;
import mx.edu.utez.controller.AcademicoServlet;
import mx.edu.utez.model.bean.AcademicoBean;
import mx.edu.utez.model.bean.ClinicaBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.utility.conexion;

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
				PreparedStatement stm = crearConexion().prepareStatement("INSERT INTO informacion_academica VALUES(?,?,?,?,?,?)");
				stm.setString(1, academicoBean.getMatricula().getMatricula());
				stm.setString(2, academicoBean.getDiploma());
				stm.setString(3, academicoBean.getReconocimiento());
				stm.setString(4, academicoBean.getMencion());
				stm.setString(5, academicoBean.getCertificacion());
				stm.setString(6, academicoBean.getObservacion());
				if (stm.executeUpdate() > 0) return 1;
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
}
