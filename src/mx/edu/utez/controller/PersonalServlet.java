package mx.edu.utez.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PersonalServlet")
public class PersonalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String listener = request.getParameter("listener");
    //usare tu tecnica milenaria ;v

    switch(listener){
        case "añadir":
            break;
        case "eliminar":
            break;
        case "buscar":
            break;
        case "buscarMatricula":
            break;
        case "actualizar":
            break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
