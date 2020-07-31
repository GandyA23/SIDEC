<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 13/07/2020
  Time: 02:34 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Académica</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Reportes</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper">
    <div class="container text-center bg-white">
        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
        <br>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Reporte</b></p>
            </div>
        </div>
        <form action="">
            <div class="row form-group d-inline-flex">
                <div class="col-md">
                    <label class="mx-2" for="matricula">Alumno:</label>
                    <input class="form-control  text-center" type="text" id="matricula" name="matricula" maxlength="15" placeholder="Matrícula" required>
                </div>
                <div class="col-md">
                    <label class="mx-2" for="folio">Folio:</label>
                    <input class="form-control  text-center" type="number" id="folio" name="folio" maxlength="15" placeholder="No." readonly>
                </div>
                <div class="col-md">
                    <label class="mx-2" for="realizado">Realizado:</label>
                    <input class="form-control  text-center" type="number" id="realizado" name="realizado" maxlength="15" placeholder="CCT/ROL" readonly>
                </div>
            </div>
            <br>
            <div class="row form-group d-inline-flex">

                <div class="col-md">
                    <label class="mx-2" for="motivo">Motivo:</label>
                    <select name="motivo" id="motivo" class="form-control" required>
                        <option selected>Seleccione</option>
                        <option>Conducta</option>
                        <option>Agresión</option>
                        <option>Acoso</option>
                        <option>Otro</option>
                    </select>
                </div>

                <div class="col-md">
                    <label class="mx-2" for="fecha">Fecha:</label>
                    <input type="date" id="fecha" name="fecha" placeholder="Fecha" required>
                </div>
            </div>
            <br>

            <div class="row form-group col-md d-inline-flex">
                <div class="col-md">
                    <textarea class="form-control" rows="2"  ame="descripcion" placeholder="Descripción" required></textarea>
                </div>
            </div>

            <div class="row form-group col-md d-inline-flex">
                <div class="col-md">
                    <textarea class="form-control" rows="2" name="canalizacion" placeholder="Canalización" required></textarea>
                </div>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <button type="submit" class="btn bg-danger btn-block text-white" name="accion" value="report"><b>Reportar</b></button>
                </div>
            </div>

        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/assets/js/confirmacionSMS.js"></script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>