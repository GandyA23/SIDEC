package mx.edu.utez.model.dao;
import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.utility.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Informacion_PersonalDao extends conexion {
    String matriculaGlobal;
    public static String insertarDatos(EstudianteBean alumno, TutorBean tutor, DomicilioBean domicilio){

        try{

            String idTutor=null;
            int estado;

            PreparedStatement sentencia1 = null;
            PreparedStatement sentencia2 = null;
            PreparedStatement sentencia3 = null;
            PreparedStatement sentencia4 = null;

            sentencia1 = crearConexion().prepareStatement(
                    "INSERT INTO estudiante values('"+alumno.getMatricula()+"','"+alumno.getCurp()+"','"+alumno.getNombre()+"','"+alumno.getApellido1()+"','"+alumno.getApellido2()+"','"+alumno.getFechaNacimiento()+"','"+alumno.getTelefono()+"','"+alumno.getCorreo()+"','"+alumno.getGenero()+"','"+alumno.getCicloEscolar()+"','"+alumno.getNivelActual()+"','"+alumno.getStatus()+"');"
            );


            estado = sentencia1.executeUpdate();
            if(estado==1){
                System.out.println("Se ejecuto el Alumno");
            }

            sentencia2 = crearConexion().prepareStatement(
                    "INSERT INTO tutor values(null,'"+tutor.getNombre()+"','"+tutor.getApellido1()+"','"+tutor.getApellido2()+"','"+tutor.getTelefonoPersonal()+"','"+tutor.getTelefonoTrabajo()+"','"+tutor.getCorreo()+"','"+tutor.getGenero()+"')"
            );
            estado = sentencia2.executeUpdate();
            if(estado==1){
                System.out.println("Se ejecuto el tutor");
            }


            ResultSet consulta;
            sentencia3 = crearConexion().prepareStatement("SELECT Id from tutor WHERE Nombre = '"+tutor.getNombre()+"' AND Apellido1 ='"+tutor.getApellido1()+"' AND Apellido2 ='"+tutor.getApellido2()+"'");
            consulta = sentencia3.executeQuery();
            if(consulta.next()){
                idTutor=consulta.getString("Id");
                System.out.println(idTutor);
            }

            sentencia4 = crearConexion().prepareStatement(
                    "INSERT  INTO domicilio values('"+domicilio.getMatriculaEstudiante()+"', '"+idTutor+"'  ,'"+domicilio.getCalle()+"','"+domicilio.getNoExterior()+"','"+domicilio.getNoInterior()+"','"+domicilio.getColonia()+"','"+domicilio.getMunicipio()+"','"+domicilio.getCodigoPostal()+"')"
            );
            estado = sentencia4.executeUpdate();
            if(estado==1){
                System.out.println("Se ejecuto docimilio");
            }
            return "Operaciones exitosas";
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

    public List<EstudianteBean> datosEstudiante(String matricula){
        List<EstudianteBean> alumno = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement sentencia = null;
        try{
            sentencia = crearConexion().prepareStatement("SELECT * FROM estudiante WHERE Matricula = '"+matricula+"'");
            resultSet= sentencia.executeQuery();
            if(resultSet.next()){
                alumno.add(new EstudianteBean(resultSet.getString("Matricula"),resultSet.getString("Curp"),resultSet.getString("Nombre"), resultSet.getString("Apellido1"), resultSet.getString("Apellido2"),java.sql.Date.valueOf(resultSet.getString("FechaNacimiento")),resultSet.getString("Telefono"),resultSet.getString("Correo"),resultSet.getString("Genero"),resultSet.getString("CicloEscolar"),resultSet.getString("NivelActual"),Integer.parseInt(resultSet.getString("Status"))));
                return alumno;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public List<TutorBean> datosTutor(String nombre, String apellido1, String apellido2){
        List<TutorBean> tutor = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement sentencia = null;
        try{
            sentencia = crearConexion().prepareStatement("SELECT * FROM tutor WHERE Nombre = '"+nombre+"' AND  Apellido1 = '"+apellido1+"' AND Apellido2 = '"+apellido2+"'");
            resultSet= sentencia.executeQuery();
            if(resultSet.next()){
                tutor.add(new TutorBean(resultSet.getString("Nombre"),resultSet.getString("Apellido1"),resultSet.getString("Apellido2"),resultSet.getString("TelefonoPersonal"),resultSet.getString("TelefonoTrabajo"),resultSet.getString("Correo"),resultSet.getString("Genero")));
                return tutor;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public List<DomicilioBean> datosDomicilio(String matricula){
        List<DomicilioBean> domicilio = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement sentencia = null;
        try{
            sentencia = crearConexion().prepareStatement("SELECT * FROM domicilio WHERE Matricula = '"+matricula+"'");
            resultSet= sentencia.executeQuery();
            if(resultSet.next()){
                domicilio.add(new DomicilioBean(resultSet.getString("MatEstudiante"),resultSet.getString("Calle"),resultSet.getString("NoExterior"),resultSet.getString("NoInterior"),resultSet.getString("Colonia"),resultSet.getString("Municipio"),resultSet.getString("CodigoPostal")));
                return domicilio;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public static String modificarDatos(String matricula, String nombre, String apellido1, String apellido2, String genero1, String dia, String mes, String año, String telefono, String correo, String añoInicio, String añoFin, String seleccion, String calle,String interior, String exterior, String codigoPostal, String colonia, String municipio, String tutorNombre, String tutorApellido1,String tutorApellido2, String genero2, String tutorCorreo, String tutorTelefono,String tutorTelTrabajo ){
        return "1";
    }
}
