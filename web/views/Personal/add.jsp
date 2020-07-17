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
    <form class="container">
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
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Matrícula">
                    </div>
                    <div class="col-7">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Curp">
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Apellido paterno">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Apellido materno">
                    </div>
                </div>

                <div class="form-row justify-content-center p-1">
                    <div class="col-2">
                        <label><strong style="color:gray">Género:</strong></label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline1">Hombre</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline2">Mujer</label>
                    </div>
                </div>

                <div class="form-row justify-content-center p-1">
                    <div class="col-4 justify-content-center">
                        <b style="color:gray">Fecha de nacimiento:</b>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Día">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Mes">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Año">
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Correo electrónico">
                    </div>
                </div>

                <div class="form-row p-1">
                    <div class="col-3"></div>
                    <div class="col-3 row justify-content-center">
                        <b style="color:gray">Ciclo escolar:</b>
                    </div>
                    <div class="col-2">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Año inicio">
                    </div>
                    <div class="col-1 justify-content-center row">
                        -
                    </div>
                    <div class="col-2">
                        <input type="text" class="form-control form-control-sm text-center" placeholder="Año fin">
                    </div>
                    <div class="col-3"></div>
                </div>

                <div class="form-row p-1">
                    <div class="col-6 justify-content-center row p-1">
                        <b style="color:gray">Nivel educativo actual:</b>
                    </div>
                    <div class="col-6">
                        <select class="custom-select">
                            <option selected>Selección</option>
                            <option value="1">Primaria</option>
                            <option value="2">Secundaria</option>
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
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Calle">
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="No.Int">
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="No.Ext">
                        </div>
                    </div>
                    <div class="form-row p-1 ">
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Código postal">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Colonia">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Municipio">
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
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Nombre(s)">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Apellido paterno">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Apellido materno">
                        </div>
                    </div>

                    <div class="form-row justify-content-center p-1">
                        <div class="col-2 row justify-content-center">
                            <label><strong style="color:gray">Género:</strong></label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline3" name="customRadioInline2" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline3">Hombre</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline4" name="customRadioInline2" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline4">Mujer</label>
                        </div>
                    </div>

                    <div class="form-row p-1">
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Correo electrónico">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono personal">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control form-control-sm text-center" placeholder="Teléfono del trabajo">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 3%"></div>

        <div class="form-row justify-content-around">
            <div class="col-11">
                <div>
                    <div class="row justify-content-center">
                        <button type="submit" class="btn btn-primary btn-lg bg-danger" style="width: 40%">Registrar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>