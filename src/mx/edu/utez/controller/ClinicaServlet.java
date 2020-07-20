package mx.edu.utez.controller;

import mx.edu.utez.model.bean.EstudianteBean;
import mx.edu.utez.model.bean.Informacion_ClinicaBean;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");


		String accion = request.getParameter("accion");
		System.out.println(accion);



		switch (accion){
			case "add":
				String matricula = request.getParameter("matricula");
				String numeroSeguro = request.getParameter("numeroSeguro");
				String unidadMedica = request.getParameter("unidadMedica");
				String tipoSangre = request.getParameter("tipoSangre");
				String peso = request.getParameter("peso");
				String estatura = request.getParameter("estatura");
				String diagnostico = request.getParameter("diagPsico");
				if(diagnostico.isEmpty()){
					diagnostico = "Ninguno";
				}
				String opc_cronica = request.getParameter("opc_cronica");
				String cronica;
				if(opc_cronica.equals("si_cronica")){
					String cronica1 = request.getParameter("enferCronicas1");
					String cronica2 = request.getParameter("enferCronicas2");
					cronica = cronica1 +":"+cronica2;
				}else{
					cronica="Ninguna";
				}
				String opc_hereditaria = request.getParameter("opc_hereditaria");
				String hereditaria;
				if(opc_hereditaria.equals("si_hereditaria")){
					String hereditaria1 = request.getParameter("enferHereditarias1");
					String hereditaria2 = request.getParameter("enferHereditarias2");
					hereditaria = hereditaria1+":"+hereditaria2;
				}else{
					hereditaria="Ninguna";
				}
				String opc_alergia = request.getParameter("opc_alergias");
				String alergia;
				if (opc_alergia.equals("si_alergias")){
					String alergia1 = request.getParameter("alergias1");
					String alergia2 = request.getParameter("alergias2");
					alergia = alergia1+":"+alergia2;
				}else{
					alergia="Ninguna";
				}
				String opc_discapacidad = request.getParameter("opc_discapacidad");
				String discapacidad;
				if (opc_discapacidad.equals("si_discapacidad")){
					String discapacidad1 = request.getParameter("discapacidades1");
					String discapacidad2 = request.getParameter("discapacidades2");
					discapacidad = discapacidad1+":"+discapacidad2;
				}else{
					discapacidad="Ninguna";
				}

				System.out.println(matricula+" "+peso+" "+ estatura+" "+tipoSangre+" "+numeroSeguro+" "+unidadMedica+" "+alergia
						+" "+cronica+" "+hereditaria+" "+discapacidad+" "+diagnostico);
				try{

					Informacion_ClinicaDao clinicaDao = new Informacion_ClinicaDao();

					Informacion_ClinicaBean clinicaBean = new Informacion_ClinicaBean(matricula,peso, estatura, tipoSangre,numeroSeguro, unidadMedica,
							alergia, cronica, hereditaria, discapacidad, diagnostico);

					clinicaDao.insertarDatos(clinicaBean);
					request.getRequestDispatcher("/views/Clinica/add.jsp").forward(request,response);
				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "search":
				String mat = request.getParameter("matricula");

				Informacion_ClinicaDao clinicaDao = new Informacion_ClinicaDao();

				List<Informacion_ClinicaBean> listClinica = clinicaDao.consultarDatos(mat);

				request.setAttribute("listClinica",listClinica );

				request.getRequestDispatcher("/views/Clinica/delete.jsp").forward(request,response);
				break;

			case "delete":

				request.getRequestDispatcher("/views/Clinica/delete.jsp").forward(request,response);
				break;

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}





}

