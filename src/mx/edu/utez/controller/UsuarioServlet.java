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
    public String cct;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        UsuarioBean usuBean = new UsuarioBean();
        UsuarioDao usuDao = new UsuarioDao();

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

        switch (accion){
            case "add":
                try {
                    usuBean.setCct(request.getParameter("cct"));
                    usuBean.setPassword(request.getParameter("password"));
                    usuBean.setCorreo(request.getParameter("correo"));
                    usuBean.setNombre(request.getParameter("nombre"));
                    usuBean.setApellido1(request.getParameter("apellido1"));
                    usuBean.setApellido2(request.getParameter("apellido2"));
                    usuBean.setRol(request.getParameter("rol"));
                    int respuesta = usuDao.insertarDatos(usuBean);
                    request.setAttribute("respuestaSMS", respuesta);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("/views/Usuarios/add.jsp").forward(request, response);
                break;

            case "search":
                try {
                    cct = request.getParameter("cct");
                    List<UsuarioBean> usuariosList = usuDao.consultarDatos(cct);
                    request.setAttribute("usuariosList", usuariosList);
                    if(usuariosList == null){
                        request.setAttribute("respuestaSMS", 0);
                    }
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
                try {
                    usuDao.elimiarDatos(cct);
                    request.getRequestDispatcher("/views/Usuarios/delete.jsp").forward(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "update":
                try {
                    usuBean.setCct(cct);
                    usuBean.setPassword(request.getParameter("password"));
                    usuBean.setCorreo(request.getParameter("correo"));
                    usuBean.setNombre(request.getParameter("nombre"));
                    usuBean.setApellido1(request.getParameter("apellido1"));
                    usuBean.setApellido2(request.getParameter("apellido2"));
                    usuBean.setRol(request.getParameter("rol"));
                    usuDao.actualizarDatos(usuBean);
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
