package mx.edu.utez.controller;

import mx.edu.utez.model.bean.ControlBean;
import mx.edu.utez.model.dao.ControlDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListaEstudiantesServlet")
public class ListaEstudiantesServlet extends HttpServlet {

	private ControlDao controlDao;
	public void init(){
		controlDao = new ControlDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listEstudiantes(request,response);
	}

	private void listEstudiantes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matricula = request.getParameter("matricula");
		if(matricula != null){
			controlDao.statusEstudiante(matricula);
		}

		List<ControlBean> listEstudianteActivo = controlDao.seleccionarTodosEstudiantesActivos();
		request.setAttribute("listEstudianteActivo",listEstudianteActivo);
		List<ControlBean> listEstudianteDesactivo = controlDao.seleccionarTodosEstudiantesDesactivos();
		request.setAttribute("listEstudianteDesactivo",listEstudianteDesactivo);

		request.getRequestDispatcher("/views/Personal/xcontrol.jsp").forward(request,response);
	}




}
