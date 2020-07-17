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
			<a class="nav-item nav-link text-danger active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
			   aria-controls="nav-home" aria-selected="true"> <b>Búsqueda rápida</b> </a>
			<a class="nav-item nav-link text-danger" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
			   aria-controls="nav-profile" aria-selected="false"><b>Eliminados</b></a>
		</div>
	</nav>

	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">

			<div class="container">
				<br>
				<div class="row form-group">
					<div class="col">
						<input type="text" name="matricula" class="form-control  text-center" placeholder="Matricula, Nombre o Apellido">
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn bg-danger btn-block text-white"><b>Buscar</b></button>
					</div>
				</div>
				<hr class="my-3">

				<table class="table">
					<thead class="thead-light">
					<tr>
						<th scope="col">Matricula</th>
						<th scope="col">Nombre</th>
						<th scope="col">Primer apellido</th>
						<th scope="col">Segundo apellido</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>the Bird</td>
						<td>@twitter</td>
					</tr>
					</tbody>
				</table>

			</div>
		</div>



		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			<div class="container">
				<br>
				<table class="table">
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
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td> <button type="button" class="btn btn-danger">Si</button> </td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
						<td> <button type="button" class="btn btn-danger">Si</button> </td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>the Bird</td>
						<td>@twitter</td>
						<td> <button type="button" class="btn btn-danger">Si</button> </td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>




</div>
</div><!-- no quitar este contenedor -->
<jsp:include page="/views/layout/footer.jsp"></jsp:include>