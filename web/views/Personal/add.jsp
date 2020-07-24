<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:22 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Información Personal</li>
        <li class="breadcrumb-item" aria-current="page"> <b>Añadir Registro</b></li>
    </ol>
</nav>

<div class="d-flex justify-content-start mx-auto" style="width: 100%" id="page-content-wrapper"><!-- no quitar este contenedor -->
    <form class="container" method="post" action="<%=request.getContextPath()%>/PersonalServlet">
        <div style="padding: 1%"></div>
        <div class="form-row justify-content-around">
            <div class="col-md-4 bg-gris text-center" style="border-radius: 7px;">
                <b style="color:white;">Fotografía</b>
            </div>

            <div class="col-md-7 bg-gris text-center" style="border-radius: 7px;">
                <b style="color:white">Información Personal</b>
            </div>
        </div>

        <div class="form-row justify-content-around">
            <div class="col-md-4">
                <div style="padding: 1%"></div>
                <div class="form-row justify-content-center">
                    <img src="${pageContext.request.contextPath}/assets/img/foto.png" style="width: 30%;height: 100%">
                </div>
                <div class="form-row">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFileLang" lang="es">
                        <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div style="padding: 1%"></div>
                <div class="form-row p-1">
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Matrícula" name="matricula" required maxlength="15">
                    </div>
                    <div class="col-7">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Curp" name="curp" required maxlength="18">
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)" name="nombre" required maxlength="30">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Primer apellido" name="apellido1" required maxlength="15">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Segundo apellido" name="apellido2" maxlength="15">
                    </div>
                </div>

                <div class="form-row justify-content-center p-1">
                    <div class="col-2">
                        <label><strong style="color:gray">Género:</strong></label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline1" name="genero1" value="Hombre" class="custom-control-input" required>
                        <label class="custom-control-label" for="customRadioInline1">Hombre</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline2" name="genero1" value="Mujer" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline2">Mujer</label>
                    </div>
                </div>

                <div class="form-row justify-content-center p-1">
                    <div class="col-4 justify-content-center">
                        <b style="color:gray">Fecha de nacimiento:</b>
                    </div>
                    <div class="col">
                        <input type="number" min="1" max="31" class="form-control form-control-sm text-center" placeholder="Día" name="dia" required>
                    </div>
                    <div class="col">
                        <input type="number" min="1" max="12" class="form-control form-control-sm text-center" placeholder="Mes" name="mes" required>
                    </div>
                    <div class="col">
                        <input type="number" min="1960"  class="form-control form-control-sm text-center" placeholder="Año" name="año" required>
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono" name="telefono" required maxlength="10">
                    </div>
                    <div class="col">
                        <input type="email" class="form-control form-control-sm text-center" placeholder="Correo electrónico" name="correo" maxlength="30">
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col-3"></div>
                    <div class="col-3 row justify-content-center">
                        <b style="color:gray">Ciclo escolar:</b>
                    </div>
                    <div class="col-2">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Año inicio" name="añoInicio">
                    </div>
                    <div class="col-1 justify-content-center row">
                        -
                    </div>
                    <div class="col-2">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Año fin" name="añoFin">
                    </div>
                    <div class="col-3"></div>
                </div>

                <div class="form-row p-1">
                    <div class="col-6 justify-content-center row p-1">
                        <b style="color:gray">Nivel educativo actual:</b>
                    </div>
                    <div class="col-6">
                        <select class="custom-select" name="seleccion" required>
                            <option selected>Selección</option>
                            <option>Primaria</option>
                            <option>Secundaria</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 1%"></div>

        <div class="form-row justify-content-around">
            <div class="col-12 bg-gris text-center" style="border-radius: 7px;"><b style="color:white">
                Domicilio
            </b></div>
        </div>

        <div class="form-row justify-content-around p-2">
            <div class="col-11">
                <div>
                    <div class="form-row p-1 justify-content-center">
                        <div class="col-6">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Calle" name="calle" required maxlength="30">
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="No.Int" name="interior" required maxlength="5">
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="No.Ext" name="exterior" required maxlength="5">
                        </div>
                    </div>
                    <div class="form-row p-1 ">
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Código postal" name="codigoPostal" required maxlength="5">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Colonia" name="colonia" required maxlength="30">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Municipio" name="municipio" required maxlength="30">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 1%"></div>

        <div class="form-row justify-content-around">
            <div class="col-12 bg-gris text-center" style="border-radius: 7px;"><b style="color:white">
                Datos del tutor
            </b></div>
        </div>

        <div class="form-row justify-content-around p-2">
            <div class="col-11">
                <div>
                    <div class="form-row p-1">
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)" name="tutorNombre" required maxlength="30">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Primer apellido" name="tutorApellido1" required maxlength="15">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Segundo apellido" name="tutorApellido2" required maxlength="15">
                        </div>
                    </div>

                    <div class="form-row justify-content-center p-1">
                        <div class="col-2 row justify-content-center">
                            <label><strong style="color:gray">Género:</strong></label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline3" name="genero2" value="Hombre" class="custom-control-input" required>
                            <label class="custom-control-label" for="customRadioInline3">Hombre</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline4" name="genero2" value="Mujer" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline4">Mujer</label>
                        </div>
                    </div>

                    <div class="form-row p-1">
                        <div class="col">
                            <input type="email" class="form-control form-control-sm text-center" placeholder="Correo electrónico" name="tutorCorreo"  maxlength="30">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono personal" name="tutorTelefono" required maxlength="10">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono del trabajo" name="tutorTelTrabajo"  maxlength="10">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-row justify-content-around">
            <div class="col-11">
                <div>
                    <div class="row justify-content-center col-md-4">
                        <button type="submit" class="btn btn-primary btn-lg bg-danger" name="listener" value="añadir" style="width: 40%">Registrar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>