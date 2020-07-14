<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 02:36 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-lg navbar-light bg-rojo">
        <img style="border-radius: 50%; width: 55px; height: 50px;" src="${pageContext.request.contextPath}/assets/img/LogoESC.jpg" alt="">

        <button class="btn text-white m-2" id="menu-toggle" style="font-size: 20px"> <b>SIDEC</b> | Sistema de Expedientes Controlados </button>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>




        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link bg-gris text-white mr-1 border border-white" href="#"> <%=request.getAttribute("userName") %> <span
                    class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link bg-gris text-white mr-1 border border-white" href="#">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- BARRA LATERAL -->
    <div class="d-flex" id="wrapper">


    <!--Encabezado Alumno-->
    <div>
        <div class="bg-rojo border text-white" id="sidebar-wrapper">
            <div class="sidebar-heading  text-center">
            <img src="${pageContext.request.contextPath}/assets/img/estudiante.png" style="width: 30px; height: 30px">
            <b>Alumno</b></div>
            <!-- ---------------------------------------------------------------------------------- -->




            <!--Grupo de informacion Personal con sub menú-->
            <div class="list-group list-group-flush">
                <a class="btn btn-danger bg-rojobajo text-left" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <img src="${pageContext.request.contextPath}/assets/img/personal.png" style="width: 15%; height: 15%"> Información Personal
                </a>
                <div class="collapse text-center mr-0" id="collapseExample1">
                    <div class="card bg-rojobajo">
                        <a href="${pageContext.request.contextPath}/views/Personal/add.jsp" class="bg-rojobajo text-white">Añadir Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Personal/delete.jsp" class="bg-rojobajo text-white">Eliminar Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Personal/update.jsp" class="bg-rojobajo text-white">Actualizar Datos</a>
                        <a href="${pageContext.request.contextPath}/views/Personal/search.jsp" class="bg-rojobajo text-white">Buscar Registro</a>
                    </div>
                </div>
                <!-- ---------------------------------------------------------------------------------- -->




                <!--Grupo de informacion clinica con sub menú-->
                <a class="btn btn-danger bg-rojobajo text-left" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <img src="${pageContext.request.contextPath}/assets/img/clinica.png" style="width: 15%; height: 15%"> Información Clínica
                </a>
                <div class="collapse text-center mr-0" id="collapseExample2">
                    <div class="card bg-rojobajo">
                        <a href="${pageContext.request.contextPath}/views/Clinica/add.jsp" class="bg-rojobajo text-white">Añadir Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Clinica/delete.jsp" class="bg-rojobajo text-white">Eliminar Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Clinica/update.jsp" class="bg-rojobajo text-white">Actualizar Datos</a>
                        <a href="${pageContext.request.contextPath}/views/Clinica/search.jsp" class="bg-rojobajo text-white">Buscar Registro</a>
                    </div>
                </div>
                <!-- ---------------------------------------------------------------------------------- -->




                <!--Grupo de informacion academica con sub menú-->

                <a class="btn btn-danger bg-rojobajo text-left" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <img src="${pageContext.request.contextPath}/assets/img/academica.png" style="width: 15%; height: 15%"> Información Academica
                </a>
                <div class="collapse text-center mr-0" id="collapseExample3">
                    <div class="card bg-rojobajo">
                        <a href="${pageContext.request.contextPath}/views/Academico/add.jsp" class="bg-rojobajo text-white">Añadir Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Academico/delete.jsp" class="bg-rojobajo text-white">Eliminar Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Academico/update.jsp" class="bg-rojobajo text-white">Actualizar Datos</a>
                        <a href="${pageContext.request.contextPath}/views/Academico/search.jsp" class="bg-rojobajo text-white">Buscar Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Academico/reportes.jsp" class="bg-rojobajo text-white">Reportes</a>
                    </div>
                </div>
            </div>
            <!-- ---------------------------------------------------------------------------------- -->





            <!--Encabezado Usuarios-->
            <div class="sidebar-heading  text-center">
                <img src="${pageContext.request.contextPath}/assets/img/profesor.png" style="width: 30px; height: 30px; position: absolute;"><a> .</a>
                <img src="${pageContext.request.contextPath}/assets/img/jefe.png" style="width: 30px; height: 30px; position: relative;">
                <b>Usuarios</b>
            </div>
            <!-- ---------------------------------------------------------------------------------- -->




            <!--Grupo de cuentas con sub menú-->
            <div class="list-group list-group-flush">
                <a class="btn btn-danger bg-rojobajo text-left" data-toggle="collapse" href="#collapseExample4" role="button"
                aria-expanded="false" aria-controls="collapseExample">
                <img src="${pageContext.request.contextPath}/assets/img/candado.png" style="width: 15%; height: 15%">Cuentas
                </a>

                <div class="collapse text-center mr-0" id="collapseExample4">
                    <div class="card bg-rojobajo">
                        <a href="${pageContext.request.contextPath}/views/Usuarios/add.jsp" class="bg-rojobajo text-white">Añadir Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Usuarios/delete.jsp" class="bg-rojobajo text-white">Eliminar Registro</a>
                        <a href="${pageContext.request.contextPath}/views/Usuarios/update.jsp" class="bg-rojobajo text-white">Actualizar Datos</a>
                        <a href="${pageContext.request.contextPath}/views/Usuarios/search.jsp" class="bg-rojobajo text-white">Buscar Registro</a>
                    </div>
                </div>

                <div style="padding: 60%"></div>
                    <div class="d-flex align-items-end bg-white">
                        <img class="iIebem" src="${pageContext.request.contextPath}/assets/img/iebem.png" alt="" srcset="">
                    </div>
            </div>
        </div>
    </div>
    <!-- ---------------------------------------------------------------------------------- -->

    <!--Desde esta parte tienen que agregar el formulario que les toco-->

    <div id="page-content-wrapper " style="width: 100%"><!-- no quitar este contenedor -->