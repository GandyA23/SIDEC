package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.LoginBean;
import mx.edu.utez.utility.conexion;

import java.sql.*;

public class LoginDao extends conexion {

    public LoginBean validarRol(LoginBean logben) {
        String CCT = logben.getCct();
        String PASS = logben.getPassword();
        CallableStatement statment = null;
        ResultSet resulSet = null;
        try{
            statment = crearConexion().prepareCall("{call Verificar_Usuario(?,?)}");
            statment.setString(1,CCT);
            statment.setString(2,PASS);
            statment.execute();
            resulSet = statment.getResultSet();
            if (resulSet.next()){
                logben.setCct(resulSet.getString("CCT"));
                logben.setPassword(resulSet.getString("Password"));
                logben.setRol(resulSet.getString("Rol"));
                System.out.println(logben.getRol());
                statment.close();
                resulSet.close();
                if(CCT.equals(logben.getCct()) && PASS.equals(logben.getPassword())){
                    return logben;
                }else{
                    return null;
                }
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
