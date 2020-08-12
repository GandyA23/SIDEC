<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
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
		<li class="breadcrumb-item" aria-current="page"><b>Actualizar Datos</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper">
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
						<input type="text" name="matricula" class="form-control  text-center" maxlength="15"
						       placeholder="Matrícula" required>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn bg-danger btn-block text-white" name="accion" value="search:2">
							<b>Buscar</b></button>
					</div>
				</div>
			</form>
		</div>
		<div class="bg-gris text-white text-center" style="border-radius: 30px;">
			<b>Formación destacada</b>
		</div>
		<br>

		<form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
			<c:forEach var="academico" items="${listAcademico}">
				<div class="row form-group col-md-4 d-inline-flex">
					<input id="valorLleno" type="text" name="matricula" class="form-control text-center" maxlength="15" value="<c:out value="${academico.matricula.matricula}"></c:out>" placeholder="Matrícula" readonly>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<c:if test="${academico.diploma != null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkDiploma" value="Si" id="diplomas" checked onclick="habilita(this.id, 'diploma')">
							<label class="form-check-label" for="diplomas"> Diplomas </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="diploma" id="diploma" placeholder="Descripción:"><c:out value="${academico.diploma}"></c:out></textarea>
						</div>
					</c:if>
					<c:if test="${academico.diploma == null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkDiploma" value="Si" id="diplomas" onclick="habilita(this.id, 'diploma')">
							<label class="form-check-label" for="diplomas"> Diplomas </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="diploma" id="diploma" placeholder="Descripción:" readonly></textarea>
						</div>
					</c:if>
					<br>

					<c:if test="${academico.reconocimiento != null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkReconocimiento" value="Si"
							       id="reconocimientos" checked onclick="habilita(this.id, 'reconocimiento')">
							<label class="form-check-label" for="reconocimientos"> Reconocimientos </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="reconocimiento" id="reconocimiento" placeholder="Descripción:"><c:out value="${academico.reconocimiento}"></c:out></textarea>
						</div>
					</c:if>
					<c:if test="${academico.reconocimiento == null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkReconocimiento" value="Si"
							       id="reconocimientos" onclick="habilita(this.id, 'reconocimiento')" readonly>
							<label class="form-check-label" for="reconocimientos"> Reconocimientos </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="reconocimiento" id="reconocimiento" placeholder="Descripción:" readonly></textarea>
						</div>
					</c:if>
					<br>
				</div>
				<div class="row form-group col-md d-inline-flex">

					<c:if test="${academico.mencion != null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkMenciones" value="Si" id="menciones" checked onclick="habilita(this.id, 'mencion')">
							<label class="form-check-label" for="menciones"> Menciones Honoríficas </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="mencion" id="mencion" placeholder="Descripción:"><c:out value="${academico.mencion}"></c:out></textarea>
						</div>
					</c:if>
					<c:if test="${academico.mencion == null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkMenciones" value="Si" id="menciones" onclick="habilita(this.id, 'mencion')" readonly>
							<label class="form-check-label" for="menciones"> Menciones Honoríficas </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="mencion" id="mencion" placeholder="Descripción:" readonly></textarea>
						</div>
					</c:if>
					<br>

					<c:if test="${academico.certificacion != null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkCertificaciones" value="Si"
							       id="certificaciones" checked onclick="habilita(this.id, 'certificacion')">
							<label class="form-check-label" for="certificaciones"> Certificaciones </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="certificacion" id="certificacion" placeholder="Descripción:"><c:out value="${academico.certificacion}"></c:out></textarea>
						</div>
					</c:if>
					<c:if test="${academico.certificacion == null}">
						<div class="col-md">
							<input class="form-check-input" type="checkbox" name="checkCertificaciones" value="Si"
							       id="certificaciones" onclick="habilita(this.id, 'certificacion')" readonly>
							<label class="form-check-label" for="certificaciones"> Certificaciones </label>
						</div>
						<div class="col-md">
							<textarea class="form-control rounded" name="certificacion" id="certificacion" readonly placeholder="Descripción:"></textarea>
						</div>
					</c:if>
					<br>
				</div>
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Conducta</b></p>
					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<textarea class="form-control rounded mt-3" name="observaciones"
						          placeholder="Observaciones de conducta"><c:out value="${academico.observacion}"></c:out></textarea>
					</div>
				</div>

			</c:forEach>
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button id="btnControl" onclick="preguntaActualizar()" type="button" class="btn bg-danger btn-block text-white" disabled>
						<b>Actualizar</b></button>
					<button id="enviarForm" type="submit" name="accion" value="update" hidden></button>
				</div>
			</div>

		</form>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moduloAcademico.js"></script>

<jsp:include page="/views/layout/footer.jsp"></jsp:include>