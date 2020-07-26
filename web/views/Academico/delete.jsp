<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 09:01 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Académica</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Eliminar Registro</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper">
    <br>
    <div class="container text-center bg-white">
        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
        <br>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Búsqueda de registro</b></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
                <div class="row form-group">
                    <div class="col">
                        <input type="text" name="matricula" class="form-control  text-center" maxlength="15" placeholder="Matrícula" required>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn bg-danger btn-block text-white"  name="accion" value="search:1"><b>Buscar</b></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="bg-gris text-white text-center" style="border-radius: 30px;">
            <b>Formación destacada</b>
        </div>
        <br>
        <table class="table font-italic text-dark table-hover text-left">
            <tbody>
            <tr>
                <td scope="row">Diplomas</td>
                <td></td>
            </tr>

            <tr>
                <td scope="row">Diplomas</td>
                <td></td>
            </tr>

            <tr>
                <td scope="row">Certificados</td>
                <td></td>
            </tr>

            <tr>
                <td  scope="row">Reconocimientos</td>
                <td></td>
            </tr>

            <tr>
                <td scope="row">Menciones honoríficas</td>
                <td></td>
            </tr>

            </tbody>
        </table>

        <div class="bg-gris text-white text-center" style="border-radius: 30px;">
            <b>Conducta</b>
        </div>

        <table class="table font-italic text-dark table-hover text-left">
            <tbody>
            <tr>
                <td scope="row">Observaciones</td>
                <td></td>
            </tr>
            </tbody>
        </table>


        <form action="${pageContext.request.contextPath}/AcademicoServlet" method="post">
            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white"><b>Eliminar</b></button>
                    <button id="enviarForm" type="submit" name="accion" value="delete" hidden></button>
                </div>
            </div>
        </form>

    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"></jsp:include>