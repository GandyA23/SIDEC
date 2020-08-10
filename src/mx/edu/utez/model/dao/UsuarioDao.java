package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao extends conexion {

	public int insertarDatos(UsuarioBean uBean) {
		try {
			boolean resul;
			CallableStatement statment = crearConexion().prepareCall("{call Add_Usuario(?,?,?,?,?,?,?)}");
			statment.setString(1,uBean.getCct());
			statment.setString(2,uBean.getPassword());
			statment.setString(3,uBean.getCorreo());
			statment.setString(4,uBean.getNombre());
			statment.setString(5,uBean.getApellido1());
			statment.setString(6,uBean.getApellido2());
			statment.setString(7,uBean.getRol());
			resul = statment.execute();
			statment.close();
			if (!resul) return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int elimiarDatos(String cct) {
		try {
			boolean resul;
			CallableStatement statment = crearConexion().prepareCall("{call Delete_Usuario(?)}");
			statment.setString(1,cct);
			resul = statment.execute();
			statment.close();
			if (!resul) return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<UsuarioBean> consultarDatos(String cct) {
		try {
			List<UsuarioBean> usuariosList = new ArrayList<>();
			CallableStatement statment = crearConexion().prepareCall("{call Select_Usuario(?)}");
			statment.setString(1, cct);
			statment.execute();
			ResultSet resultSet = statment.getResultSet();
			if (resultSet.next()) {
				String password = resultSet.getString("Password");
				String correo = resultSet.getString("Correo");
				String nombre = resultSet.getString("Nombre");
				String apellido1 = resultSet.getString("Apellido1");
				String apellido2 = resultSet.getString("Apellido2");
				String rol = resultSet.getString("Rol");
				usuariosList.add(new UsuarioBean(cct, password, correo, nombre, apellido1, apellido2, rol));
				statment.close();
				resultSet.close();
				return usuariosList;
			}else{
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int actualizarDatos(UsuarioBean uBean) {
		try {
			boolean resul = false;
			CallableStatement statment = crearConexion().prepareCall("{call Update_Usuario(?,?,?,?,?,?,?)}");
			statment.setString(1,uBean.getPassword());
			statment.setString(2,uBean.getCorreo());
			statment.setString(3,uBean.getNombre());
			statment.setString(4,uBean.getApellido1());
			statment.setString(5,uBean.getApellido2());
			statment.setString(6,uBean.getRol());
			statment.setString(7,uBean.getCct());
			resul = statment.execute();
			if(!resul) return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
