package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.Informacion_ClinicaBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Informacion_ClinicaDao extends conexion {

	public void insertarDatos(Informacion_ClinicaBean clinicaBean) {
		String matricula = clinicaBean.getMatricula();
		double peso = Double.parseDouble(clinicaBean.getPeso());
		double estatura = Double.parseDouble(clinicaBean.getEstatura());
		double imc = peso / (estatura * estatura);
		String tipoSangre = clinicaBean.getTipoSangre();
		String numeroSeguro = clinicaBean.getNumeroSeguro();
		String unidadMedica = clinicaBean.getUnidadMedica();
		String alergias = clinicaBean.getAlergias();
		String enferCronicas = clinicaBean.getEnferCronicas();
		String enferHereditarias = clinicaBean.getEnferHereditarias();
		String discapacidades = clinicaBean.getDiscapacidades();
		String diagPsico = clinicaBean.getDiagPsico();
		//ResultSet resulSet = null;
		try {
			int resul;
			PreparedStatement statment = crearConexion().prepareStatement(
					"INSERT INTO informacion_clinica VALUES('" + matricula + "', '" + peso + "', '" + estatura + "','" + imc + "','" + tipoSangre + "', " +
							"'" + numeroSeguro + "','" + unidadMedica + "','" + alergias + "','" + enferCronicas + "', '" + enferHereditarias + "'," +
							" '" + discapacidades + "','" + diagPsico + "')");
			resul = statment.executeUpdate();
			if (resul == 1)
				System.out.println("Se inserto");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

/*
      public String elimiarDatos(){
        Informacion_ClinicaBean clinicaBean = new Informacion_ClinicaBean();
        String matricula = clinicaBean.getMatricula();
        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement("DELETE FROM informacion_clinica WHERE MatEstudiante = '"+matricula+"'");
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todobien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }

    public String modificarDatos(){
        return "Algo salio mal";
    }
*/


	public List<Informacion_ClinicaBean> consultarDatos(String matricula) {
		List<Informacion_ClinicaBean> listDatosClinica = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = crearConexion().prepareStatement("SELECT * FROM informacion_clinica WHERE MatEstudiante = '" + matricula + "'");
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				String peso = resultSet.getString("Peso").toString();
				String estatura = resultSet.getString("Estatura").toString();
				String imc =resultSet.getString("Imc").toString();
				String tipoSangre = resultSet.getString("TipoSangre");
				String numeroSeguro = resultSet.getString("NumeroSeguro");
				String unidadMedica =resultSet.getString("UnidadMedica");
				String alergias = resultSet.getString("Alergias");
				String enferCronicas =resultSet.getString("EnferCronicas");
				String enferHereditarias =resultSet.getString("EnferHereditarias");
				String discapacidades =resultSet.getString("Discapacidades");
				String diagPsico =resultSet.getString("DiagPsico");

				listDatosClinica.add(new Informacion_ClinicaBean(matricula, peso, estatura,imc, tipoSangre,numeroSeguro,unidadMedica,alergias, enferCronicas, enferHereditarias, discapacidades, diagPsico));
				return listDatosClinica;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}


}
