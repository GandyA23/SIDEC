package mx.edu.utez.model.dao;

import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao extends conexion {
    public String insertarDatos(UsuarioBean uBean){
        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement(
                    "INSERT INTO Usuario VALUES('"+uBean.getCct()+"', '"+uBean.getPassword() +"', '"+uBean.getCorreo()+"','"+uBean.getNombre()+"','"+uBean.getApellido1()+"', " +
                            "'"+uBean.getApellido2()+"','"+uBean.getRol()+"')");;
            resul = statment.executeUpdate();
            if(resul==1)
                return "Todo bien";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal";
    }

    public void elimiarDatos(String cct){
        try{
            System.out.println(cct);
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement("DELETE FROM usuario WHERE CCT = '"+cct+"'");
            resul = statment.executeUpdate();
            if(resul==1)
                System.out.println("eliminado");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public String modificarDatos(){
        UsuarioBean usuarioBean = new UsuarioBean();

        return "Algo salio mal";
    }

    public List<UsuarioBean> consultarDatos(String cct){
        List<UsuarioBean> usuariosList = new ArrayList<>();

        ResultSet resultSet = null;
        PreparedStatement statment = null;
        try{
            statment = crearConexion().prepareStatement("SELECT * FROM Usuario WHERE CCT = '"+cct+"'");
            resultSet= statment.executeQuery();
            if(resultSet.next()){
                String password = resultSet.getString("Password");
                String correo = resultSet.getString("Correo");
                String nombre = resultSet.getString("Nombre");
                String apellido1 = resultSet.getString("Apellido1");
                String apellido2 = resultSet.getString("Apellido2");
                String rol = resultSet.getString("Rol");
                usuariosList.add(new UsuarioBean(cct,password, correo, nombre, apellido1,apellido2,rol));


                return usuariosList;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public String actualizarDatos(String cct, String password, String correo, String nombre, String apellido1, String apellido2, String rol){
        try{
            int resul;
            PreparedStatement statment = null;
            statment = crearConexion().prepareStatement(
                    "UPDATE usuario SET Password = '"+ password+"', Correo='"+correo+"', Nombre= '"+nombre+"', Apellido1='"+apellido1+"', Apellido2 = '"+apellido2+"', Rol = '"+rol+"' WHERE CCT = '"+cct+"'");
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
