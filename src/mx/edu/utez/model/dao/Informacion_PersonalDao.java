package mx.edu.utez.model.dao;
import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.utility.conexion;
import java.sql.PreparedStatement;

public class Informacion_PersonalDao extends conexion {

    public static String insertarDatos(EstudianteBean alumno, TutorBean tutor, DomicilioBean domicilio){
        try{
            int estado;
            PreparedStatement sentencia = null;
            sentencia = crearConexion().prepareStatement(
                    ""
            );
            estado = sentencia.executeUpdate();
            if(estado==1){
                return "Insertado exitoso";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "Algo salio mal :(";
    }

    public void eliminarDatos(String matricula){
        try{
            int estado;
            PreparedStatement sentencia = null;
            sentencia = crearConexion().prepareStatement(
                    ""
            );
            estado = sentencia.executeUpdate();
            if(estado==1){
                System.out.printf("Eliminado Exitoso");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String consultarDatos(){
        return "1";
    }
    public static String modificarDatos(){
        return "1";
    }
}
