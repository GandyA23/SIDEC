package mx.edu.utez.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    public static Connection crearConexion(){
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/sidec";
        String user = "root";
        String pass = "";
        try{
            try {
                Class.forName("com.mysql.jdbc.Driver");
            }catch (Exception e){
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url,user,pass);
            System.out.println("Conexión establecida con "+ con);

        }catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
}