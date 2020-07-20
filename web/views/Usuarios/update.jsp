<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:13 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Cuentas</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Actualizar Datos</b></li>
    </ol>
</nav>

<div id="page-content-wrapper"><!-- no quitar este contenedor -->
    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="jumbotron text-center bg-white" >
        <div class="mx-auto" style="width: 35%;">
            <div class=" bg-secondary text-white text-center row-center" style="border-radius: 7px;"><b>Búsqueda de registro</b></div> <br>


            <form class="form-inline" action="<%=request.getContextPath()%>/UsuarioServlet" method="post">
                <div class="form-group mx-auto">
                    <input type="text" class="form-control text-center" name="cct" id="inputPassword2" placeholder="CCT">
                </div>
                <div class="form-group mx-auto" style="width: 40%;">
                    <button type="submit" class="btn btn-danger btn-block" name="accion" value="search:2">BUSCAR</button>
                </div>
            </form>

        </div>
        <br>
        <div class="bg-secondary text-white "style="border-radius: 7px" ><b>Cuenta de usuario</b></div> <br>
        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
            <c:forEach var="usuarios" items="${usuariosList}">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control text-center" value="<c:out value="${usuarios.nombre}"/>" name="nombre" placeholder="Nombre (s)">
                </div>
                <div class="col">
                    <input type="text" class="form-control text-center " value="<c:out value="${usuarios.apellido1}"/>" name="apellido1" placeholder="Primer Apellido">
                </div>
                <div class="col">
                    <input type="text" class="form-control text-center " value="<c:out value="${usuarios.apellido2}"/>" name="apellido2" placeholder="Segundo Apellido">
                </div>
            </div>


            <div  class="d-inline-flex p-3 bd-highlight">
                <div class="form-check form-check-inline">
                    <label class="form-check-label text-secondary"><b>Cargo:</b> </label>
                </div>

                <c:if test="${usuarios.rol == 'Director'}">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="radDirector" value="Director"checked>
                        <label class="form-check-label" for="radDirector">Director</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="docente" value="Docente" >
                        <label class="form-check-label" for="docente">Docente</label>
                    </div>
                </c:if>

                <c:if test="${usuarios.rol == 'Docente'}">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="radDirector" value="Director">
                        <label class="form-check-label" for="radDirector">Director</label>
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
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input class="form-control text-center " type="text" value="<c:out value="${usuarios.correo}"/>" name="correo" placeholder="Correo electrónico">
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input class="form-control text-center " type="text" value="<c:out value="${usuarios.password}"/>" name="password" placeholder="Contraseña">
            </div>
            </c:forEach>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight">
                <button type="submit" class="btn btn-danger " style="width: 150px" name="accion" value="update">Actualizar</button>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>