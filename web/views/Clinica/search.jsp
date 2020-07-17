<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:05 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Clínica</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Buscar Registro</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper ">
    <!-- no quitar este contenedor -->
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Búsqueda de Registro</b></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <form action="">
                <div class="row form-group">
                    <div class="col">
                        <input type="text" name="matricula" class="form-control  text-center" placeholder="Matricula">
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn bg-danger btn-block text-white"><b>Buscar</b></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos Clínicos</b></p>
            </div>
            <table class="table font-italic text-dark">
                <tbody>
                <tr>
                    <td>Número de seguro médico</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Unidad médica</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Peso</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Estatura</td>
                    <td></td>
                </tr>
                <tr>
                    <td>IMC</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Tipo de sangre</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Diagnóstico psicopedagógico</td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Control Clínicos</b></p>
            </div>
            <table class="table font-italic text-dark">
                <tbody>
                <tr>
                    <td>Enfermedades crónicas</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Enfermedades hereditarias</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Alergias</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Discapacidad</td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>