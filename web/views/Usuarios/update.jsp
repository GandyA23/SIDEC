<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<%
    HttpSession sesionActiva = request.getSession();
    LoginBean usuarioWeb = (LoginBean)sesionActiva.getAttribute("UsuarioActivo");
    switch (usuarioWeb.getRol()){
    case "Administrador": %> <jsp:include page="/views/layout/nav.jsp"></jsp:include> <% break;
    case "Director": %> <jsp:include page="/views/layout/navDirector.jsp"></jsp:include><% break;
}
%>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Cuentas</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Actualizar Datos</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper"><!-- no quitar este contenedor -->
    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="container jumbotron text-center bg-white" >
        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>

        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Búsqueda de registro</b></p>
            </div>
        </div>
            <form class="form-inline" action="<%=request.getContextPath()%>/UsuarioServlet" method="post">
                <div class="form-group mx-auto">
                    <div class="col">
                        <input type="text" class="form-control text-center" id="inputPassword2" name="cct" placeholder="CCT" maxlength="15" required>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-danger btn-block" name="accion" value="search:2"><b>Búscar</b></button>
                    </div>
                </div>
            </form>
        <br>
        <div class="bg-gris text-white text-center"style="border-radius: 7px" ><b>Cuenta de usuario</b></div> <br>
	    <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
            <c:forEach var="usuarios" items="${usuariosList}">

                <div class="row form-group d-inline-flex">
                <div class="col-md">
                    <input id="valorLleno" type="text" class="form-control text-center" value="<c:out value="${usuarios.cct}"/>" placeholder="Matrícula" readonly>
                </div>
                <div class="col-md">
                    <input type="text" class="form-control text-center" value="<c:out value="${usuarios.nombre}"/>" maxlength="30" name="nombre" placeholder="Nombre (s)" required>
                </div>
                <div class="col-md">
                    <input type="text" class="form-control text-center " value="<c:out value="${usuarios.apellido1}"/>" maxlength="15" name="apellido1" placeholder="Primer Apellido" required>
                </div>
                <div class="col-md">
                    <input type="text" class="form-control text-center " value="<c:out value="${usuarios.apellido2}"/>" maxlength="15" name="apellido2" placeholder="Segundo Apellido">
                </div>
            </div>

            <div  class="d-inline-flex p-3 bd-highlight">
                <div class="form-check form-check-inline">
                    <label class="form-check-label text-secondary"><b>Cargo:</b> </label>
                </div>

                <c:if test="${usuarios.rol == 'Director'}">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="ctrDirector5" value="Director" checked>
                        <label class="form-check-label" for="ctrDirector5">Director</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="docente" value="Docente" >
                        <label class="form-check-label" for="docente">Docente</label>
                    </div>
                </c:if>
                <c:if test="${usuarios.rol == 'Docente'}">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="ctrDirector5" value="Director">
                        <label   class="form-check-label" for="ctrDirector5">Director</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="docente" value="Docente" checked>
                        <label class="form-check-label" for="docente">Docente</label>
                    </div>
                </c:if>
                <c:if test="${usuarios.rol == 'Administrador'}">
                    <div class="form-check form-check-inline">
                        <input type="text" class="form-control text-center" value="Administrador" name="rol" readonly>
                    </div>
                </c:if>
            </div>
            <br>
                <div class="d-inline-flex row form-group">
                    <div  class="col-md">
                        <input class="form-control text-center " type="text" value="<c:out value="${usuarios.correo}"/>" name="correo" placeholder="Correo electrónico" required>
                    </div>

                    <div  class="col-md">
                        <input class="form-control text-center " type="text" value="<c:out value="${usuarios.password}"/>" name="password" placeholder="Contraseña" required>
                    </div>
                </div>
            </c:forEach>

            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <button id="btnControl" onclick="preguntaModificar()" type="button" class="btn bg-danger btn-block text-white" disabled><b>Actualizar</b> </button>
                    <button id="enviarForm" type="submit" name="accion" hidden value="update"></button>
                </div>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moduloUsuarios.js"> </script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>