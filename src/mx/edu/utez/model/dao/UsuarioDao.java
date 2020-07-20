package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDao extends conexion {
    public static String insertarDatos(){
        UsuarioBean usuarioBean = new UsuarioBean();
        String cct = usuarioBean.getCct();
        String password = usuarioBean.getPassword();
        String correo = usuarioBean.getCorreo();
        String nombre =usuarioBean.getNombre();
        String apellido1 = usuarioBean.getApellido1();
        String apellido2 = usuarioBean.getApellido2();
        String rol = usuarioBean.getRol();

        //ResultSet resulSet = null;

        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement(
                    "INSERT INTO Usuario VALUES('"+cct+"', '"+password +"', '"+correo+"','"+nombre+"','"+apellido1+"', " +
                            "'"+apellido2+"','"+rol+"')");;
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }

    public static String elimiarDatos( String cct){
        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement("DELETE FROM Usuario WHERE CCT = '"+cct+"'");
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }
    public static String modificarDatos(){
        UsuarioBean usuarioBean = new UsuarioBean();

        return "Algo salio mal";
    }

    public static String consultarDatos(String cct){
        ;
        String password = null;
        String correo = null;
        String nombre = null;
        String apellido1 = null;
        String apellido2 = null;
        String rol = null;
        ResultSet resultSet = null;
        PreparedStatement statment = null;
        try{
            statment = crearConexion().prepareStatement("SELECT * FROM Usuario WHERE CCT = '"+cct+"'");
            resultSet= statment.executeQuery();
            if(resultSet.next()){
                password = resultSet.getString("Password");
                correo = resultSet.getString("Correo");
                nombre = resultSet.getString("Nombre");
                apellido1 = resultSet.getString("Apellido1");
                apellido2 = resultSet.getString("Apellido2");
                rol = resultSet.getString("Rol");

                return "Todo bien";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }

    public static String actualizarDatos(String cct, String password, String correo, String nombre, String apellido1, String apellido2, String rol){
        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement(
                    "UPDATE Usuario SET ");
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }
    public static void main(String[] args) {


    }

}
