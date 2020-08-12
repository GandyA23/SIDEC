package mx.edu.utez.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    public static Connection crearConexion() throws SQLException {
        Connection con;
        String driver = "com.mysql.jdbc.Driver";

        /*String url = "jdbc:mysql://192.168.0.1/sidec?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "hector";
        String pass = "B3b0te123!";
        */
        String url = "jdbc:mysql://localhost/sidec?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "root";
        String pass = "admin";
        System.setProperty(driver,"");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        }catch (Exception e){
            System.out.println(e);
        }
        con = DriverManager.getConnection(url,user,pass);
        return  con;

    }



}