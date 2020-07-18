<%@ page import="mx.edu.utez.model.bean.LoginBean" %><%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 26/06/2020
  Time: 10:25 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<%
	HttpSession sesionActiva = request.getSession();
	LoginBean usuarioWeb = (LoginBean)sesionActiva.getAttribute("UsuarioActivo");
%>

<!-- LO QUE SE MOSTRARA EN LA PAGINA (borra esta parte hasta el final del div)-->

<div class="jumbotron text-center bg-white">
	<h1 class="display-1"><b>¡Bienvenid@!</b></h1>
	<h3 class="display-4"><b><%out.print(usuarioWeb.getCct());%></b></h3>
	<p class="lead">Para comenzar puedes dirigirte al menú de la izquierda donde se encuentran todas las funciones
		para utilizar el sistema. Y si deseas ocultarlas da click en SIDEC</p>
	<hr class="my-4">

	<h2>¡Por un control mejorado con expedintes digitales!</h2>
	<blockquote class="blockquote text-center">
		<p class="mb-0 text-justify text-dark">El sistema de expedientes controlados se apoyo en modelos de desarrollo de software con
			herramientas del mundo actual. Esta aplicación fue inicialmente concebida para ser
			usada de manera interna de forma que nuestros clientes recibían un conjunto de procedimientos y una
			aplicación para gestionarlos.
			Poco a poco se ha asumido la responsabilidad de diseñar y poner en práctica nuevos procedimientos, esta
			nueva situación nos ha llevado a replantear por completo la herramienta de modelado para
			ofrecer importantes mejoras funcionales y de uso.</p>
		<footer class="blockquote-footer">Estudiantes de Desarrollo de Software<cite title="Source Title"> UTEZ</cite></footer>
	</blockquote>

	<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/views/Personal/xcontrol.jsp" role="button">Control de Alumnos</a>
</div>

<jsp:include page="layout/footer.jsp"></jsp:include>