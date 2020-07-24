<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 09:01 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Académica</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Añadir Registro</b></li>
    </ol>
</nav>

<div class="text-center bg-white mx-4 my-4 px-4 py-4">
    <form action="ingresarAcademico" method="post" accept-charset="utf-8">
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div class="bg-gris text-center text-white rounded-pill border border-white w-auto"> <b>Formación Destacada</b></div>
                    <input class="form-control-sm text-center w-25  my-4 border border-secondary" type="text" maxlength="15" name="matricula" placeholder="Matrícula">
                </div>
            </div>

            <div class="row mt-2">
                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="diplomas">
                    <label class="form-check-label" for="diplomas"> Diplomas </label>
                </div>

                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="reconocimientos" >
                    <label class="form-check-label" for="reconocimientos"> Reconocimientos </label>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded" name="diploma"></textarea>
                </div>

                <div class="col">
                    <textarea class="form-control rounded" name="reconocimiento"></textarea>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="menciones">
                    <label class="form-check-label" for="menciones"> Menciones Honoríficas </label>
                </div>

                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="certificaciones">
                    <label class="form-check-label" for="certificaciones"> Certificaciones </label>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded" name="mencion"></textarea>
                </div>

                <div class="col">
                    <textarea class="form-control rounded" name="certificacion"></textarea>
                </div>
            </div>
        </div>

        <div class="bg-gris text-center text-white rounded-pill border border-white w-auto "><b>Conducta</b></div>

        <div class="form-group">
            <%--<div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="comportamiento" placeholder="Comportamiento en clase"></textarea>
                </div>
            </div> --%>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="observaciones" placeholder="Observaciones"></textarea>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-danger text-center text-white rounded w-25"><b>Registrar</b></button>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="/views/layout/footer.jsp"></jsp:include>