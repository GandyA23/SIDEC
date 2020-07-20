package mx.edu.utez.controller;

import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.TutorBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.io.IOException;

@WebServlet("/PersonalServlet")
public class PersonalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String listener = request.getParameter("listener");
    //usare tu tecnica milenaria ;v

        
    switch(listener){
        case "añadir":
            //Objetos
            TutorBean tutor = new TutorBean();
            DomicilioBean domicilio = new DomicilioBean();
            EstudianteBean alumno = new EstudianteBean();
            //DATOS DEL ESTUDIANTE

            alumno.setMatricula(request.getParameter("matricula"));
            alumno.setCurp(request.getParameter("curp"));
            alumno.setNombre(request.getParameter("nombre"));
            alumno.setApellido1(request.getParameter("apellido1"));
            alumno.setApellido2(request.getParameter("apellido2"));
            alumno.setGenero(request.getParameter("customRadioInline1"));
            String fechaDeNacimeinto = request.getParameter("dia")+"-"+request.getParameter("mes")+"-"+request.getParameter("año");
            Date miFecha = new Date(java.util.Date.parse(fechaDeNacimeinto));
            alumno.setFechaNacimiento(miFecha);

            //String dia = request.getParameter("dia");
            //String mes = request.getParameter("mes");
            //String año = request.getParameter("año");
            alumno.setTelefono(request.getParameter("telefono"));
            alumno.setCorreo(request.getParameter("correo"));
            alumno.setCicloEscolar(request.getParameter("añoInicio")+"-"+request.getParameter("añoFin"));
            alumno.setNivelActual(request.getParameter("seleccion"));

            //DATOS DEL DOMICILIO
            domicilio.setCalle(request.getParameter("calle"));
            domicilio.setNoInterior(request.getParameter("interior"));
            domicilio.setNoExterior(request.getParameter("exterior"));
            domicilio.setCodigoPostal(request.getParameter("codigoPostal"));
            domicilio.setColonia(request.getParameter("colonia"));
            domicilio.setMunicipio(request.getParameter("municipio"));

            //DATOS DEL TUTOR

            tutor.setNombre(request.getParameter("tutorNombre"));
            tutor.setApellido1(request.getParameter("tutorApellido1"));
            tutor.setApellido2(request.getParameter("tutorApellido2"));
            tutor.setGenero(request.getParameter("customRadioInline2"));
            tutor.setCorreo(request.getParameter("tutorCorreo"));
            tutor.setTelefonoPersonal(request.getParameter("tutorTelefono"));
            tutor.setTelefonoTrabajo(request.getParameter("tutorTelTrabajo"));

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
