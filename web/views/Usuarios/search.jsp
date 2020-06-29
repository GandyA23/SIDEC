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

<div id="page-content-wrapper"><!-- no quitar este contenedor -->

    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="jumbotron text-center bg-white" >
        <div class="mx-auto" style="width: 35%;">
            <div class="p-2 mb-2 bg-secondary text-white text-center row-center" style="border-radius: 7px;">Búsqueda de registro</div>
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
        <div class="p-2 mb-2 bg-secondary text-white " style="border-radius: 7px">Datos del usuario</div>
        <table class="table table-hover">
            <tbody >
            <tr>
                <td scope="row" class="font-italic text-left text-secondary" >Nombre</th>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Apellido paterno</th>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Apellido materno</th>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Cargo</th>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Correo electrónico</th>
                <td ></td>
                </td>
            <tr>
                <td scope="row" class="font-italic text-left text-secondary">Contraseña</th>
                <td ></td>
                </td>
            </tbody>
        </table>
    </div>


</div><!-- no quitar este contenedor -->


<jsp:include page="/views/layout/footer.jsp"></jsp:include>