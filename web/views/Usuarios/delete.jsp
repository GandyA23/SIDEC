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

<div id="page-content-wrapper"><!-- no quitar este contenedor -->

	<!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
	<div class="jumbotron text-center bg-white">
		<div class="mx-auto" style="width: 35%;">
			<div class="bg-secondary text-white text-center row-center" style="border-radius: 7px;"><b>Búsqueda de
				registro</b></div>
			<br>
			<form class="form-inline" method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
				<div class="form-group mx-auto">
					<input type="text" class="form-control text-center" id="inputPassword2" name="cct"
					       placeholder="CCT" required>
				</div>
				<div class="form-group mx-auto" style="width: 40%;">
					<button type="submit" class="btn btn-danger btn-block" name="accion" value="search:1">BUSCAR</button>
				</div>
			</form>
		</div>
		<br>
		<div class="bg-secondary text-white" style="border-radius: 7px"><b>Datos del usuario</b></div>
		<br>
		<form action="<%=request.getContextPath()%>/UsuarioServlet" method="post">
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
						<td><c:out value="${usuarios.password}"></c:out></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div class="d-inline-flex p-2 bd-highlight">
				<button type="submit" class="btn btn-danger" style="width: 150px" name="accion" value="delete">
					Eliminar
				</button>
			</div>
		</form>
	</div>


</div>
<!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>