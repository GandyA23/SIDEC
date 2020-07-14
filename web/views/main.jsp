<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 26/06/2020
  Time: 10:25 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>


<!-- LO QUE SE MOSTRARA EN LA PAGINA (borra esta parte hasta el final del div)-->

<div class="jumbotron text-center bg-white">
    <h1 class="display-1"><b>¡Bienvenid@!</b></h1>
    <h3 class="display-4"><b id="mostrarRol">AS</b></h3>
    <p class="lead">Para comenzar puedes dirigirte al menú de la izquierda donde se encuentran todas las funciones
        para utilizar el sistema. Y si deseas ocultarlas da click en SIDEC</p>
    <hr class="my-4">
</div>

<jsp:include page="layout/footer.jsp"></jsp:include>