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

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Cuentas</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Añadir registro</b></li>
    </ol>
</nav>

<div id="page-content-wrapper"><!-- no quitar este contenedor -->
    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)   -->

    <div class="jumbotron text-center bg-white" >
        <div class=" bg-secondary text-white" style="border-radius: 7px"><b>Cuenta de usuario</b></div> <br>
        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet">
            <div  class="d-inline-flex p-3 bd-highlight">
                <input name="cct" class="form-control text-center " type="text" placeholder="CCT">
            </div>
            <div class="row">
                <div class="col">
                    <input name="nombre" type="text" class="form-control text-center " placeholder="Nombre (s)">
                </div>
                <div class="col">
                    <input name="apellido1" type="text" class="form-control text-center " placeholder="Primer Apellido">
                </div>
                <div class="col">
                    <input name="apellido2" type="text" class="form-control text-center " placeholder="Segundo Apellido">
                </div>
            </div>
            <div  class="d-inline-flex p-3 bd-highlight">
                <div class="form-check form-check-inline">
                    <label class="form-check-label text-secondary"><b>Cargo:</b> </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rol" id="radDirector" value="Director">
                    <label class="form-check-label" for="radDirector">Director</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rol" id="docente" value="Docente" checked>
                    <label class="form-check-label" for="docente">Docente</label>
                </div>
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input name="correo" class="form-control text-center " type="text" placeholder="Correo electrónico">
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input name="password" class="form-control text-center " type="password" placeholder="Contraseña">
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight">
                <button type="submit" class="btn btn-danger" style="width: 150px" name="accion" value="add">Registrar</button>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>