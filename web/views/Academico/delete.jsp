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
    <form action="buscarAcademico" method="post" accept-charset="utf-8">
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div class="bg-gris text-center text-white border border-white mx-auto w-50 bordes-redondos">Busqueda de registro</div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col"></div>

                <div class="col mt-1">
                    <input class="form-control-sm text-center rounded-pill border border-secondary w-100" type="text" name="matricula" placeholder="Matrícula">
                </div>

                <div class="col">
                    <button type="button" class="btn btn-danger text-center border border-secondary text-white rounded w-100">Buscar</button>
                </div>

                <div class="col"></div>
            </div>
        </div>
    </form>

    <div class="bg-gris text-center text-white rounded-pill border border-white w-auto">Formación Destacada</div>

    <table class="table mx-0 my-0">
        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Diplomas</td>
        </tr>

        <tr>
            <td id="diplomas"></td>
        </tr>

        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Certificados</td>
        </tr>

        <tr>
            <td id="certificados"></td>
        </tr>

        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Reconocimientos</td>
        </tr>

        <tr>
            <td id="reconocimientos"></td>
        </tr>

        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Menciones honoríficas</td>
        </tr>

        <tr>
            <td id="menciones"></td>
        </tr>
    </table>

    <div class="bg-gris text-center text-white rounded-pill border border-white w-auto">Conducta</div>

    <table class="table mx-0 my-0">
        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Comportamiento en clase</td>
        </tr>

        <tr>
            <td id="comportamiento"></td>
        </tr>

        <tr>
            <td align="left" class="mx-0 my-0 text-muted">Observaciones</td>
        </tr>

        <tr>
            <td id="observaciones"></td>
        </tr>
    </table>

    <form action="eliminarAcademica" method="post" accept-charset="utf-8">
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-danger text-center border border-secondary text-white rounded w-25">Eliminar</button>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>