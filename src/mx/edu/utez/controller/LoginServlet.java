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

        //Roles con sus rutas que admite el Sistema Web
        String[] roles = { "Administrador", "Director", "Docente" };
        String[] rutas = { "main", "mainDirector", "mainDocente" };

        String cct = request.getParameter("cct");
        String password = request.getParameter("password");

        LoginBean logben = new LoginBean(cct,password);
        LoginDao logdao = new LoginDao();

        try {
            LoginBean usuarioWeb = logdao.validarRol(logben);

            //Verifico a que rol pertenece el usuario
            for(int i=0; i<roles.length; i++)
                if( usuarioWeb.getRol().equals( roles[i] ) ){
                    System.out.println("Inicio sesión un usuario con rol de: " + usuarioWeb.getRol() );
                    HttpSession sesionActiva = request.getSession();
                    sesionActiva.setAttribute("UsuarioActivo", usuarioWeb);
                    request.getRequestDispatcher("/views/" + rutas[i] + ".jsp").forward(request, response);
                }

        } catch (Exception e) {

            System.out.println("Error de sesion");
            request.setAttribute("respuestaSMS", "NO");
            request.getRequestDispatcher("/index.jsp").forward(request, response);

            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
