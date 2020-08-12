<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession sesionActiva = request.getSession();
	LoginBean usuarioWeb = (LoginBean)sesionActiva.getAttribute("UsuarioActivo");
	switch (usuarioWeb.getRol()){
	case "Administrador": %> <jsp:include page="/views/layout/nav.jsp"></jsp:include> <% break;
	case "Director": %> <jsp:include page="/views/layout/navDirector.jsp"></jsp:include><% break;
	case "Docente": %><jsp:include page="/views/layout/navDocente.jsp"></jsp:include><% break;
}
%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Académica</li>
		<li class="breadcrumb-item" aria-current="page"><b>Eliminar Registro</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper">
	<br>
	<div class="container text-center bg-white">
		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
		<br>
		<div class="row">
			<div class="col-md">
				<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Búsqueda de registro</b></p>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
				<div class="row form-group">
					<div class="col">
						<input type="text" name="matricula" class="form-control  text-center" maxlength="15" placeholder="Matrícula" required>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn bg-danger btn-block text-white" name="accion" value="search:1"><b>Buscar</b></button>
					</div>
				</div>
			</form>
		</div>
		<div class="bg-gris text-white text-center" style="border-radius: 30px;">
			<b>Formación destacada</b>
		</div>
		<br>
		<table class="table font-italic text-dark table-hover text-left">
			<tbody>
			<c:forEach var="academico" items="${listAcademico}">
			<tr>
				<td scope="row">Matrícula</td>
				<td id="valorLleno" ><c:out value="${academico.matricula.matricula}"></c:out></td>
			</tr>

			<tr>
				<td scope="row">Diplomas</td>
				<td><c:out value="${academico.diploma}"></c:out></td>
			</tr>

			<tr>
				<td scope="row">Certificados</td>
				<td><c:out value="${academico.certificacion}"></c:out></td>
			</tr>

			<tr>
				<td scope="row">Reconocimientos</td>
				<td><c:out value="${academico.reconocimiento}"></c:out></td>
			</tr>

			<tr>
				<td scope="row">Menciones honoríficas</td>
				<td><c:out value="${academico.mencion}"></c:out></td>
			</tr>

			<tr>
				<td scope="row">Observaciones de conducta</td>
				<td><c:out value="${academico.observacion}"></c:out></td>
			</tr>
			</tbody>
			</c:forEach>
		</table>


		<form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button id="btnControl" onclick="preguntaBorrar()" type="button" class="btn bg-danger btn-block text-white" disabled>
						<b>Eliminar</b></button>
					<button id="enviarForm" type="submit" name="accion" value="delete" hidden></button>
				</div>
			</div>
		</form>

	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moduloAcademico.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>