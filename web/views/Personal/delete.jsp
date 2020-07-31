<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:23 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Personal</li>
		<li class="breadcrumb-item" aria-current="page"><b>Eliminar Registro</b></li>
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
						<input type="text" class="form-control text-center" placeholder="Matrícula"  maxlength="15" name="matricula" required>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn bg-danger btn-block text-white" name="listener" value="buscar:1"><b>Buscar</b></button>
					</div>
				</div>
			</form>
			<div class="col-md-3">
				<button type="button" class="btn btn-block btn-outline-danger" data-toggle="modal" data-target="#exampleModal">Ver foto</button>
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
						<img class="img-thumbnail" src="" alt="">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md">
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Datos del estudiante</b></p>
					</div>
				</div>
				<table class="table font-italic text-dark table-hover">
					<tbody>
					<c:forEach var="alumno" items="${alumnoLista}">
						<tr>
							<td scope="row">Matrícula</td><td><c:out value="${alumno.matricula}"></c:out></td>
						</tr>
						<tr>
							<td scope="row">CURP</td><td><c:out value="${alumno.curp}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Nombre</td><td><c:out value="${alumno.nombre}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Primer apellido</td><td><c:out value="${alumno.apellido1}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Segundo apellido</td><td><c:out value="${alumno.apellido2}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Fecha de nacimiento</td><td><c:out value="${alumno.fechaNacimiento}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Teléfono</td><td><c:out value="${alumno.telefono}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Correo</td><td><c:out value="${alumno.correo}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Género</td><td><c:out value="${alumno.genero}"></c:out></td>
						</tr>
						<tr>
							<td scope="row"  >Ciclo escolar</td><td><c:out value="${alumno.cicloEscolar}"></c:out></td>
						</tr>
						<tr>
							<td scope="row"  >Nivel actual</td><td><c:out value="${alumno.nivelActual}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md">
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Datos del tutor</b></p>
					</div>
				</div>
				<table class="table font-italic text-dark table-hover">
					<tbody>
					<c:forEach var="tutor" items="${tutorLista}">
						<tr>
							<td scope="row">Nombre</td><td><c:out value="${tutor.nombre}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Primer apellido</td><td><c:out value="${tutor.apellido1}"></c:out></td>
						</tr>
						<tr>
							<td scope="row">Segundo apellido</td><td><c:out value="${tutor.apellido2}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Teléfono personal</td><td><c:out value="${tutor.telefonoPersonal}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Teléfono de trabajo</td><td><c:out value="${tutor.telefonoTrabajo}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Correo</td><td><c:out value="${tutor.correo}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Género</td><td><c:out value="${tutor.genero}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md">
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Datos de domicilio</b></p>
					</div>
				</div>
				<table class="table font-italic text-dark table-hover">
					<tbody>
					<c:forEach var="domicilio" items="${domicilioLista}">
						<tr>
							<td scope="row" >Calle</td><td><c:out value="${domicilio.calle}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Noº Interior</td><td><c:out value="${domicilio.noInterior}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Noº Exterior</td><td><c:out value="${domicilio.noExterior}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Colonia</td><td><c:out value="${domicilio.colonia}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Municipio</td><td><c:out value="${domicilio.municipio}"></c:out></td>
						</tr>
						<tr>
							<td scope="row" >Código postal</td><td><c:out value="${domicilio.codigoPostal}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<form method="post" action="<%=request.getContextPath()%>/PersonalServlet">
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white"><b>Eliminar</b></button>
					<button id="enviarForm" type="submit" name="listener" value="eliminar" hidden></button>
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
				Swal.fire('Realizado!', 'Se efectuo la acción', 'success')
				setTimeout(function () {document.getElementById("enviarForm").click();},1000)
			}
		})
	}
</script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>
