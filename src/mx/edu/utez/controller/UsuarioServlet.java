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
import java.util.List;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    private String cct;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accionOpc = request.getParameter("accion");
        String accion;
        String opc = null;

        if(accionOpc.contains(":")){
            String[] parts = accionOpc.split(":");
            accion = parts[0];
            opc = parts[1];
        }else {
             accion= accionOpc;
        }

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
                System.out.println(cct+","+ password + "," + correo +","+ nombre + "," + apellido1 + "," + apellido2+","+ rol);
                usuBean.setCct(cct);
                usuBean.setPassword(password);
                usuBean.setCorreo(correo);
                usuBean.setNombre(nombre);
                usuBean.setApellido1(apellido1);
                usuBean.setApellido2(apellido2);
                usuBean.setRol(rol);

                try {
                    String resultado = usuDao.insertarDatos(usuBean);
                    System.out.println(resultado);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("/views/Usuarios/add.jsp").forward(request, response);
                break;



            case "search":

                UsuarioDao usuarioDao =new UsuarioDao();
                cct = request.getParameter("cct");
                System.out.println(cct +" "+ accion);
                try {
                    List<UsuarioBean> usuariosList = usuarioDao.consultarDatos(cct);
                    request.setAttribute("usuariosList", usuariosList);
                    switch (opc){
                        case "1":
                            request.getRequestDispatcher("/views/Usuarios/delete.jsp").forward(request, response);
                            break;
                        case "2":
                            request.getRequestDispatcher("/views/Usuarios/update.jsp").forward(request, response);
                            break;
                        case "3":
                            request.getRequestDispatcher("/views/Usuarios/search.jsp").forward(request, response);
                            break;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;


            case "delete":

                UsuarioDao usDao = new UsuarioDao();
                try {
                    usDao.elimiarDatos(cct);
                    System.out.println("elimino");
                    request.getRequestDispatcher("/views/Usuarios/delete.jsp").forward(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "update":
                UsuarioDao uDao = new UsuarioDao();
                password = request.getParameter("password");
                correo = request.getParameter("correo");


                nombre = request.getParameter("nombre");


                apellido1 = request.getParameter("apellido1");


                apellido2= request.getParameter("apellido2");

                rol = request.getParameter("rol");
                System.out.println(cct+" "+password+ " "+ correo+" "+nombre+" "+apellido1+" "+apellido2+" "+rol
                );
                try {
                    String respuesta = uDao.actualizarDatos(cct,password,correo,nombre,apellido1,apellido2,rol);
                    System.out.println(respuesta);
                    request.getRequestDispatcher("/views/Usuarios/update.jsp").forward(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
