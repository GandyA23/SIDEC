<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<%
	HttpSession sesionActiva = request.getSession();
	LoginBean usuarioWeb = (LoginBean) sesionActiva.getAttribute("UsuarioActivo");
	switch (usuarioWeb.getRol()) {
		case "Administrador": %>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<% break;
	case "Director": %>
<jsp:include page="/views/layout/navDirector.jsp"></jsp:include>
<% break;
	case "Docente": %>
<jsp:include page="/views/layout/navDocente.jsp"></jsp:include>
<% break;
}
%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Académica</li>
		<li class="breadcrumb-item" aria-current="page"><b>Reportes</b></li>
	</ol>
</nav>

<div style="width: 100%" id="page-content-wrapper">
	<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>

	<nav>
		<div class="nav nav-tabs " id="nav-tab" role="tablist">
			<a class="nav-item nav-link text-danger active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
			   role="tab"
			   aria-controls="nav-home" aria-selected="true"> <b>Reportar</b> </a>

			<a class="nav-item nav-link text-danger" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
			   role="tab"
			   aria-controls="nav-profile" aria-selected="false"><b>Ver reportes</b></a>
		</div>
	</nav>


	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<div class="container text-center bg-white">
				<br>
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Reporte</b></p>
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
					<div class="row form-group d-inline-flex">
						<div class="col-md">
							<label class="mx-2" for="matricula">Alumno:</label>
							<input class="form-control text-center" type="text" id="matricula" name="matricula"
							       maxlength="15" placeholder="Matrícula" required>
						</div>
						<div class="col-md">
							<label class="mx-2" for="folio">Folio:</label>
							<input class="form-control text-center" type="number" id="folio" name="folio" maxlength="15"
							       value="<c:out value="${folioActual}"/>" readonly>
						</div>
						<div class="col-md">
							<label class="mx-2" for="realizado">Realizado:</label>
							<input class="form-control  text-center" type="text" id="realizado" name="realizadoCCT"
							       maxlength="15" value="<c:out value="${rolCCT}"/>" readonly>
						</div>
					</div>
					<br>

					<div class="row form-group d-inline-flex">
						<div class="col-md">
							<label class="mx-2" for="motivo">Motivo:</label>
							<select name="motivo" id="motivo" class="form-control" required>
								<option selected>Seleccione</option>
								<option>Conducta</option>
								<option>Agresión</option>
								<option>Acoso</option>
								<option>Otro</option>
							</select>
						</div>

						<div class="col-md">
							<label class="mx-2" for="fecha">Fecha:</label>
							<input type="date" id="fecha" name="fecha" placeholder="Fecha" required>
						</div>
					</div>
					<br>

					<div class="row form-group col-md d-inline-flex">
						<div class="col-md">
							<textarea class="form-control" rows="2" name="descripcion" placeholder="Descripción"
							          required></textarea>
						</div>
					</div>

					<div class="row form-group col-md d-inline-flex">
						<div class="col-md">
							<textarea class="form-control" rows="2" name="canalizacion" placeholder="Canalización"
							          required></textarea>
						</div>
					</div>

					<div class="row d-flex justify-content-center">
						<div class="col-md-4">
							<button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white"><b>Reportar</b>
							</button>
							<button id="enviarForm" type="submit" name="accion" value="report" hidden></button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			<div class="container">

				<br>
				<h2>Reportes Estudiantes</h2>
				<h6>Puedes buscar por matrícula, nombre o fecha, y a su vez visualizarlos.</h6>
				<hr class="my-3">
				<table class="table table-sm table-hover text-center display responsive nowrap" width="100%"
				       id="tablaActivos">
					<thead class="thead-light">
					<tr>
						<th scope="col">Folio</th>
						<th scope="col">Matrícula</th>
						<th scope="col">Nombre</th>
						<th scope="col">Primer apellido</th>
						<th scope="col">Fecha</th>
						<th scope="col">Ver</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="reportes" items="${listEstudianteReportes}">
						<tr>
							<td><c:out value="${reportes.folio}"/></td>
							<td><c:out value="${reportes.matricula}"/></td>
							<td><c:out value="${reportes.nombre}"/></td>
							<td><c:out value="${reportes.apellido1}"/></td>
							<td><c:out value="${reportes.fecha}"/></td>
							<input type="text" hidden value="<c:out value="${reportes.CCT}"/>">
							<input type="text" hidden value="<c:out value="${reportes.apellido2}"/>">
							<input type="text" hidden value="<c:out value="${reportes.motivo}"/>">
							<input type="text" hidden value="<c:out value="${reportes.descripcion}"/>">
							<input type="text" hidden value="<c:out value="${reportes.canalizacion}"/>">
							<td>
								<button type="button" class="btn btn-sm bg-primary btn-block text-white" data-toggle="modal" data-target="#staticBackdrop"
								        onclick="mostrarDatos(<c:out value="${reportes.folio}"/>, '<c:out value="${reportes.fecha}"/>', '<c:out value="${reportes.matricula}"/>','<c:out value="${reportes.CCT}"/>', '<c:out value="${reportes.nombre}"/> <c:out value="${reportes.apellido1}"/> <c:out value="${reportes.apellido2}"/>','<c:out value="${reportes.motivo}"/>', '<c:out value="${reportes.descripcion}"/>', '<c:out value="${reportes.canalizacion}"/>')">
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
										<path fill-rule="evenodd" d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
									</svg>
								</button>
							</td>
						</tr>
						</c:forEach>
						</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
	     aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Reporte detallado del estudiante</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="form-group col-md-6">
							<label for="eFolio" class=" col-form-label">Folio:</label>
							<input type="number" class="form-control" id="eFolio" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="eFecha" class=" col-form-label">Fecha:</label>
							<input type="date" class="form-control" id="eFecha" readonly>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-6">
							<label for="eMatricula" class=" col-form-label">Matrícula:</label>
							<input type="text" class="form-control" id="eMatricula" readonly>
						</div>

						<div class="form-group col-md-6">
							<label for="eCCT" class=" col-form-label">CCT:</label>
							<input type="text" class="form-control" id="eCCT" readonly>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label for="eNombreCompleto" class="col-form-label">Nombre completo:</label>
							<input type="text" class="form-control" id="eNombreCompleto" readonly>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label for="eMotivo" class="col-form-label">Motivo:</label>
							<input type="text" class="form-control" id="eMotivo" readonly>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label for="eDescrpcion" class="col-form-label">Descipción:</label>
							<textarea class="form-control" id="eDescrpcion" rows="2" readonly></textarea>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label for="eCanalizacion" class="col-form-label">Canalización:</label>
							<textarea class="form-control" id="eCanalizacion" rows="2" readonly></textarea>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
					<%--<button type="button" class="btn btn-primary">Understood</button> --%>
				</div>
			</div>
		</div>
	</div>

</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<script>

	function mostrarDatos(a, b, c, d, e, f, g, h) {
		console.log(a, b, c, d, e, f, g, h);
		document.getElementById("eFolio").value = a;
		document.getElementById("eFecha").value = b;
		document.getElementById("eMatricula").value = c;
		document.getElementById("eCCT").value = d;
		document.getElementById("eNombreCompleto").value = e;
		document.getElementById("eMotivo").value = f;
		document.getElementById("eDescrpcion").value = g;
		document.getElementById("eCanalizacion").value = h;
	}

	function pregunta() {
		Swal.fire({
			title: '¿Reportar estudiante?',
			text: "Los cambios son irreversibles!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#6c757d',
			cancelButtonColor: '#3085d6',
			confirmButtonText: 'Si, Realizar!'
		}).then((result) => {
			if (result.value) document.getElementById("enviarForm").click();
		})
	}
</script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>