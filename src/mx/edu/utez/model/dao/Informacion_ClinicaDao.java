package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.Informacion_ClinicaBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Informacion_ClinicaDao extends conexion {

	public int insertarDatos(Informacion_ClinicaBean clinicaBean) {
		double peso = Double.parseDouble(clinicaBean.getPeso());
		double estatura = Double.parseDouble(clinicaBean.getEstatura());
		double imc = peso / (estatura * estatura);
		//ResultSet resulSet = null;
		try {
			int resul;
			PreparedStatement statment = crearConexion().prepareStatement(
					"INSERT INTO informacion_clinica VALUES('" + clinicaBean.getMatricula() + "', '" + peso + "', '" + estatura + "','" + imc + "','" +
							clinicaBean.getTipoSangre() + "', " + "'" + clinicaBean.getNumeroSeguro() + "','" + clinicaBean.getUnidadMedica() + "','" +
							clinicaBean.getAlergias() + "','" + clinicaBean.getEnferCronicas() + "', '" + clinicaBean.getEnferHereditarias() + "'," +
							" '" + clinicaBean.getDiscapacidades() + "','" + clinicaBean.getDiagPsico() + "')");
			resul = statment.executeUpdate();
			if (resul == 1)
				return resul;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int elimiarDatos(String matricula) {
		try {
			int resul;
			PreparedStatement statment = null;
			statment = crearConexion().prepareStatement("DELETE FROM informacion_clinica WHERE MatEstudiante = '" + matricula + "'");
			resul = statment.executeUpdate();
			if (resul == 1)
				return resul;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String modificarDatos() {
		return "Algo salio mal";
	}

	public List<Informacion_ClinicaBean> consultarDatos(String matricula) {
		List<Informacion_ClinicaBean> listDatosClinica = new ArrayList<>();
		try {
			PreparedStatement statement = null;
			ResultSet resultSet = null;
			statement = crearConexion().prepareStatement("SELECT * FROM informacion_clinica WHERE MatEstudiante = '" + matricula + "'");
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				String peso = resultSet.getString("Peso").toString();
				String estatura = resultSet.getString("Estatura").toString();
				String imc = resultSet.getString("Imc").toString();
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
				listDatosClinica.add(new Informacion_ClinicaBean(matricula, peso, estatura, imc, tipoSangre, numeroSeguro, unidadMedica, tipoAlegia,
						alergia,tipoCronica, cronica, tipoHeredi, hereditaria, tipoDiscapa, discapacidad, diagPsico));
				return listDatosClinica;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


}
