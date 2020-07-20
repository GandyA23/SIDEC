package mx.edu.utez.controller;

import mx.edu.utez.model.bean.UsuarioBean;
import mx.edu.utez.model.dao.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String cct;
        String password;
        String correo;
        String nombre;
        String apellido1;
        String apellido2;
        String rol;
        switch (accion){
            case "add":
                UsuarioBean usuBean = new UsuarioBean();
                UsuarioDao usuDao = new UsuarioDao();
                cct = request.getParameter("cct");;
                password = request.getParameter("password");
                correo = request.getParameter("correo");
                nombre = request.getParameter("nombre");
                apellido1 = request.getParameter("apellido1");
                apellido2= request.getParameter("apellido2");
                rol = request.getParameter("rol");

                usuBean.setCct(cct);
                usuBean.setPassword(password);
                usuBean.setCorreo(correo);
                usuBean.setNombre(nombre);
                usuBean.setApellido1(apellido1);
                usuBean.setApellido2(apellido2);
                usuBean.setRol(rol);

                try {
                    usuDao.insertarDatos();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                UsuarioDao usuarioDao =new UsuarioDao();
                cct = request.getParameter("cct");
                try {
                    usuarioDao.consultarDatos(cct);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                UsuarioDao usDao =new UsuarioDao();
                cct = request.getParameter("cct");
                try {
                    usDao.elimiarDatos(cct);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "update":
                UsuarioDao uDao = new UsuarioDao();
                cct = request.getParameter("cct");;
                password = request.getParameter("password");
                correo = request.getParameter("correo");
                nombre = request.getParameter("nombre");
                apellido1 = request.getParameter("apellido1");
                apellido2= request.getParameter("apellido2");
                rol = request.getParameter("rol");

                try {
                    uDao.actualizarDatos(cct,password,correo,nombre,apellido1,apellido2,rol);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
