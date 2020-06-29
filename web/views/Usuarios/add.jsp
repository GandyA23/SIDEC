<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:13 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<div id="page-content-wrapper"><!-- no quitar este contenedor -->
    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="jumbotron text-center bg-white" >
        <div class="p-2 mb-2 bg-secondary text-white" style="border-radius: 7px">Cuenta de usuario</div>
        <form>
            <div  class="d-inline-flex p-3 bd-highlight">
                <input class="form-control text-center " type="text" placeholder="CCT">
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control text-center " placeholder="Nombre (s)">
                </div>
                <div class="col">
                    <input type="text" class="form-control text-center " placeholder="Apellido paterno">
                </div>
                <div class="col">
                    <input type="text" class="form-control text-center " placeholder="Apellido materno">
                </div>
            </div>
            <div  class="d-inline-flex p-3 bd-highlight">
                <div class="form-check form-check-inline">
                    <label class="form-check-label text-secondary"><b>Cargo:</b> </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="hombre" id="director" value="Director">
                    <label class="form-check-label" for="director">Director</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="docente" id="docente" value="Docente">
                    <label class="form-check-label" for="docente">Docente</label>
                </div>
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input class="form-control text-center " type="text" placeholder="Correo electrónico">
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight centro">
                <input class="form-control text-center " type="text" placeholder="Contraseña">
            </div>
            <br>
            <div  class="d-inline-flex p-2 bd-highlight">
                <button type="button" class="btn btn-danger" style="width: 150px">Registrar</button>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->


<jsp:include page="/views/layout/footer.jsp"></jsp:include>