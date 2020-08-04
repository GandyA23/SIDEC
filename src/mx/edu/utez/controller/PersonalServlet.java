package mx.edu.utez.controller;

import com.sun.deploy.uitoolkit.impl.text.TextUIToolkit;
import mx.edu.utez.model.bean.DomicilioBean;
import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.TutorBean;
import mx.edu.utez.model.dao.Informacion_PersonalDao;
import mx.edu.utez.model.dao.UsuarioDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.InputStream;
import java.sql.Date;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet("/PersonalServlet")
public class PersonalServlet extends HttpServlet {
	public String matricula;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		TutorBean tutor = new TutorBean();
		DomicilioBean domicilio = new DomicilioBean();
		EstudianteBean alumno = new EstudianteBean();
		Informacion_PersonalDao personalDao = new Informacion_PersonalDao();

		String listener = null;
		String accionOpc = request.getParameter("listener");
		String opc = null;

		if(accionOpc.contains(":")){
			String[] parts = accionOpc.split(":");
			listener = parts[0];
			opc = parts[1];
		}else {
			listener= accionOpc;
		}

		switch (listener) {
			case "añadir":
				try{
					alumno.setMatricula(request.getParameter("matricula"));
					alumno.setCurp(request.getParameter("curp"));
					alumno.setNombre(request.getParameter("nombre"));
					alumno.setApellido1(request.getParameter("apellido1"));
					alumno.setApellido2(request.getParameter("apellido2"));
					alumno.setGenero(request.getParameter("genero1"));
					alumno.setFechaNacimiento(request.getParameter("fechaDeNacimeinto"));
					alumno.setTelefono(request.getParameter("telefono"));
					alumno.setCorreo(request.getParameter("correo"));
					alumno.setCicloEscolar(request.getParameter("añoInicio") + "-" + request.getParameter("añoFin"));
					alumno.setNivelActual(request.getParameter("seleccion"));
					Part part = request.getPart("foto");
					InputStream foto = part.getInputStream();
					alumno.setFoto(foto);

					alumno.setStatus(1);

					domicilio.setMatriculaEstudiante(new EstudianteBean(request.getParameter("matricula")));
					domicilio.setCalle(request.getParameter("calle"));
					domicilio.setNoInterior(request.getParameter("interior"));
					domicilio.setNoExterior(request.getParameter("exterior"));
					domicilio.setCodigoPostal(request.getParameter("codigoPostal"));
					domicilio.setColonia(request.getParameter("colonia"));
					domicilio.setMunicipio(request.getParameter("municipio"));
					tutor.setNombre(request.getParameter("tutorNombre"));
					tutor.setApellido1(request.getParameter("tutorApellido1"));
					tutor.setApellido2(request.getParameter("tutorApellido2"));
					tutor.setGenero(request.getParameter("genero2"));
					tutor.setCorreo(request.getParameter("tutorCorreo"));
					tutor.setTelefonoPersonal(request.getParameter("tutorTelefono"));
					tutor.setTelefonoTrabajo(request.getParameter("tutorTelTrabajo"));

					int respuesta = personalDao.insertarDatos(alumno, tutor, domicilio);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Personal/add.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;

			case "eliminar":
				try{
					int respuesta = personalDao.eliminarDatos(matricula);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Personal/delete.jsp").forward(request,response);
				}catch(Exception e){
					e.printStackTrace();
				}
				break;

			case "buscar":
				try{
					matricula = request.getParameter("matricula");
					List<EstudianteBean> alumnoLista  = personalDao.datosEstudiante(matricula);
					if(alumnoLista != null){
						List<DomicilioBean> domicilioLista = personalDao.datosDomicilio(matricula);
						List<TutorBean> tutorLista = personalDao.datosTutor();
						request.setAttribute("alumnoLista",alumnoLista);
						request.setAttribute("tutorLista",tutorLista);
						request.setAttribute("domicilioLista",domicilioLista);
					}else{
						request.setAttribute("respuestaSMS", 0);
					}
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
				try{
					alumno.setMatricula(matricula);
					alumno.setCurp(request.getParameter("curp"));
					alumno.setNombre(request.getParameter("nombre"));
					alumno.setApellido1(request.getParameter("apellido1"));
					alumno.setApellido2(request.getParameter("apellido2"));
					alumno.setGenero(request.getParameter("genero1"));
					alumno.setFechaNacimiento(request.getParameter("fechaDeNacimeinto"));
					alumno.setTelefono(request.getParameter("telefono"));
					alumno.setCorreo(request.getParameter("correo"));
					alumno.setCicloEscolar(request.getParameter("cicloEscolar"));
					alumno.setNivelActual(request.getParameter("seleccion"));
					Part part = request.getPart("foto");
					InputStream foto = part.getInputStream();
					if(!foto.toString().contains("ByteArrayInputStream")){
						personalDao.actualizarFoto(foto, matricula);
					}
					domicilio.setCalle(request.getParameter("calle"));
					domicilio.setNoInterior(request.getParameter("interior"));
					domicilio.setNoExterior(request.getParameter("exterior"));
					domicilio.setCodigoPostal(request.getParameter("codigoPostal"));
					domicilio.setColonia(request.getParameter("colonia"));
					domicilio.setMunicipio(request.getParameter("municipio"));
					tutor.setNombre(request.getParameter("tutorNombre"));
					tutor.setApellido1(request.getParameter("tutorApellido1"));
					tutor.setApellido2(request.getParameter("tutorApellido2"));
					tutor.setGenero(request.getParameter("genero2"));
					tutor.setCorreo(request.getParameter("tutorCorreo"));
					tutor.setTelefonoPersonal(request.getParameter("tutorTelefono"));
					tutor.setTelefonoTrabajo(request.getParameter("tutorTelTrabajo"));
					int respuesta = personalDao.modificarDatos(alumno,domicilio,tutor);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Personal/update.jsp").forward(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matFoto =request.getParameter("matFoto");
		new Informacion_PersonalDao().consultarFoto(matFoto,response);
	}
}
