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
		<li class="breadcrumb-item">Información Personal</li>
		<li class="breadcrumb-item" aria-current="page"><b>Actualizar Datos</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper"><!-- no quitar este contenedor -->
	<div class="container">
		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
		<div class="row">
			<div class="col-md">
				<p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Búsqueda de Registro</b></p>
			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<form action="<%=request.getContextPath()%>/PersonalServlet" method="post">
				<div class="row form-group">
					<div class="col">
						<input type="text" class="form-control text-center" placeholder="Matrícula" maxlength="15"
						       name="matricula" required>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn bg-danger btn-block text-white" name="listener"
						        value="buscar:2"><b>Buscar</b></button>
					</div>
				</div>
			</form>
		</div>

		<form method="post" action="<%=request.getContextPath()%>/PersonalServlet" enctype="multipart/form-data">
			<c:forEach var="alumno" items="${alumnoLista}">

				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Foto estudiante</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="custom-file">
									<input accept="image/*" type="file" name="foto" id="foto" class="form-control">
								</div>
								<img src="<%=request.getContextPath()%>/PersonalServlet?matFoto=<c:out value="${alumno.matricula}"></c:out>" class="img-fluid rounded mx-auto d-block" alt="Foto imagen estudiante"></td>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
							</div>
						</div>
					</div>
				</div>




				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos estudiante</b>
						</p>
					</div>
				</div>


				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<button type="button" class="btn btn-block btn-outline-danger" data-toggle="modal"
						        data-target="#exampleModal">Cambiar foto
						</button>
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center" placeholder="Matrícula"
						       name="matricula" required maxlength="15" value="<c:out value="${alumno.matricula}"></c:out>" readonly>
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center" placeholder="CURP"
						       name="curp" value="<c:out value="${alumno.curp}"></c:out>" maxlength="18" required>
					</div>
				</div>

				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)"
						       name="nombre" required maxlength="30" value="<c:out value="${alumno.nombre}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Primer apellido" name="apellido1" required maxlength="15"
						       value="<c:out value="${alumno.apellido1}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Segundo apellido" name="apellido2" maxlength="15"
						       value="<c:out value="${alumno.apellido2}"></c:out>">
					</div>
					<div class="col-md">
						<label>Género:</label>
						<c:if test="${alumno.genero == 'Hombre'}">
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline1" name="genero1" value="Hombre"
								       class="form-check-input" required checked>
								<label class="form-check-label" for="customRadioInline1">Hombre</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline2" name="genero1" value="Mujer"
								       class="form-check-input">
								<label class="form-check-label" for="customRadioInline2">Mujer</label>
							</div>
						</c:if>
						<c:if test="${alumno.genero == 'Mujer'}">
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline1" name="genero1" value="Hombre"
								       class="form-check-input" required>
								<label class="form-check-label" for="customRadioInline1">Hombre</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline2" name="genero1" value="Mujer"
								       class="form-check-input" checked>
								<label class="form-check-label" for="customRadioInline2">Mujer</label>
							</div>
						</c:if>

					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<label>Fecha de nacimiento:</label>
					<div class="col-md">
						<input type="date" class="form-control form-control-sm text-center"
						       placeholder="Fecha" value="<c:out value="${alumno.fechaNacimiento}"></c:out>"
						       name="fechaDeNacimeinto" required>
					</div>

					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Teléfono" name="telefono" required maxlength="10"
						       value="<c:out value="${alumno.telefono}"></c:out>">
					</div>
					<div class="col-md">
						<input type="email" class="form-control form-control-sm text-center"
						       placeholder="Correo electrónico" name="correo" maxlength="30"
						       value="<c:out value="${alumno.correo}"></c:out>">
					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<label>Ciclo escolar:</label>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Ciclo Escolar" name="cicloEscolar"
						       value="<c:out value="${alumno.cicloEscolar}"></c:out>">
					</div>

					<label>Nivel educativo actual:</label>
					<div class="col-md">
						<select class="custom-select" name="seleccion" required>
							<option selected><c:out value="${alumno.nivelActual}"></c:out></option>
							<option>Primaria</option>
							<option>Secundaria</option>
						</select>
					</div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Domicilio</b></p>
				</div>
			</div>
			<c:forEach var="domicilio" items="${domicilioLista}">
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md-6">
						<input type="text" class="form-control form-control-sm text-center" placeholder="Calle"
						       name="calle" required maxlength="30" value="<c:out value="${domicilio.calle}"></c:out>">
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="No.Int" name="interior" maxlength="5"
						       value="<c:out value="${domicilio.noInterior}"></c:out>">
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="No.Ext" name="exterior" maxlength="5"
						       value="<c:out value="${domicilio.noExterior}"></c:out>">
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Código postal" name="codigoPostal" required maxlength="5"
						       value="<c:out value="${domicilio.codigoPostal}"></c:out>">
					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Colonia" name="colonia" required maxlength="30"
						       value="<c:out value="${domicilio.colonia}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Municipio" name="municipio" required maxlength="30"
						       value="<c:out value="${domicilio.municipio}"></c:out>">
					</div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos tutor</b></p>
				</div>
			</div>
			<c:forEach var="tutor" items="${tutorLista}">
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Nombre(s)" name="tutorNombre" required maxlength="30"
						       value="<c:out value="${tutor.nombre}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Primer apellido" name="tutorApellido1" required maxlength="15"
						       value="<c:out value="${tutor.apellido1}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Segundo apellido"
						       name="tutorApellido2" maxlength="15"
						       value="<c:out value="${tutor.apellido2}"></c:out>">
					</div>
					<div class="col-md">
						<label>Género</label>
						<c:if test="${tutor.genero == 'Hombre'}">
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline3" name="genero2" value="Hombre"
								       class="form-check-input" required checked>
								<label class="form-check-label" for="customRadioInline3">Hombre</label>
							</div>
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline4" name="genero2" value="Mujer"
								       class="form-check-input">
								<label class="form-check-label" for="customRadioInline4">Mujer</label>
							</div>
						</c:if>
						<c:if test="${tutor.genero == 'Mujer'}">
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline3" name="genero2" value="Hombre"
								       class="form-check-input" required>
								<label class="form-check-label" for="customRadioInline3">Hombre</label>
							</div>
							<div class="form-check form-check-inline">
								<input type="radio" id="customRadioInline4" name="genero2" value="Mujer"
								       class="form-check-input" checked>
								<label class="form-check-label" for="customRadioInline4">Mujer</label>
							</div>
						</c:if>
					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<input type="email" class="form-control form-control-sm text-center"
						       placeholder="Correo electrónico" name="tutorCorreo" maxlength="30"
						       value="<c:out value="${tutor.correo}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Teléfono personal"
						       name="tutorTelefono" required maxlength="10"
						       value="<c:out value="${tutor.telefonoPersonal}"></c:out>">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Teléfono del trabajo"
						       name="tutorTelTrabajo" maxlength="10"
						       value="<c:out value="${tutor.telefonoTrabajo}"></c:out>">
					</div>
				</div>

			</c:forEach>
			<br>
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white">
						<b>Actualizar</b></button>
					<button id="enviarForm" type="submit" name="listener" value="actualizar" hidden></button>
				</div>
			</div>

		</form>

	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<script>
	function pregunta() {
		Swal.fire({title: '¿Realizar Acción?', text: "Los cambios son irreversibles!", icon: 'warning', showCancelButton: true, confirmButtonColor: '#6c757d', cancelButtonColor: '#3085d6', confirmButtonText: 'Si, Realizar!'
		}).then((result) => {
			if (result.value) {
				document.getElementById("enviarForm").click();
			}
		})
	}
</script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>