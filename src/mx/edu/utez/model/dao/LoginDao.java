package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.LoginBean;
import mx.edu.utez.utility.conexion;

import java.sql.*;

public class LoginDao extends conexion {

    public LoginBean validarRol(LoginBean logben) {
        String CCT = logben.getCct();
        String PASS = logben.getPassword();
        PreparedStatement statment = null;
        ResultSet resulSet = null;
        try{
            statment = crearConexion().prepareStatement("SELECT CCT, Password, Rol FROM usuario WHERE CCT = '"+CCT+"' AND Password = '"+PASS+"'");
            resulSet = statment.executeQuery();
            if (resulSet.next()){
                logben.setCct(resulSet.getString("CCT"));
                logben.setPassword(resulSet.getString("Password"));
                logben.setRol(resulSet.getString("Rol"));
                return logben;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }


    public void cerrarConexion() throws SQLException {
        crearConexion().close();
        System.out.println("Se cerro la Conexion a la BD");
    }
}
