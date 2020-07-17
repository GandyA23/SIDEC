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
        <li class="breadcrumb-item" aria-current="page"> <b>Actualizar Datos</b></li>
    </ol>
</nav>

<div id="page-content-wrapper"><!-- no quitar este contenedor -->

    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="jumbotron text-center bg-white" >
        <div class="mx-auto" style="width: 35%;">
            <div class="bg-secondary text-white text-center row-center" style="border-radius: 7px;"><b>Búsqueda de registro</b></div> <br>
            <form class="form-inline">
                <div class="form-group mx-auto">
                    <input type="text" class="form-control text-center" id="inputPassword2" placeholder="CCT">
                </div>
                <div class="form-group mx-auto" style="width: 40%;">
                    <button type="submit" class="btn btn-danger btn-block" >BUSCAR</button>
                </div>
            </form>
        </div>
        <br>
        <div class="bg-secondary text-white " style="border-radius: 7px"><b>Datos del usuario</b></div> <br>
        <table class="table table-hover">
            <tbody >
            <tr>
                <td scope="row" class="font-italic text-left text-secondary" >Nombre</tr>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Apellido paterno</tr>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Apellido materno</tr>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Cargo</tr>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Correo electrónico</tr>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Contraseña</tr>
                <td ></td>
                </td>
            </tbody>
        </table>
    </div>


</div><!-- no quitar este contenedor -->


<jsp:include page="/views/layout/footer.jsp"></jsp:include>