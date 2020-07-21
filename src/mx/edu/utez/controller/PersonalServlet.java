package mx.edu.utez.controller;

import com.sun.deploy.uitoolkit.impl.text.TextUIToolkit;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.dao.Informacion_PersonalDao;
import mx.edu.utez.model.dao.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PersonalServlet")
public class PersonalServlet extends HttpServlet {
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
		String matricula;
		String nombre;
		String apellido1;
		String apellido2;
		String listener = request.getParameter("listener");

		switch (listener) {

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
				alumno.setGenero(request.getParameter("genero1"));
				String fechaDeNacimeinto = request.getParameter("año") + "-" + request.getParameter("mes") + "-" + request.getParameter("dia");

				alumno.setFechaNacimiento(java.sql.Date.valueOf(fechaDeNacimeinto));
				alumno.setTelefono(request.getParameter("telefono"));
				alumno.setCorreo(request.getParameter("correo"));
				alumno.setCicloEscolar(request.getParameter("añoInicio") + "-" + request.getParameter("añoFin"));
				alumno.setNivelActual(request.getParameter("seleccion"));
				alumno.setStatus(1);

				//DATOS DEL DOMICILIO
				domicilio.setMatriculaEstudiante(request.getParameter("matricula"));
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
				tutor.setGenero(request.getParameter("genero2"));
				tutor.setCorreo(request.getParameter("tutorCorreo"));
				tutor.setTelefonoPersonal(request.getParameter("tutorTelefono"));
				tutor.setTelefonoTrabajo(request.getParameter("tutorTelTrabajo"));

				try {
					String estado = dataAccess1.insertarDatos(alumno, tutor, domicilio);
					System.out.println(estado);
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/views/Personal/add.jsp").forward(request, response);
				break;


			case "eliminar":

				break;
			case "buscar":
				Informacion_PersonalDao dataAccess2 = new Informacion_PersonalDao();
				matricula = request.getParameter("matricula");
				nombre = request.getParameter("tutorNombre");
				apellido1 = request.getParameter("tutorApellido1");
				apellido2 = request.getParameter("tutorApellido2");
				try{
					List<EstudianteBean> alumnoLista  = new Informacion_PersonalDao().datosEstudiante(matricula);
					List<TutorBean> tutorLista = new Informacion_PersonalDao().datosTutor(nombre, apellido1, apellido2);
					List<DomicilioBean> domicilioLista = new Informacion_PersonalDao().datosDomicilio(matricula);
					request.setAttribute("alumnoLista",alumnoLista);
					request.setAttribute("tutorLista",tutorLista);
					request.setAttribute("domicilioLista",domicilioLista);
					switch (opc){
						case "1":
							request.getRequestDispatcher("/views/Personal/delete.jsp").forward(request, response);
							break;
						case "2":
							request.getRequestDispatcher("/views/Personal/update.jsp").forward(request, response);
							break;
						case "3":
							request.getRequestDispatcher("/views/Personal/search.jsp").forward(request, response);
							break;
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				break;
			case "actualizar":
				break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
