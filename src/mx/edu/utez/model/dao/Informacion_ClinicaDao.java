package mx.edu.utez.model.dao;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.ClinicaBean;
import mx.edu.utez.utility.conexion;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Informacion_ClinicaDao extends conexion {

	public int insertarDatos(ClinicaBean clinicaBean) {
		try {
			CallableStatement statement = crearConexion().prepareCall("{call Verificar_Estudiante(?)}");
			statement.setString(1,clinicaBean.getMatricula().getMatricula());
			statement.execute();
			ResultSet rs = statement.getResultSet();
			if(rs.next()) {
				double peso = Double.parseDouble(clinicaBean.getPeso());
				double estatura = Double.parseDouble(clinicaBean.getEstatura());
				CallableStatement statment = crearConexion().prepareCall("{call Add_Informacion_Clinica(?,?,?,?,?,?,?,?,?,?,?)}");
				statment.setString(1, clinicaBean.getMatricula().getMatricula());
				statment.setDouble(2, peso);
				statment.setDouble(3, estatura);
				statment.setString(4, clinicaBean.getTipoSangre());
				statment.setString(5, clinicaBean.getNumeroSeguro());
				statment.setString(6, clinicaBean.getUnidadMedica());
				statment.setString(7, clinicaBean.getAlergias());
				statment.setString(8, clinicaBean.getEnferCronicas());
				statment.setString(9, clinicaBean.getEnferHereditarias());
				statment.setString(10, clinicaBean.getDiscapacidades());
				statment.setString(11, clinicaBean.getDiagPsico());
				statment.execute();
			}
			statement.close();
			rs.close();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int elimiarDatos(String matricula) {
		try {
			CallableStatement statment = crearConexion().prepareCall("{call Delete_Informacion_Clinica(?)}");
			statment.setString(1, matricula);
			boolean resul = statment.execute();
			if (!resul) return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int modificarDatos(ClinicaBean clinicaBean) {
		try {
			CallableStatement statement = crearConexion().prepareCall("{call Update_Informacion_Clinica(?,?,?,?,?,?,?,?,?,?,?)}");
			statement.setDouble(1,Double.parseDouble(clinicaBean.getPeso()));
			statement.setDouble(2,Double.parseDouble(clinicaBean.getEstatura()));
			statement.setString(3,clinicaBean.getTipoSangre());
			statement.setString(4,clinicaBean.getNumeroSeguro());
			statement.setString(5,clinicaBean.getUnidadMedica());
			statement.setString(6,clinicaBean.getAlergias());
			statement.setString(7,clinicaBean.getEnferCronicas());
			statement.setString(8,clinicaBean.getEnferHereditarias());
			statement.setString(9,clinicaBean.getDiscapacidades());
			statement.setString(10,clinicaBean.getDiagPsico());
			statement.setString(11,clinicaBean.getMatricula().getMatricula());
			boolean resul = statement.execute();
			System.out.println(resul);
			if(!resul) {
				return 1;
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	public List<ClinicaBean> consultarDatos(String matricula) {
		try {
			List<ClinicaBean> listDatosClinica = new ArrayList<>();
			PreparedStatement statement = crearConexion().prepareStatement("{call Select_Informacion_Clinica(?)}");
			statement.setString(1,matricula);
			statement.execute();
			ResultSet resultSet = statement.getResultSet();
			if (resultSet.next()) {
				String peso = resultSet.getString("Peso");
				String estatura = resultSet.getString("Estatura");
				String imc = resultSet.getString("Imc");
				String tipoSangre = resultSet.getString("TipoSangre");
				String numeroSeguro = resultSet.getString("NumeroSeguro");
				String unidadMedica = resultSet.getString("UnidadMedica");
				String alergiasResul = resultSet.getString("Alergias");
				String tipoAlegia, alergia;
				if (alergiasResul.contains(":")) {
					String[] parts = alergiasResul.split(":");
					tipoAlegia = parts[0];
					alergia = parts[1];
				} else {
					tipoAlegia = "Seleccione";
					alergia = alergiasResul;
				}

				String enferCronicasResul = resultSet.getString("EnferCronicas");
				String tipoCronica, cronica;
				if (enferCronicasResul.contains(":")) {
					String[] parts = enferCronicasResul.split(":");
					tipoCronica = parts[0];
					cronica = parts[1];
				} else {
					tipoCronica = "Seleccione";
					cronica = enferCronicasResul;
				}

				String enferHereditariasResul = resultSet.getString("EnferHereditarias");
				String tipoHeredi, hereditaria;
				if (enferHereditariasResul.contains(":")) {
					String[] parts = enferHereditariasResul.split(":");
					tipoHeredi = parts[0];
					hereditaria = parts[1];
				} else {
					tipoHeredi = "Seleccione";
					hereditaria = enferHereditariasResul;
				}

				String discapacidadesResul = resultSet.getString("Discapacidades");
				String tipoDiscapa, discapacidad;
				if (discapacidadesResul.contains(":")) {
					String[] parts = discapacidadesResul.split(":");
					tipoDiscapa = parts[0];
					discapacidad = parts[1];
				} else {
					tipoDiscapa = "Seleccione";
					discapacidad = discapacidadesResul;
				}

				String diagPsico = resultSet.getString("DiagPsico");
				listDatosClinica.add(new ClinicaBean(new EstudianteBean(matricula), peso, estatura, imc, tipoSangre, numeroSeguro, unidadMedica, tipoAlegia, alergia,tipoCronica, cronica, tipoHeredi, hereditaria, tipoDiscapa, discapacidad, diagPsico));
				statement.close();
				resultSet.close();
				return listDatosClinica;
			}else{
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
