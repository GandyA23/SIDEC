package mx.edu.utez.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AcademicoServlet")
public class AcademicoServlet extends HttpServlet {
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

		switch (accion){
			case "add":
				try{

				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "search":
				try{

					switch (opc){
						case "1":
							request.getRequestDispatcher("/views/Academico/delete.jsp").forward(request, response);
							break;
						case "2":
							request.getRequestDispatcher("/views/Academico/update.jsp").forward(request, response);
							break;
						case "3":
							request.getRequestDispatcher("/views/Academico/search.jsp").forward(request, response);
							break;
					}


				}catch (Exception e){
					e.printStackTrace();
				}
			break;

			case "delete":
				try{
					System.out.println("Hola");
				}catch (Exception e){
					e.printStackTrace();
				}
				break;

			case "update":
				try{
					System.out.println("Hola");
					System.out.println("Hola de nuevo");
				}catch (Exception e){
					e.printStackTrace();
				}
				break;
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
