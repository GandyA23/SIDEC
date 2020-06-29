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

<div class="text-center bg-white mx-4 my-4 px-4 py-4">
    <form action="ingresarAcademico" method="post" accept-charset="utf-8">
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div class="bg-gris text-center text-white rounded-pill border border-white w-auto">Formación Destacada</div>
                    <input class="form-control-sm text-center w-25 rounded-pill my-4 border border-secondary" type="text" name="matricula" placeholder="Matrícula">
                </div>
            </div>

            <div class="row mt-2">
                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="diplomas">
                    <label class="form-check-label" for="diplomas"> Diplomas </label>
                </div>

                <div class="col">
                    <input class="form-check-input" type="checkbox" value="" id="reconocimientos">
                    <label class="form-check-label" for="reconocimientos"> Reconocimientos </label>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded" name="diplomas"></textarea>
                </div>

                <div class="col">
                    <textarea class="form-control rounded" name="reconocimientos"></textarea>
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
                    <textarea class="form-control rounded" name="menciones"></textarea>
                </div>

                <div class="col">
                    <textarea class="form-control rounded" name="certificaciones"></textarea>
                </div>
            </div>
        </div>

        <div class="bg-gris text-center text-white rounded-pill border border-white w-auto ">Conducta</div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="comportamiento" placeholder="Comportamiento en clase"></textarea>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="observaciones" placeholder="Observaciones"></textarea>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-danger text-center text-white rounded w-25">Registrar</button>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="/views/layout/footer.jsp"></jsp:include>