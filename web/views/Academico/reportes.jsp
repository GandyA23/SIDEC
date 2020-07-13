<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 13/07/2020
  Time: 02:34 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<div class="text-center bg-white mx-4 my-4 px-4 py-4">
    <form action="ingresarAcademico" method="post" accept-charset="utf-8">
        <div class="row">
            <div class="col">
                <div class="bg-gris text-center text-white rounded-pill border border-white w-auto">Reporte</div>
            </div>
        </div>

        <div class="my-3 row"></div>

        <div class="row">
            <div class="col">
                <label class="mx-2" for="matricula">Alumno:</label>
                <input class="form-control-sm text-center w-50 rounded-pill my-2 border border-secondary" type="text" name="matricula" id="matricula" placeholder="Matrícula">
            </div>

            <div class="col my-2">
                <label for="folio">Folio:</label>
            </div>

            <div id="folio" class="col my-2">Número</div>
        </div>

        <div class="row">
            <div class="col"></div>

            <div class="col my-0">
                <label for="realizado">Realizado por:</label>
            </div>

            <div id="realizado" class="col my-0">[CCT/ROL]</div>
        </div>

        <div class="row my-3">
            <div class="form-row col mx-4">
                <label class="mx-2" for="motivo">Motivo:</label>
                <input class="form-control-sm text-center w-50 rounded-pill border border-secondary" type="text" name="motivo" id="motivo" placeholder="Motivo">
            </div>

            <div class="form-row col">
                <div class="col">Fecha: </div>

                <div class="col">
                    <input class="form-control-sm text-center w-75 rounded-pill border border-secondary" type="text" name="year" id="year" placeholder="Año">
                </div>

                <div class="col">
                    <input class="form-control-sm text-center w-75 rounded-pill border border-secondary" type="text" name="month" id="month" placeholder="Mes">
                </div>

                <div class="col">
                    <input class="form-control-sm text-center w-75 rounded-pill border border-secondary" type="text" name="day" id="day" placeholder="Día">
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="descripcion" placeholder="Descripción"></textarea>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <textarea class="form-control rounded mt-3" name="canalizacion" placeholder="Canalización"></textarea>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-danger text-center text-white rounded w-25">Reportar</button>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="/views/layout/footer.jsp"></jsp:include>