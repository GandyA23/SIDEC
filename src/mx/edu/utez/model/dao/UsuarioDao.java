package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao extends conexion {

	public int insertarDatos(UsuarioBean uBean) {
		try {
			int resul;
			PreparedStatement statment = null;
			statment = crearConexion().prepareStatement("INSERT INTO Usuario VALUES(?,?,?,?,?,?,?)");
			statment.setString(1,uBean.getCct());
			statment.setString(2,uBean.getPassword());
			statment.setString(3,uBean.getCorreo());
			statment.setString(4,uBean.getNombre());
			statment.setString(5,uBean.getApellido1());
			statment.setString(6,uBean.getApellido2());
			statment.setString(7,uBean.getRol());
			resul = statment.executeUpdate();
			if (resul == 1)
				return resul;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int elimiarDatos(String cct) {
		try {
			int resul;
			PreparedStatement statment = null;
			statment = crearConexion().prepareStatement("DELETE FROM usuario WHERE CCT = ?");
			statment.setString(1,cct);
			resul = statment.executeUpdate();
			if (resul == 1)
				return resul;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<UsuarioBean> consultarDatos(String cct) {
		try {
			List<UsuarioBean> usuariosList = new ArrayList<>();
			ResultSet resultSet = null;
			PreparedStatement statment = null;
			statment = crearConexion().prepareStatement("SELECT * FROM Usuario WHERE CCT = '" + cct + "'");
			resultSet = statment.executeQuery();
			if (resultSet.next()) {
				String password = resultSet.getString("Password");
				String correo = resultSet.getString("Correo");
				String nombre = resultSet.getString("Nombre");
				String apellido1 = resultSet.getString("Apellido1");
				String apellido2 = resultSet.getString("Apellido2");
				String rol = resultSet.getString("Rol");
				usuariosList.add(new UsuarioBean(cct, password, correo, nombre, apellido1, apellido2, rol));
				return usuariosList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void actualizarDatos(UsuarioBean uBean) {
		try {
			PreparedStatement statment = null;
			statment = crearConexion().prepareStatement("UPDATE usuario SET Password = ?, Correo = ?, Nombre = ?, Apellido1 = ?, Apellido2 = ?, Rol = ? WHERE CCT = ?");
			statment.setString(1,uBean.getPassword());
			statment.setString(2,uBean.getCorreo());
			statment.setString(3,uBean.getNombre());
			statment.setString(4,uBean.getApellido1());
			statment.setString(5,uBean.getApellido2());
			statment.setString(6,uBean.getRol());
			statment.setString(7,uBean.getCct());
			statment.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
