package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.LoginBean;
import mx.edu.utez.utility.conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDao extends conexion {

    public String validarRol(LoginBean logben) {

        String CCT = logben.getCct();
        String PASS = logben.getPassword();
        String query = null ;

        String rolBD = null;


        PreparedStatement statment = null;
        ResultSet resulSet = null;

        try {
            query = "SELECT Rol FROM USUARIO WHERE CCT = " + CCT + "AND Password = AES_DECRYPT(" + PASS + ", " + conexion.contraEncript() + ")";
            statment = crearConexion().prepareStatement(query); //CONSULTAR
            resulSet = statment.executeQuery();

            if (resulSet.next()){

                rolBD = resulSet.getString("Rol");

                if(rolBD.equals("Administrador")){
                    return rolBD;
                }else if(rolBD.equals("Director")){
                    return rolBD;
                }else if(rolBD.equals("Docente")){
                    return rolBD;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo Salio Mal :c";
    }
}
