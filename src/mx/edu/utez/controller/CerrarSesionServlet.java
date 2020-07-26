package mx.edu.utez.controller;

import mx.edu.utez.model.dao.LoginDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/CerrarSesionServlet")
public class CerrarSesionServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		LoginDao cerrar = new LoginDao();
		try {
			cerrar.cerrarConexion();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		HttpSession sesionActiva = request.getSession();
		sesionActiva.removeAttribute("UsuarioActivo");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
