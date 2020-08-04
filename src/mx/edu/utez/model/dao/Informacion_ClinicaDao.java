package mx.edu.utez.model.dao;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.ClinicaBean;
import mx.edu.utez.utility.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Informacion_ClinicaDao extends conexion {


	public int insertarDatos(ClinicaBean clinicaBean) {
		try {
			PreparedStatement stm = crearConexion().prepareStatement("SELECT * FROM estudiante WHERE Matricula = '"+clinicaBean.getMatricula().getMatricula()+"' AND Status = 1");
			ResultSet rs = stm.executeQuery();
			if(rs.next()) {
				double peso = Double.parseDouble(clinicaBean.getPeso());
				double estatura = Double.parseDouble(clinicaBean.getEstatura());
				double imc = peso / (estatura * estatura);
				PreparedStatement statment = crearConexion().prepareStatement("INSERT INTO informacion_clinica VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
				statment.setString(1, clinicaBean.getMatricula().getMatricula());
				statment.setDouble(2, peso);
				statment.setDouble(3, estatura);
				statment.setDouble(4, imc);
				statment.setString(5, clinicaBean.getTipoSangre());
				statment.setString(6, clinicaBean.getNumeroSeguro());
				statment.setString(7, clinicaBean.getUnidadMedica());
				statment.setString(8, clinicaBean.getAlergias());
				statment.setString(9, clinicaBean.getEnferCronicas());
				statment.setString(10, clinicaBean.getEnferHereditarias());
				statment.setString(11, clinicaBean.getDiscapacidades());
				statment.setString(12, clinicaBean.getDiagPsico());
				if (statment.executeUpdate() > 0) return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int elimiarDatos(String matricula) {
		try {
			PreparedStatement statment = crearConexion().prepareStatement("DELETE FROM informacion_clinica WHERE MatEstudiante = ?");
			statment.setString(1, matricula);
			if (statment.executeUpdate()>0) return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int modificarDatos(ClinicaBean clinicaBean) {
		try {
			double peso = Double.parseDouble(clinicaBean.getPeso());
			double estatura = Double.parseDouble(clinicaBean.getEstatura());
			double imc = peso / (estatura * estatura);
			PreparedStatement statement = crearConexion().prepareStatement("UPDATE informacion_clinica SET Peso = ?, Estatura = ?, Imc = ?, TipoSangre = ?, NumeroSeguro = ?, UnidadMedica = ?, Alergias = ?, EnferCronicas = ?, EnferHereditarias = ?, Discapacidades = ?, DiagPsico = ? WHERE MatEstudiante = ? ");
			statement.setDouble(1,peso);
			statement.setDouble(2,estatura);
			statement.setDouble(3,imc);
			statement.setString(4,clinicaBean.getTipoSangre());
			statement.setString(5,clinicaBean.getNumeroSeguro());
			statement.setString(6,clinicaBean.getUnidadMedica());
			statement.setString(7,clinicaBean.getAlergias());
			statement.setString(8,clinicaBean.getEnferCronicas());
			statement.setString(9,clinicaBean.getEnferHereditarias());
			statement.setString(10,clinicaBean.getDiscapacidades());
			statement.setString(11,clinicaBean.getDiagPsico());
			statement.setString(12,clinicaBean.getMatricula().getMatricula());
			if(statement.executeUpdate()>0)
				return 1;
		}catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	public List<ClinicaBean> consultarDatos(String matricula) {
		try {
			List<ClinicaBean> listDatosClinica = new ArrayList<>();
			PreparedStatement statement = null;
			ResultSet resultSet = null;
			statement = crearConexion().prepareStatement("SELECT Peso, Estatura, Imc, TipoSangre, NumeroSeguro, UnidadMedica, Alergias, EnferCronicas, EnferHereditarias, Discapacidades, DiagPsico FROM informacion_clinica WHERE MatEstudiante = '" + matricula + "'");
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

				listDatosClinica.add(new ClinicaBean(new EstudianteBean(matricula), peso, estatura, imc, tipoSangre, numeroSeguro, unidadMedica, tipoAlegia, alergia,tipoCronica, cronica, tipoHeredi, hereditaria, tipoDiscapa, discapacidad, diagPsico));
				return listDatosClinica;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
