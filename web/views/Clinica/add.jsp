<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<li class="breadcrumb-item">Información Clínica</li>
		<li class="breadcrumb-item" aria-current="page"> <b>Añadir Registro</b> </li>
	</ol>
</nav>

<div class="container" id="page-content-wrapper">
	<!-- no quitar este contenedor -->
	<!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
	<div class="container">
		<button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
		<form action="${pageContext.request.contextPath}/ClinicaServlet" method="post">
			<br>
			<div class="row">
				<div class="col-md">
					<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos Clínicos</b></p>
				</div>
			</div>

			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<input type="text" id="mat" name="matricula" class="form-control  text-center"
					       maxlength="15" placeholder="Matrícula" required>
				</div>
				<div class="col-md">
					<input type="text" name="numeroSeguro" class="form-control  text-center"
					       maxlength="20" placeholder="Número Seguro Médico" required>
				</div>
				<div class="col-md">
					<input type="text" name="unidadMedica" class="form-control  text-center" placeholder="Unidad médica"
					       maxlength="10" required>
				</div>
			</div>
			<br>
			<div class="row form-group col-md d-inline-flex">
				<div class="col-md">
					<select name="tipoSangre" class="form-control" required>
						<option selected>Tipo de sangre</option>
						<option>A+</option>
						<option>A-</option>
						<option>O+</option>
						<option>O-</option>
						<option>B+</option>
						<option>B-</option>
						<option>AB+</option>
						<option>AB-</option>
					</select>
				</div>
				<div class="col-md">
					<input type="number" min="0" step="any" name="peso" class="form-control  text-center"
					       placeholder="Peso" required>
				</div>
				<div class="col-md">
					<input type="number" min="0" step="any" name="estatura" class="form-control  text-center"
					       placeholder="Estatura" required>
				</div>
			</div>
			<div class="row form-group col-md d-inline-flex">
				<div class="col">
					<textarea class="form-control" name="diagPsico" rows="2"
					          placeholder="Diagnóstico psicopedagógico"></textarea>
				</div>
			</div>
			<div class="container-fluid text-center">
				<div class="row">
					<div class="col-md">
						<p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Enfermedades</b></p>
					</div>
				</div>
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<label>Crónicas:</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" onclick="habilitaRadio('selectCronica', 'areaCronica', true)" name="opc_cronica" id="inlineRadio1"
							       value="si_cronica" required>
							<label class="form-check-label" for="inlineRadio1">Si</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" onclick="habilitaRadio('selectCronica', 'areaCronica', false)" name="opc_cronica" id="inlineRadio2"
							       value="no_cronica" checked>
							<label class="form-check-label" for="inlineRadio2">No</label>
						</div>

						<div class="col-md">
							<select name="enferCronicas1" id="selectCronica" readonly class="form-control">
								<option selected>Seleccione</option>
								<option>Cardiovasculares</option>
								<option>Diabetes</option>
								<option>Párkinson</option>
								<option>Alzheimer</option>
								<option>Hipertensión</option>
								<option>Osteoporosis</option>
								<option>Colesterol</option>
								<option>Depresión</option>
								<option>Cáncer</option>
								<option>Otro</option>
							</select>
						</div>
						<div class="col-md">
							<textarea class="form-control" id="areaCronica" name="enferCronicas2" rows="2" placeholder="Descripción:" readonly></textarea>
						</div>
					</div>

					<div class="col-md">
						<label>Hereditarias:</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="opc_hereditaria" onclick="habilitaRadio('selectHereditaria', 'areaHereditaria', true)" id="inlineRadio3"
							       value="si_hereditaria" required>
							<label class="form-check-label" for="inlineRadio3">Si</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" onclick="habilitaRadio('selectHereditaria', 'areaHereditaria', false)" name="opc_hereditaria" id="inlineRadio4"
							       value="no_hereditaria" checked>
							<label class="form-check-label" for="inlineRadio4">No</label>
						</div>

						<div class="col-md">
							<select name="enferHereditarias1" id="selectHereditaria" class="form-control" readonly>
								<option selected>Seleccione</option>
								<option>Anemia</option>
								<option>Daltonismo</option>
								<option>Diabetes</option>
								<option>Miopía</option>
								<option>Síndrome de Marfan</option>
								<option>Cáncer</option>
								<option>Otro</option>
							</select>
						</div>
						<div class="col-md">
                  <textarea class="form-control" name="enferHereditarias2"
                            rows="2" id="areaHereditaria" placeholder="Descripción:" readonly ></textarea>
						</div>
					</div>
				</div>
				<br>
				<div class="row form-group col-md d-inline-flex">
					<div class="col-md">
						<label>Alergías:</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="opc_alergias" onclick="habilitaRadio('selectAlergias', 'areaAlergias', true)" id="inlineRadio5"
							       value="si_alergias" required>
							<label class="form-check-label" for="inlineRadio5">Si</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="opc_alergias" id="inlineRadio6"
							       value="no_alergias" onclick="habilitaRadio('selectAlergias', 'areaAlergias', false)" checked>
							<label class="form-check-label" for="inlineRadio6">No</label>
						</div>

						<div class="col-md">
							<select name="alergias1" id="selectAlergias" class="form-control" readonly>
								<option selected>Seleccione</option>
								<option>Ácaros</option>
								<option>Polen</option>
								<option>Pelo de Animales</option>
								<option>Picaduras Insectos</option>
								<option>Moho</option>
								<option>Látex</option>
								<option>Alimentos</option>
								<option>Fragancias</option>
								<option>Otro</option>
							</select>
						</div>
						<div class="col-md">
                  <textarea class="form-control" id="areaAlergias" name="alergias2" rows="2"
                            placeholder="Descripción:" readonly></textarea>
						</div>
					</div>
					<div class="col-md">
						<label>Discapacidad:</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="opc_discapacidad" onclick="habilitaRadio('inputState', 'exampleFormControlTextarea1', true)" id="inlineRadio7"
							       value="si_discapacidad" required>
							<label class="form-check-label" for="inlineRadio7">Si</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="opc_discapacidad" id="inlineRadio8"
							       value="no_discapacidad" onclick="habilitaRadio('inputState', 'exampleFormControlTextarea1', false)" checked>
							<label class="form-check-label" for="inlineRadio8">No</label>
						</div>

						<div class="col-md">
							<select name="discapacidades1" id="inputState" class="form-control" readonly>
								<option selected>Seleccione</option>
								<option>Física</option>
								<option>Psíquica</option>
								<option>Sensorial</option>
								<option>Intelectual o Mental</option>
								<option>Otro</option>
							</select>
						</div>
						<div class="col-md">
							<textarea class="form-control" name="discapacidades2" id="exampleFormControlTextarea1"
							          rows="2" placeholder="Descripción:" readonly></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-md-4">
					<button type="submit" class="btn bg-danger btn-block text-white " name="accion"
					        value="add"><b>Registrar</b></button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- no quitar este contenedor -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>