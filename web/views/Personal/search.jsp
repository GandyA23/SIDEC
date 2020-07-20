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

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">Información Personal</li>
		<li class="breadcrumb-item" aria-current="page"><b>Buscar Registro</b></li>
	</ol>
</nav>

<div class="d-flex justify-content-start mx-auto" style="width: 100%" id="page-content-wrapper">
	<!-- no quitar este contenedor -->
	<form class="container">
		<div style="padding: 1%"></div>
		<div class="form-row justify-content-around">
			<div class="col-md-4 bg-gris text-center" style="border-radius: 7px;">
				<b style="color:white;">Actualizar Estudiante</b>
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
						<button type="button" class="btn btn-primary bg-danger" name="listener" value="buscar" style="width: 50%">Buscar</button>
					</div>
				</div>
			</div>

			<div class="col-md-7">
				<div style="padding: 1%"></div>
				<div class="table-responsive">
					<table class="table table-sm">
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Nombre
							</th>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Apellido
								paterno
							</td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Apellido
								materno
							</td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Teléfono
								personal
							</td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Teléfono
								de trabajo
							</td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Correo
								electrónico
							</td>
						</tr>
						<tr>
							<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">Género
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
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
							<table class="table table-sm">
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Nombre
									</th>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Apellido paterno
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Apellido materno
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Curp
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Fecha de nacimiento
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Teléfono
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Correo electrónico
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Género
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</div>
					</div>

					<div class="col-md-6">
						<div class="table-responsive">
							<table class="table table-sm">
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Calle
									</th>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Número exterior
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Número interior
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Código postal
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Colonia
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Municipio
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Ciclo escolar
									</td>
								</tr>
								<tr>
									<td scope="row" class="font-italic text-left text-secundary" style="font-size: 80%">
										Nivel educativo
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
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