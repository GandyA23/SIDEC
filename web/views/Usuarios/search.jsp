<%@ page import="mx.edu.utez.model.bean.LoginBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <li class="breadcrumb-item" aria-current="page"> <b>Buscar registro</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper"><!-- no quitar este contenedor -->

    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="container jumbotron text-center bg-white" >
        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>

        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Búsqueda de registro</b></p>
            </div>
        </div>
            <form class="form-inline" method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
                <div class="form-group mx-auto">
                    <div class="col">
                        <input type="text" value="" onkeyup="this.value=quita(this.value, this.name)" class="form-control text-center" id="inputPassword2" name="cct" placeholder="CCT" maxlength="15" required>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-danger btn-block" name="accion" value="search:3"><b>Búscar</b></button>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <div class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos del usuario</b></div> <br>
        <table class="table table-hover">
            <tbody >
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
    </div>


</div><!-- no quitar este contenedor -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>