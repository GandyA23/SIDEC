package mx.edu.utez.controller;

import mx.edu.utez.model.bean.LoginBean;
import mx.edu.utez.model.dao.LoginDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String cct = request.getParameter("cct");
        String password = request.getParameter("password");
        LoginBean logben = new LoginBean(cct,password);

        LoginDao logdao = new LoginDao();
        try {
            LoginBean usuarioWeb = logdao.validarRol(logben);
            if(usuarioWeb == null){
                System.out.println("Error de sesion");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            else if (usuarioWeb.getRol().equals("Administrador")){
                System.out.println("Es Administrador");
                HttpSession sesionActiva = request.getSession();
                sesionActiva.setAttribute("UsuarioActivo", usuarioWeb);
                request.getRequestDispatcher("/views/main.jsp").forward(request, response);
            }else if(usuarioWeb.getRol().equals("Director")){
                System.out.println("Es Director");

                HttpSession sesionActiva = request.getSession();
                sesionActiva.setAttribute("UsuarioActivo", usuarioWeb);
                request.getRequestDispatcher("/views/main.jsp").forward(request, response);
            }else if(usuarioWeb.getRol().equals("Docente")){
                System.out.println("Es Docente");
                HttpSession sesionActiva = request.getSession();
                sesionActiva.setAttribute("UsuarioActivo", usuarioWeb);
                request.getRequestDispatcher("/views/main.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
