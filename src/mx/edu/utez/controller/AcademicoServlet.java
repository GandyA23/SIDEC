package mx.edu.utez.controller;

import mx.edu.utez.model.bean.*;
import mx.edu.utez.model.dao.Informacion_AcademicaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AcademicoServlet")
public class AcademicoServlet extends HttpServlet {
	private static String matricula;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String accionOpc = request.getParameter("accion");
		String accion;
		String opc = null;
		if (accionOpc.contains(":")) {
			String[] parts = accionOpc.split(":");
			accion = parts[0];
			opc = parts[1];
		} else {
			accion = accionOpc;
		}

		AcademicoBean academicoBean = new AcademicoBean();
		Informacion_AcademicaDao academicaDao = new Informacion_AcademicaDao();
		switch (accion){
			case "add":
				try{
					matricula = request.getParameter("matricula");
					academicoBean.setMatricula(new EstudianteBean(matricula));
					
					String opcDiploma = request.getParameter("checkDiploma");
					if(opcDiploma!=null)
						academicoBean.setDiploma(request.getParameter("diploma"));
					else academicoBean.setDiploma(null);

					String opcRecono = request.getParameter("checkReconocimiento");
					if(opcRecono!=null)
						academicoBean.setReconocimiento(request.getParameter("reconocimiento"));
					else academicoBean.setReconocimiento(null);

					String opcMenciones = request.getParameter("checkMenciones");
					if(opcMenciones!=null)
						academicoBean.setMencion(request.getParameter("mencion"));
					else academicoBean.setMencion(null);

					String opcCertificaciones = request.getParameter("checkCertificaciones");
					if(opcCertificaciones!=null)
						academicoBean.setCertificacion(request.getParameter("certificacion"));
					else academicoBean.setCertificacion(null);

					String obser = request.getParameter("observaciones");
					if(obser!=null)
						academicoBean.setObservacion(obser);
					else academicoBean.setObservacion(null);

					int respuesta = academicaDao.insertarDatos(academicoBean);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Academico/add.jsp").forward(request, response);

				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "search":
				try{
					matricula = request.getParameter("matricula");
					List<AcademicoBean> listAcademico = academicaDao.consultarDatos(matricula);
					if(listAcademico == null)
						request.setAttribute("respuestaSMS", 0);
					else
						request.setAttribute("listAcademico", listAcademico);
					switch (opc){
						case "1": request.getRequestDispatcher("/views/Academico/delete.jsp").forward(request, response);break;
						case "2": request.getRequestDispatcher("/views/Academico/update.jsp").forward(request, response);break;
						case "3": request.getRequestDispatcher("/views/Academico/search.jsp").forward(request, response);break;
					}
				}catch (Exception e){
					e.printStackTrace();
				}
			break;

			case "delete":
				try{
					int respuesta = academicaDao.eliminarDatos(matricula);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Academico/delete.jsp").forward(request, response);
				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "update":
				try{
					academicoBean.setMatricula(new EstudianteBean(matricula));
					String opcDiploma = request.getParameter("checkDiploma");
					if(opcDiploma!=null)
						academicoBean.setDiploma(request.getParameter("diploma"));
					String opcRecono = request.getParameter("checkReconocimiento");
					if(opcRecono!=null)
						academicoBean.setReconocimiento(request.getParameter("reconocimiento"));
					String opcMenciones = request.getParameter("checkMenciones");
					if(opcMenciones!=null)
						academicoBean.setMencion(request.getParameter("mencion"));
					String opcCertificaciones = request.getParameter("checkCertificaciones");
					if(opcCertificaciones!=null)
						academicoBean.setCertificacion(request.getParameter("certificacion"));
					academicoBean.setObservacion(request.getParameter("observaciones"));

					int respuesta = academicaDao.modificarDatos(academicoBean);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Academico/update.jsp").forward(request, response);
				}catch (Exception e){
					e.printStackTrace();
				}
				break;
			case "report":
				try{
					ReporteBean reporteBean = new ReporteBean();
					reporteBean.setFolio(Integer.parseInt(request.getParameter("folio")));
					reporteBean.setFecha(request.getParameter("fecha"));
					reporteBean.setMotivo(request.getParameter("motivo"));
					reporteBean.setDescripcion(request.getParameter("descripcion"));
					reporteBean.setCanalizacion(request.getParameter("canalizacion"));
					reporteBean.setCct(new UsuarioBean(request.getParameter("realizadoCCT")));
					reporteBean.setMatricula(new EstudianteBean(request.getParameter("matricula")));
					int respuesta = academicaDao.insertarReporte(reporteBean);
					request.setAttribute("respuestaSMS", respuesta);
					this.doGet(request,response);
					//request.getRequestDispatcher("/views/Academico/reportes.jsp").forward(request,response);
				}catch (Exception e){
					e.printStackTrace();
				}
				break;
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Informacion_AcademicaDao academicaDao = new Informacion_AcademicaDao();
		HttpSession sesionActiva = request.getSession();
		LoginBean usuarioWeb = (LoginBean)sesionActiva.getAttribute("UsuarioActivo");
		try {
			request.setAttribute("folioActual",academicaDao.traerFolio());
			request.setAttribute("rolCCT",usuarioWeb.getCct());
			List<ControlBean> listEstudianteReportes = academicaDao.listaEstudiantesReportados();
			request.setAttribute("listEstudianteReportes",listEstudianteReportes);
			request.getRequestDispatcher("/views/Academico/reportes.jsp").forward(request,response);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
