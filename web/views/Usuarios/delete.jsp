<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:13 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Cuentas</li>
		<li class="breadcrumb-item" aria-current="page"><b>Eliminar registro</b></li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper" ><!-- no quitar este contenedor -->

	<!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
	<div class="container jumbotron text-center bg-white">

		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
		<div class="row">
			<div class="col-md">
				<p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Búsqueda de registro</b></p>
			</div>
		</div>
			<br>
			<form class="form-inline" method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
					<div class="form-group mx-auto">
						<div class="col">
							<input type="text" class="form-control text-center" id="inputPassword2" name="cct" placeholder="CCT" maxlength="15" required>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-danger btn-block" name="accion" value="search:1"><b>Búscar</b></button>
						</div>
					</div>
			</form>
		</div>
		<div class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Datos del usuario</b></div>
		<br>
			<table class="table table-hover">
				<tbody>
				<c:forEach var="usuarios" items="${usuariosList}">
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">CCT</td>
						<td name="cctBuscado"><c:out value="${usuarios.cct}"></c:out></td>
					</tr>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Nombre</td>
						<td><c:out value="${usuarios.nombre}"></c:out></td>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Primer Apellido</td>
						<td><c:out value="${usuarios.apellido1}"></c:out></td>
					</tr>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Segundo Apellido</td>
						<td><c:out value="${usuarios.apellido2}"></c:out></td>
					</tr>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Cargo</td>
						<td><c:out value="${usuarios.rol}"></c:out></td>
					</tr>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Correo electrónico</td>
						<td><c:out value="${usuarios.correo}"></c:out></td>
					</tr>
					<tr>
						<td scope="row" class="font-italic text-left text-secondary">Contraseña</td>
						<td>******<%--<c:out value="${usuarios.password}"></c:out>--%></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		<form action="<%=request.getContextPath()%>/UsuarioServlet" method="post">
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white"><b>Eliminar</b></button>
					<button id="enviarForm" type="submit" name="accion" hidden value="delete"></button>
				</div>
			</div>
		</form>
	</div>

</div>
<!-- no quitar este contenedor -->
<script>
	function pregunta() {
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