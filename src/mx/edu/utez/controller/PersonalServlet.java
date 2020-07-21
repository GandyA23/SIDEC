package mx.edu.utez.controller;

import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.dao.Informacion_PersonalDao;

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String listener = request.getParameter("listener");
    //usare tu tecnica milenaria ;v

        
    switch(listener){
        case "añadir":
            //Objetos
            TutorBean tutor = new TutorBean();
            DomicilioBean domicilio = new DomicilioBean();
            EstudianteBean alumno = new EstudianteBean();
            Informacion_PersonalDao dataAccess1 = new Informacion_PersonalDao();
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

            alumno.setTelefono(request.getParameter("telefono"));
            alumno.setCorreo(request.getParameter("correo"));
            alumno.setCicloEscolar(request.getParameter("añoInicio")+"-"+request.getParameter("añoFin"));
            alumno.setNivelActual(request.getParameter("seleccion"));
            alumno.setStatus(true);

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
            try{
                String estado = dataAccess1.insertarDatos(alumno,tutor,domicilio);
                System.out.println(estado);
            }catch (Exception e){
                e.printStackTrace();
            }
            request.getRequestDispatcher("/views/Personal/add.jsp").forward(request, response);
            break;
        case "eliminar":
            Informacion_PersonalDao dataAccess2 = new Informacion_PersonalDao();

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
