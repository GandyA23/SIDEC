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
		<li class="breadcrumb-item" aria-current="page"><b>Añadir Registro</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper">
	<div class="container text-center bg-white">
		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
		<br>
		<div class="row">
			<div class="col-md">
				<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Formación Destacada</b></p>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
			<div class="row form-group col-md-4 d-inline-flex">
				<input type="text" name="matricula" class="form-control  text-center" maxlength="15" placeholder="Matrícula" required>
			</div>

			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input class="form-check-input" type="checkbox" name="checkDiploma" value="Si" id="diplomas" onclick="habilita(this.id, 'diploma')">
					<label class="form-check-label" for="diplomas"> Diplomas </label>
				</div>
				<div class="col-md">
					<textarea class="form-control rounded" name="diploma" id="diploma" placeholder="Descripción:" readonly></textarea>
				</div>
				<br>

				<div class="col-md">
					<input class="form-check-input" type="checkbox" name="checkReconocimiento" value="Si" id="reconocimientos" onclick="habilita(this.id, 'reconocimiento')">
					<label class="form-check-label" for="reconocimientos"> Reconocimientos </label>
				</div>
				<div class="col-md">
					<textarea class="form-control rounded" name="reconocimiento" id="reconocimiento" placeholder="Descripción:" readonly></textarea>
				</div>
				<br>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input class="form-check-input" type="checkbox" name="checkMenciones" value="Si" id="menciones" onclick="habilita(this.id, 'mencion')">
					<label class="form-check-label" for="menciones"> Menciones Honoríficas </label>
				</div>
				<div class="col-md">
					<textarea class="form-control rounded" name="mencion" id="mencion" placeholder="Descripción:" readonly></textarea>
				</div>
				<br>
				<div class="col-md">
					<input class="form-check-input" type="checkbox" name="checkCertificaciones" value="Si" id="certificaciones" onclick="habilita(this.id, 'certificacion')">
					<label class="form-check-label" for="certificaciones"> Certificaciones </label>
				</div>
				<div class="col-md">
					<textarea class="form-control rounded" name="certificacion" id="certificacion" placeholder="Descripción:" readonly></textarea>
				</div>
				<br>
			</div>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Conducta</b></p>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<textarea class="form-control rounded mt-3" name="observaciones" placeholder="Observaciones de conducta"></textarea>
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button type="submit" class="btn bg-danger btn-block text-white" name="accion" value="add"><b>Registrar</b>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>