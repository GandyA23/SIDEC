package mx.edu.utez.controller;

import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.ClinicaBean;
import mx.edu.utez.model.dao.Informacion_ClinicaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ClinicaServlet")
public class ClinicaServlet extends HttpServlet {
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

		ClinicaBean clinicaBean = new ClinicaBean();
		Informacion_ClinicaDao clinicaDao = new Informacion_ClinicaDao();

		switch (accion) {
			case "add":
				try {
					matricula = request.getParameter("matricula");
					clinicaBean.setMatricula(new EstudianteBean(matricula));
					clinicaBean.setNumeroSeguro(request.getParameter("numeroSeguro"));
					clinicaBean.setUnidadMedica(request.getParameter("unidadMedica"));
					clinicaBean.setTipoSangre(request.getParameter("tipoSangre"));
					clinicaBean.setPeso(request.getParameter("peso"));
					clinicaBean.setEstatura(request.getParameter("estatura"));

					String diagnostico = request.getParameter("diagPsico");
					if (diagnostico.isEmpty()) {
						clinicaBean.setDiagPsico("Ninguno");
					}else clinicaBean.setDiagPsico(diagnostico);


					String opc_cronica = request.getParameter("opc_cronica");
					if (opc_cronica.equals("si_cronica")) {
						String cronica1 = request.getParameter("enferCronicas1");
						String cronica2 = request.getParameter("enferCronicas2");
						if(cronica2.isEmpty()) cronica2 = "Ninguna";
						clinicaBean.setEnferCronicas(cronica1 + ":" + cronica2);
					} else clinicaBean.setEnferCronicas("Ninguna");


					String opc_hereditaria = request.getParameter("opc_hereditaria");
					if (opc_hereditaria.equals("si_hereditaria")) {
						String hereditaria1 = request.getParameter("enferHereditarias1");
						String hereditaria2 = request.getParameter("enferHereditarias2");
						if(hereditaria2.isEmpty())hereditaria2="Ninguna";
						clinicaBean.setEnferHereditarias(hereditaria1 + ":" + hereditaria2);
					} else clinicaBean.setEnferHereditarias("Ninguna");


					String opc_alergia = request.getParameter("opc_alergias");
					if (opc_alergia.equals("si_alergias")) {
						String alergia1 = request.getParameter("alergias1");
						String alergia2 = request.getParameter("alergias2");
						if(alergia2.isEmpty())alergia2="Ninguna";
						clinicaBean.setAlergias(alergia1 + ":" + alergia2);
					} else clinicaBean.setAlergias("Ninguna");

					String opc_discapacidad = request.getParameter("opc_discapacidad");
					if (opc_discapacidad.equals("si_discapacidad")) {
						String discapacidad1 = request.getParameter("discapacidades1");
						String discapacidad2 = request.getParameter("discapacidades2");
						if(discapacidad2.isEmpty())discapacidad2="Ninguna";
						clinicaBean.setDiscapacidades(discapacidad1 + ":" + discapacidad2);
					} else clinicaBean.setDiscapacidades("Ninguna");

					int respuesta = clinicaDao.insertarDatos(clinicaBean);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Clinica/add.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;

			case "search":
				try{
					matricula = request.getParameter("matriculaEst");
					List<ClinicaBean> listClinica = clinicaDao.consultarDatos(matricula);
					if(listClinica == null){
						request.setAttribute("respuestaSMS", 0);
					}
					request.setAttribute("listClinica", listClinica);
					switch (opc){
						case "1": request.getRequestDispatcher("/views/Clinica/delete.jsp").forward(request, response);break;
						case "2": request.getRequestDispatcher("/views/Clinica/update.jsp").forward(request, response);break;
						case "3": request.getRequestDispatcher("/views/Clinica/search.jsp").forward(request, response);break;
					}
				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "delete":
				try{
					int respuesta = clinicaDao.elimiarDatos(matricula);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Clinica/delete.jsp").forward(request, response);
				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "update":
				try{
					clinicaBean.setMatricula(new EstudianteBean(matricula));
					clinicaBean.setNumeroSeguro(request.getParameter("numeroSeguro"));
					clinicaBean.setUnidadMedica(request.getParameter("unidadMedica"));
					clinicaBean.setTipoSangre(request.getParameter("tipoSangre"));
					clinicaBean.setPeso(request.getParameter("peso"));
					clinicaBean.setEstatura(request.getParameter("estatura"));
					String diagnostico = request.getParameter("diagPsico");
					if (diagnostico.isEmpty()) {
						clinicaBean.setDiagPsico("Ninguno");
					} else clinicaBean.setDiagPsico(diagnostico);


					String opc_cronica = request.getParameter("opc_cronica");
					if (opc_cronica.equals("si_cronica")) {
						String cronica1 = request.getParameter("enferCronicas1");
						String cronica2 = request.getParameter("enferCronicas2");
						if(cronica2.isEmpty()) cronica2 = "Ninguna";
						clinicaBean.setEnferCronicas(cronica1 + ":" + cronica2);
					} else clinicaBean.setEnferCronicas("Ninguna");

					String opc_hereditaria = request.getParameter("opc_hereditaria");
					if (opc_hereditaria.equals("si_hereditaria")) {
						String hereditaria1 = request.getParameter("enferHereditarias1");
						String hereditaria2 = request.getParameter("enferHereditarias2");
						if(hereditaria2.isEmpty())hereditaria2="Ninguna";
						clinicaBean.setEnferHereditarias(hereditaria1 + ":" + hereditaria2);
					} else clinicaBean.setEnferHereditarias("Ninguna");

					String opc_alergia = request.getParameter("opc_alergias");
					if (opc_alergia.equals("si_alergias")) {
						String alergia1 = request.getParameter("alergias1");
						String alergia2 = request.getParameter("alergias2");
						if(alergia2.isEmpty())alergia2="Ninguna";
						clinicaBean.setAlergias(alergia1 + ":" + alergia2);
					} else clinicaBean.setAlergias("Ninguna");

					String opc_discapacidad = request.getParameter("opc_discapacidad");
					if (opc_discapacidad.equals("si_discapacidad")) {
						String discapacidad1 = request.getParameter("discapacidades1");
						String discapacidad2 = request.getParameter("discapacidades2");
						if(discapacidad2.isEmpty())discapacidad2="Ninguna";
						clinicaBean.setDiscapacidades(discapacidad1 + ":" + discapacidad2);
					} else clinicaBean.setDiscapacidades("Ninguna");

					int respuesta = clinicaDao.modificarDatos(clinicaBean);
					request.setAttribute("respuestaSMS", respuesta);
					request.getRequestDispatcher("/views/Clinica/update.jsp").forward(request, response);

				}catch (Exception e){
					e.printStackTrace();
				}
				break;

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


}

