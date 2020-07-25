<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:22 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Personal</li>
		<li class="breadcrumb-item" aria-current="page"><b>Buscar Registro</b></li>
	</ol>
</nav>

<div class="d-flex justify-content-start mx-auto" style="width: 100%" id="page-content-wrapper">
	<!-- no quitar este contenedor -->
	<form class="container" method="post" action="<%=request.getContextPath()%>/PersonalServlet">
		<div style="padding: 1%"></div>
		<div class="form-row justify-content-around">
			<div class="col-md-4 bg-gris text-center" style="border-radius: 7px;">
				<b style="color:white;">Datos del Estudiante</b>
			</div>
			<div class="col-md-7 bg-gris text-center" style="border-radius: 7px;">
				<b style="color:white">Datos del tutor</b>
			</div>
		</div>
		<div class="form-row justify-content-around">
			<div class="col-md-4">
				<div>
					<div style="padding: 2%"></div>
					<div class="form-row justify-content-center">
						<img src="${pageContext.request.contextPath}/assets/img/user5.png"
						     style="width: 40%;height: 100%">
					</div>
					<div>
						<div style="padding: 1%"></div>
						<input type="text" class="form-control form-control-sm text-center" placeholder="Matrícula" name="matricula">
					</div>
					<div style="padding: 2%"></div>
					<div class="form-row justify-content-center">
						<button type="submit" class="btn btn-primary bg-danger" name="listener" value="buscar:3" style="width: 50%">Buscar</button>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div style="padding: 1%"></div>
				<div class="table-responsive">
					<table class="table table-sm table-hover">
						<tbody>
						<c:forEach var="tutor" items="${tutorLista}">
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Nombre</td>
							<td><c:out value="${tutor.nombre}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Primer apellido</td>
							<td><c:out value="${tutor.apellido1}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Segundo apellido</td>
							<td><c:out value="${tutor.apellido2}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Teléfono personal</td>
							<td><c:out value="${tutor.telefonoPersonal}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Teléfono de Trabajo</td>
							<td><c:out value="${tutor.telefonoTrabajo}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Correo</td>
							<td><c:out value="${tutor.correo}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secondary">Género</td>
							<td><c:out value="${tutor.genero}"></c:out></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div style="padding: 1%"></div>
		<div class="form-row justify-content-around">
			<div class="col-12 bg-gris text-center" style="border-radius: 7px;">
				<b style="color:white">Datos del alumno</b>
			</div>
		</div>
		<div class="col-md-12">
			<div style="padding: 1%"></div>
			<div>
				<div class="form-row justify-content-center">
					<div class="col-md-6">
						<div class="table-responsive">
							<table class="table table-sm table-hover">
							<tbody>
								<c:forEach var="alumno" items="${alumnoLista}">
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Matrícula</td>
									<td><c:out value="${alumno.matricula}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Curp</td>
									<td><c:out value="${alumno.curp}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Nombre</td>
									<td><c:out value="${alumno.nombre}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Primer apellido</td>
									<td><c:out value="${alumno.apellido1}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Segundo apellido</td>
									<td><c:out value="${alumno.apellido2}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Fecha de nacimiento</td>
									<td><c:out value="${alumno.fechaNacimiento}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Teléfono</td>
									<td><c:out value="${alumno.telefono}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Correo</td>
									<td><c:out value="${alumno.correo}"></c:out></td>
								</tr>
									<tr>
										<td scope="row" class="font-italic text-left text-secondary">Género</td>
										<td><c:out value="${alumno.genero}"></c:out></td>
									</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Ciclo escolar</td>
									<td><c:out value="${alumno.cicloEscolar}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Nivel actual</td>
									<td><c:out value="${alumno.nivelActual}"></c:out></td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="col-md-6">
						<div class="table-responsive">
							<table class="table table-sm table-hover">
								<tbody>
								<c:forEach var="domicilio" items="${domicilioLista}">
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Calle</td>
									<td><c:out value="${domicilio.calle}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Noº Interior</td>
									<td><c:out value="${domicilio.noInterior}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Noº Exterior</td>
									<td><c:out value="${domicilio.noExterior}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Colonia</td>
									<td><c:out value="${domicilio.colonia}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">municipio</td>
									<td><c:out value="${domicilio.municipio}"></c:out></td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secondary">Código postal</td>
									<td><c:out value="${domicilio.codigoPostal}"></c:out></td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>