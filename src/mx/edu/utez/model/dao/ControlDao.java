package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.ControlBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ControlDao extends conexion {

	public List<ControlBean> seleccionarTodosEstudiantesActivos() {
		List<ControlBean> controlBean = new ArrayList<>();
		try {
			PreparedStatement pst = crearConexion().prepareStatement("SELECT Matricula, Nombre, Apellido1, Apellido2 FROM estudiante WHERE Status = 1");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

				String matricula = rs.getString("Matricula");
				String nombre = rs.getString("Nombre");
				String apellido1 = rs.getString("Apellido1");
				String apellido2 = rs.getString("Apellido2");
				controlBean.add(new ControlBean(matricula, nombre, apellido1, apellido2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return controlBean;
	}

	public List<ControlBean> seleccionarTodosEstudiantesDesactivos() {
		List<ControlBean> controlBean = new ArrayList<>();
		try {
			PreparedStatement pst = crearConexion().prepareStatement("SELECT Matricula, Nombre, Apellido1, Apellido2 FROM estudiante WHERE Status = 0");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String matricula = rs.getString("Matricula");
				String nombre = rs.getString("Nombre");
				String apellido1 = rs.getString("Apellido1");
				String apellido2 = rs.getString("Apellido2");
				controlBean.add(new ControlBean(matricula, nombre, apellido1, apellido2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return controlBean;
	}

	public void statusEstudiante(String matricula) {
		try {
			PreparedStatement pst = crearConexion().prepareStatement("UPDATE estudiante SET Status = 1 WHERE Matricula = '"+matricula+"'");
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

