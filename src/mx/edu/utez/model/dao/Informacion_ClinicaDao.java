package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.Informacion_ClinicaBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Informacion_ClinicaDao extends conexion {

    public static String insertarDatos(){
        Informacion_ClinicaBean clinicaBean = new Informacion_ClinicaBean();
        String matricula = clinicaBean.getMatricula();
        double peso = clinicaBean.getPeso();
        double estatura = clinicaBean.getEstatura();
        double imc = clinicaBean.getImc();
        String tipoSangre = clinicaBean.getTipoSangre();
        String numeroSeguro =clinicaBean.getNumeroSeguro();
        String unidadMedica = clinicaBean.getUnidadMedica();
        String alergias = clinicaBean.getAlergias();
        String enferCronicas = clinicaBean.getEnferCronicas();
        String enferHereditarias = clinicaBean.getEnferHereditarias();
        String discapacidades = clinicaBean.getDiscapacidades();
        String diagPsico = clinicaBean.getDiagPsico();

        //ResultSet resulSet = null;

        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement(
                    "INSERT INTO informacion_clinica VALUES('"+matricula+"', '"+peso +"', '"+estatura+"','"+imc+"','"+tipoSangre+"', " +
                            "'"+numeroSeguro+"','"+unidadMedica+"','"+alergias+"','"+enferCronicas+"', '"+enferHereditarias+"'," +
                            " '"+discapacidades+"','"+diagPsico+"')");;
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }

        return "Algo salio mal";
    }


    public static String elimiarDatos(){
        Informacion_ClinicaBean clinicaBean = new Informacion_ClinicaBean();
        String matricula =  "01234";//clinicaBean.getMatricula();

        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement("DELETE FROM informacion_clinica WHERE MatEstudiante = '"+matricula+"'");
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }


    public static String modificarDatos(){
        return "Algo salio mal";
    }

    public static String consultarDatos(){
        return "Algo salio mal";
    }


    public static void main(String[] args) {


    }


}
