package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.ControlBean;
import mx.edu.utez.utility.conexion;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ControlDao extends conexion {

	public List<ControlBean> seleccionarTodosEstudiantesActivos() {
		List<ControlBean> controlBean = new ArrayList<>();
		try {
			CallableStatement pst = crearConexion().prepareCall("{call Select_Estudiante_Activo()}");
			pst.execute();
			ResultSet rs = pst.getResultSet();
			while (rs.next()) {
				String matricula = rs.getString("Matricula");
				String nombre = rs.getString("Nombre");
				String apellido1 = rs.getString("Apellido1");
				String apellido2 = rs.getString("Apellido2");
				controlBean.add(new ControlBean(matricula, nombre, apellido1, apellido2));
			}
			pst.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return controlBean;
	}

	public List<ControlBean> seleccionarTodosEstudiantesDesactivos() {
		List<ControlBean> controlBean = new ArrayList<>();
		try {
			CallableStatement pst = crearConexion().prepareCall("{call Select_Estudiante_Inactivo()}");
			pst.execute();
			ResultSet rs = pst.getResultSet();
			while (rs.next()) {
				String matricula = rs.getString("Matricula");
				String nombre = rs.getString("Nombre");
				String apellido1 = rs.getString("Apellido1");
				String apellido2 = rs.getString("Apellido2");
				controlBean.add(new ControlBean(matricula, nombre, apellido1, apellido2));
			}
			pst.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return controlBean;
	}

	public void statusEstudiante(String matricula) {
		try {
			CallableStatement pst = crearConexion().prepareCall("{call Reactive_Estudiante(?)}");
			pst.setString(1, matricula);
			pst.execute();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

