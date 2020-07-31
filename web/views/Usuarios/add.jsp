<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:13 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Cuentas</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Añadir registro</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper"><!-- no quitar este contenedor -->
    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)   -->

    <div class="container jumbotron text-center bg-white" >

        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>

	    <div class="row">
		    <div class="col-md">
			    <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Cuenta de usuario</b></p>
		    </div>
	    </div>
        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet">

	        <div  class="row form-group col-md-4 d-inline-flex">
		        <input name="cct" class="form-control text-center" maxlength="15" type="text" placeholder="CCT" required>
	        </div>
	        <br>
            <div class="row form-group d-inline-flex">
                <div class="col-md">
                    <input name="nombre" type="text" class="form-control text-center" maxlength="30" placeholder="Nombre(s)" required>
                </div>
                <div class="col-md">
                    <input name="apellido1" type="text" class="form-control text-center" maxlength="15" placeholder="Primer Apellido" required>
                </div>
                <div class="col-md">
                    <input name="apellido2" type="text" class="form-control text-center" maxlength="15" placeholder="Segundo Apellido">
                </div>
            </div>
	        <br>
            <div class="d-inline-flex p-3 bd-highlight">
                <div class="form-check form-check-inline">
                    <label class="form-check-label text-secondary"><b>Cargo:</b></label>
                </div>
                <div class="form-check form-check-inline" id="ctrDirector5">
                    <input class="form-check-input" type="radio" name="rol" id="director" value="Director" required>
                    <label class="form-check-label" for="director">Director</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rol" id="docente" value="Docente" checked>
                    <label class="form-check-label" for="docente">Docente</label>
                </div>
            </div>
	        <br>
	        <div class="d-inline-flex row form-group">
		        <div  class="col-md">
			        <input name="correo" class="form-control text-center" type="email" maxlength="30" placeholder="Correo electrónico" >
		        </div>
		        <div  class="col-md">
			        <input name="password" class="form-control text-center " type="text" maxlength="20" placeholder="Contraseña" required>
		        </div>
	        </div>

	        <div class="row d-flex justify-content-center">
		        <div class="col-md-4">
			        <button type="submit" class="btn bg-danger btn-block text-white " name="accion" value="add"><b>Registrar</b></button>
		        </div>

            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>