<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 06:06 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<div class="container" id="page-content-wrapper">
    <!-- no quitar este contenedor -->

    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="container">
        <br>
        <div class="row">
            <div class="col-md">
                <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Búsqueda de Registro</b></p>
            </div>
        </div>
        <form action="" method="POST">
            <div class="row d-flex justify-content-center">
                <form method="POST">
                    <div class="row form-group">
                        <div class="col">
                            <input type="text" name="matricula" class="form-control  text-center" placeholder="Matricula">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn bg-rojo btn-block text-white"><b>Buscar</b></button>
                        </div>
                    </div>
                </form>
            </div>
        </form>
        <form action="" method="POST">
            <div class="row">
                <div class="col-md">
                    <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos Clínicos</b></p>
                </div>
            </div>
            <div class="row form-group">
                <div class="col">
                    <input type="text" name="seguro_medico" class="form-control  text-center"
                           placeholder="Número Seguro Medico">
                </div>
                <div class="col">
                    <input type="text" name="unidad_medica" class="form-control  text-center" placeholder="Unidad médica">
                </div>
            </div>
            <div class="row form-group">
                <div class="col">
                    <select name="opciones_sangre" id="inputState" class="form-control">
                        <option selected>Tipo de sangre</option>
                        <option>A+</option>
                        <option>A-</option>
                        <option>O+</option>
                        <option>O-</option>
                    </select>
                </div>
                <div class="col">
                    <input type="number" name="peso" class="form-control  text-center" placeholder="Peso">
                </div>
                <div class="col">
                    <input type="number" name="estatura" class="form-control  text-center" placeholder="Estatura">
                </div>
            </div>
            <div class="row form-group">
                <div class="col">
              <textarea class="form-control" name="diagnostico" id="exampleFormControlTextarea1" rows="2"
                        placeholder="Diagnóstico psicopedagogico"></textarea>
                </div>
            </div>
            <div class="container-fluid text-center">
                <br>
                <div class="row form-group">
                    <div class="col">
                        <label for="">Crónicas:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="cronica_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="cronica_no">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>

                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>
                        <div class="col">
                            <select name="opciones_cronicas" id="inputState" class="form-control">
                                <option selected>Seleccione</option>
                                <option>Cardiovasculares </option>
                                <option>Diabetes</option>
                                <option>Parkinson</option>
                                <option>Alzheimer</option>
                                <option>Hipertensión</option>
                                <option>Osteoporosis</option>
                                <option>Colesterol</option>
                                <option>Depresión</option>
                                <option>Cáncer</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="col">
                  <textarea class="form-control" name="cronica_descripcion" id="exampleFormControlTextarea1" rows="2"
                            placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                    <div class="col">
                        <label for="">Hereditarias:</label>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="hereditaria_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="hereditaria_no">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>
                        <div class="col">
                            <select name="opciones_hereditarias" id="inputState" class="form-control">
                                <option selected>Seleccione</option>
                                <option>Anemia</option>
                                <option>Daltonismo</option>
                                <option>Diabetes</option>
                                <option>Mipía</option>
                                <option>Síndrome de Marfan</option>
                                <option>Cáncer</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="col">
                  <textarea class="form-control" name="hereditaria_descripcion" id="exampleFormControlTextarea1"
                            rows="2" placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col">
                        <label for="">Alergias:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="alergia_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="alergia_si">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>
                        <div class="col">
                            <select name="opciones_alergias" id="inputState" class="form-control">
                                <option selected>Seleccione</option>
                                <option>Ácaros</option>
                                <option>Polen</option>
                                <option>Pelo de Animales</option>
                                <option>Picaduras Insectos</option>
                                <option>Moho</option>
                                <option>Látex</option>
                                <option>Alimentos</option>
                                <option>Fragancias</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="col">
                  <textarea class="form-control" name="alergias_descripcion" id="exampleFormControlTextarea1" rows="2"
                            placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                    <div class="col">
                        <label for="">Discapacidad:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="discapacidad_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="discapacidad_si">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>
                        <div class="col">
                            <select name="opciones_discapacidad" id="inputState" class="form-control">
                                <option selected>Seleccione</option>
                                <option>Física</option>
                                <option>Psíquica</option>
                                <option>Sensorial</option>
                                <option>Intelectual o Mental</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="col">
                  <textarea class="form-control" name="discapacidad_descripcion" id="exampleFormControlTextarea1"
                            rows="2" placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-5">
                    <button type="submit" class="btn bg-danger btn-sm btn-block text-white"><b>Actualizar</b></button>
                </div>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>