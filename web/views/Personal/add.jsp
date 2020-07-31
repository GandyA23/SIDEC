<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:22 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Personal</li>
		<li class="breadcrumb-item" aria-current="page"><b>Añadir Registro</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper"><!-- no quitar este contenedor -->
	<div class="container">
		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>

		<form method="post" action="<%=request.getContextPath()%>/PersonalServlet">
			<br>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos estudiante</b></p>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<button type="button" class="btn btn-block btn-outline-danger" data-toggle="modal" data-target="#exampleModal">Agregar foto</button>
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center" placeholder="Matrícula"
					       name="matricula" required maxlength="15">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center" placeholder="CURP"
					       name="curp" required maxlength="18">
				</div>
			</div>
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
								<input type="file" class="custom-file-input" id="customFileLang" lang="es">
								<label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
							</div>
							<img class="img-thumbnail" src="" alt="">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)"
					       name="nombre" required maxlength="30">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Primer apellido" name="apellido1" required maxlength="15">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Segundo apellido" name="apellido2" maxlength="15">
				</div>
				<div class="col-md">
					<label>Género:</label>
					<div class="form-check form-check-inline">
						<input type="radio" id="customRadioInline1" name="genero1" value="Hombre"
						class="form-check-input" required>
						<label class="form-check-label" for="customRadioInline1">Hombre</label>
					</div>

					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2" name="genero1" value="Mujer"
						       class="form-check-input">
						<label class="form-check-label" for="customRadioInline2">Mujer</label>
					</div>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<label>Fecha de nacimiento:</label>
					<div class="col-md">
						<input type="date" class="form-control form-control-sm text-center"
						       placeholder="Fecha" value="" name="fechaDeNacimeinto" required>
					</div>

				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Teléfono" name="telefono" required maxlength="10">
				</div>
				<div class="col-md">
					<input type="email" class="form-control form-control-sm text-center"
					       placeholder="Correo electrónico" name="correo" maxlength="30">
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<label>Ciclo escolar:</label>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Año inicio" name="añoInicio">
					</div>
					<div class="col-md">
						<input type="text" class="form-control form-control-sm text-center"
						       placeholder="Año fin" name="añoFin">
					</div>

					<label>Nivel educativo actual:</label>
					<div class="col-md">
						<select class="custom-select" name="seleccion" required>
							<option selected>Seleccione</option>
							<option>Primaria</option>
							<option>Secundaria</option>
						</select>
					</div>
			</div>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Domicilio</b></p>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md-6">
					<input type="text" class="form-control form-control-sm text-center" placeholder="Calle" name="calle" required maxlength="30">
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="No.Int" name="interior"  maxlength="5">
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="No.Ext" name="exterior"  maxlength="5">
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Código postal" name="codigoPostal" required maxlength="5">
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Colonia" name="colonia" required maxlength="30">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Municipio" name="municipio" required maxlength="30">
				</div>
			</div>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos tutor</b></p>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Nombre(s)" name="tutorNombre" required maxlength="30">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Primer apellido" name="tutorApellido1" required maxlength="15">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Segundo apellido" name="tutorApellido2"  maxlength="15">
				</div>
				<div class="col-md">
					<label>Género</label>
					<div class="form-check form-check-inline">
						<input type="radio" id="customRadioInline3" name="genero2" value="Hombre"
						       class="form-check-input" required>
						<label class="form-check-label" for="customRadioInline3">Hombre</label>
					</div>
					<div class="form-check form-check-inline">
						<input type="radio" id="customRadioInline4" name="genero2" value="Mujer"
						       class="form-check-input">
						<label class="form-check-label" for="customRadioInline4">Mujer</label>
					</div>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input type="email" class="form-control form-control-sm text-center"
					       placeholder="Correo electrónico" name="tutorCorreo" maxlength="30">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Teléfono personal" name="tutorTelefono" required maxlength="10">
				</div>
				<div class="col-md">
					<input type="text" class="form-control form-control-sm text-center"
					       placeholder="Teléfono del trabajo" name="tutorTelTrabajo" maxlength="10">
				</div>
			</div>
			<br>
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button type="submit" class="btn bg-danger btn-block text-white" name="listener" value="añadir"><b>Registrar</b></button>
				</div>
			</div>
		</form>



	</div>
</div>
<!-- no quitar este contenedor -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>