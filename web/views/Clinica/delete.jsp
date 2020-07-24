<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 05:59 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Clínica</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Eliminar Registro</b></li>
    </ol>
</nav>

<div class="container" id="page-content-wrapper ">
    <!-- no quitar este contenedor -->
    <br>
    <div class="container">
        <button id="mostrarSMS" style="display: none" value="<c:out value="${respuestaSMS}"></c:out>"></button>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Búsqueda de Registro</b></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <form action="${pageContext.request.contextPath}/ClinicaServlet" method="post">
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
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos Clínicos</b></p>
            </div>
            <table class="table font-italic text-dark table-hover">
                <tbody>
                <c:forEach var="clinica" items="${listClinica}">
                <tr>
                    <td>Número de seguro médico</td> <td><c:out value="${clinica.numeroSeguro}"></c:out></td>
                </tr>
                <tr>
                    <td>Unidad médica</td><td><c:out value="${clinica.unidadMedica}"></c:out></td>
                </tr>
                <tr>
                    <td>Peso</td><td><c:out value="${clinica.peso}"></c:out></td>
                </tr>
                <tr>
                    <td>Estatura</td><td><c:out value="${clinica.estatura}"></c:out></td>
                </tr>
                <tr>
                    <td>IMC</td><td><c:out value="${clinica.imc}"></c:out></td>
                </tr>
                <tr>
                    <td>Tipo de sangre</td><td><c:out value="${clinica.tipoSangre}"></c:out></td>
                </tr>
                <tr>
                    <td>Diagnóstico psicopedagógico</td><td><c:out value="${clinica.diagPsico}"></c:out></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style="border-radius: 30px;"><b>Control Clínicos</b></p>
            </div>
            <table class="table font-italic text-dark table-hover">
                <tbody>
            <c:forEach var="clinica" items="${listClinica}">
                <tr>
                    <td>Enfermedades crónicas</td>
                    <td>
                        <c:if test="${clinica.tipoEnferCronicas != 'Seleccione'}">
                            <c:out value="${clinica.tipoEnferCronicas}"/>
                        </c:if>
                    <c:out value="${clinica.enferCronicas}"></c:out>
                    </td>
                </tr>
                <tr>
                    <td>Enfermedades hereditarias</td>
                    <td>
                        <c:if test="${clinica.tipoEnferHereditarias != 'Seleccione'}">
                            <c:out value="${clinica.tipoEnferHereditarias}"/>
                        </c:if>
                        <c:out value="${clinica.enferHereditarias}"></c:out>
                    </td>
                </tr>
                <tr>
                    <td>Alergías</td>
                    <td>
                        <c:if test="${clinica.tipoalergias != 'Seleccione'}">
                            <c:out value="${clinica.tipoalergias}"/>
                        </c:if>
                        <c:out value="${clinica.alergias}"></c:out>
                    </td>
                </tr>
                <tr>
                    <td>Discapacidad</td>
                    <td>
                        <c:if test="${clinica.tipoDiscapacidades!='Seleccione'}">
                            <c:out value="${clinica.tipoDiscapacidades}"/>
                        </c:if>
                        <c:out value="${clinica.discapacidades}"></c:out>
                    </td>
                </tr>
            </c:forEach>
                </tbody>
            </table>
        </div>
        <form action="${pageContext.request.contextPath}/ClinicaServlet" method="post">
            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <button onclick="pregunta()" type="button" class="btn bg-danger btn-block text-white"><b>Eliminar</b></button>
                    <button id="enviarForm" type="submit" name="accion" value="delete" hidden></button>
                </div>
            </div>
        </form>
        <br>
    </div>
</div><!-- no quitar este contenedor -->
<script>
    function pregunta() {
        Swal.fire({
            title: '¿Realizar Acción?',
            text: "Los cambios son irreversibles!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#6c757d',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Si, Realizar!'
        }).then((result) => {
            if (result.value) {
                Swal.fire(
                        'Realizado!',
                        'Se efectuo la acción',
                        'success'
                )
                setTimeout(function () {
                    document.getElementById("enviarForm").click();
                },1000)
            }
        })
    }
</script>
<jsp:include page="/views/layout/footer.jsp"></jsp:include>