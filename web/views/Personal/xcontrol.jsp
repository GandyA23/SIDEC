<%--
  Created by IntelliJ IDEA.
  User: Hector Saldaña
  Date: 16/07/2020
  Time: 07:39 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Control</li>
		<li class="breadcrumb-item" aria-current="page"><b>Estudiantes</b></li>
	</ol>
</nav>

<div style="width: 100%" id="page-content-wrapper">
	<!-- no quitar este contenedor -->
	<nav>
		<div class="nav nav-tabs " id="nav-tab" role="tablist">
			<a class="nav-item nav-link text-danger active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
			   role="tab"
			   aria-controls="nav-home" aria-selected="true"> <b>Búsqueda rápida</b> </a>

			<a class="nav-item nav-link text-danger" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
			   role="tab"
			   aria-controls="nav-profile" aria-selected="false"><b>Eliminados</b></a>
		</div>
	</nav>

	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<div class="container">
				<br>
				<h2>Búsqueda Estudiantes</h2>
				<h6>Puedes buscar por matricula, nombre o apellidos.</h6>
				<hr class="my-3">
				<table class="table table-sm table-hover text-center display responsive nowrap" width="100%"
				       id="tablaActivos">
					<thead class="thead-light">
					<tr>
						<th scope="col">Matricula</th>
						<th scope="col">Nombre</th>
						<th scope="col">Primer apellido</th>
						<th scope="col">Segundo apellido</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="est" items="${listEstudianteActivo}">
						<tr>
							<td><c:out value="${est.matricula}"></c:out></td>
							<td><c:out value="${est.nombre}"></c:out></td>
							<td><c:out value="${est.apellido1}"></c:out></td>
							<td><c:out value="${est.apellido2}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			<div class="container">
				<br>
				<h2>Estudiantes Eliminados</h2>
				<h6>Da click en el botón del registro del alumno para activarlo.</h6>
				<hr class="my-3">

				<table class="table table-sm table-hover text-center display responsive nowrap" width="100%"
				       id="tablaDesactivos">
					<thead class="thead-light">
					<tr>
						<th scope="col">Matricula</th>
						<th scope="col">Nombre</th>
						<th scope="col">Primer apellido</th>
						<th scope="col">Segundo apellido</th>
						<th scope="col">Activar</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="est" items="${listEstudianteDesactivo}">
							<tr>
								<td><c:out value="${est.matricula}"></c:out></td>
								<td><c:out value="${est.nombre}"></c:out></td>
								<td><c:out value="${est.apellido1}"></c:out></td>
								<td><c:out value="${est.apellido2}"></c:out></td>
								<td>
										<%--
										<a  class="btn btn-sm bg-danger btn-block text-white" href="${pageContext.request.contextPath}/ListaEstudiantesServlet?matricula=<c:out value="${est.matricula}"></c:out>">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
										</svg>
										</a>
										--%>
									<button onclick="pregunta(`<c:out value="${est.matricula}"></c:out>`)" class="btn btn-sm bg-danger btn-block text-white">
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
										</svg>
									</button>
									<a id="enviarForm" hidden></a>
								</td>
						</form>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div> <!-- no quitar este contenedor -->
<script>
	function pregunta(a) {
		document.getElementById("enviarForm").href = "${pageContext.request.contextPath}/ListaEstudiantesServlet?matricula="+a+"";
		Swal.fire({
			title: '¿Realizar Acción?',
			text: "Los cambios son irreversibles!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#6c757d',
			cancelButtonColor: '#3085d6',
			confirmButtonText: 'Si, Realizar!'
		}).then((result) => {
			if (result.value) {
				Swal.fire(
					'Realizado!',
					'Se efectuo la acción',
					'success'
				)
				setTimeout(function () {
					document.getElementById("enviarForm").click();
				}, 1000)
			}
		})
	}
</script>


<jsp:include page="/views/layout/footer.jsp"></jsp:include>