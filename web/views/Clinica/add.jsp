<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 04:13 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<jsp:include page="/views/layout/nav.jsp"></jsp:include>

<div class="container" id="page-content-wrapper">
    <!-- no quitar este contenedor -->

    <!-- LO QUE SE MOSTRARA EN LA PAGINA  (borra esta parte hasta el final del div)-->
    <div class="container">
        <form action="" method="POST">
            <br>
            <div class="row">
                <div class="col-md">
                    <p class="bg-gris text-white text-center" style=" border-radius: 30px;"><b>Datos Clínicos</b></p>
                </div>
            </div>
            <div class="row form-group">
                <div class="col">
                    <input type="text" name="matricula" class="form-control  text-center" placeholder="Matricula">
                </div>
                <div class="col">
                    <input type="text" name="numeroSeguro" class="form-control  text-center"
                           placeholder="Número Seguro Medico">
                </div>
                <div class="col">
                    <input type="text" name="unidadMedica" class="form-control  text-center" placeholder="Unidad médica">
                </div>
            </div>
            <div class="row form-group">
                <div class="col">
                    <select name="tipoSangre" id="inputState" class="form-control">
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
              <textarea class="form-control" name="diagPsico" id="exampleFormControlTextarea1" rows="2"
                        placeholder="Diagnóstico psicopedagogico"></textarea>
                </div>
            </div>
            <div class="container-fluid text-center">
                <div class="row">
                    <div class="col-md">
                        <p class="bg-gris text-white" style=" border-radius: 30px;"><b>Enfermedades</b></p>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col">
                        <label >Crónicas:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="cronica_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="cronica_no">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>

                        <%--
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>--%>

                        <div class="col">
                            <select name="enferCronicas1" id="inputState" class="form-control">
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
                  <textarea class="form-control" name="enferCronicas2" id="exampleFormControlTextarea1" rows="2"
                            placeholder="Descripción:"></textarea>
                        </div>
                    </div>


                    <div class="col">
                        <label >Hereditarias:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="hereditaria_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="hereditaria_no">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>

                        <%--
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div> --%>

                        <div class="col">
                            <select name="enferHereditarias1" id="inputState" class="form-control">
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
                  <textarea class="form-control" name="enferHereditarias2" id="exampleFormControlTextarea1"
                            rows="2" placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col">


                        <label >Alergias:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="alergia_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="alergia_si">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>
 <%--
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div>
                        --%>
                        <div class="col">
                            <select name="alergias1" id="inputState" class="form-control">
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
                  <textarea class="form-control" name="alergias2" id="exampleFormControlTextarea1" rows="2"
                            placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                    <div class="col">
                        <label >Discapacidad:</label>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="discapacidad_si">
                            <label class="form-check-label" for="inlineCheckbox1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="discapacidad_si">
                            <label class="form-check-label" for="inlineCheckbox2">No</label>
                        </div>
                        <%--
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">+</button>
                        </div>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">-</button>
                        </div> --%>

                        <div class="col">
                            <select name="discapacidades1" id="inputState" class="form-control">
                                <option selected>Seleccione</option>
                                <option>Física</option>
                                <option>Psíquica</option>
                                <option>Sensorial</option>
                                <option>Intelectual o Mental</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="col">
                  <textarea class="form-control" name="discapacidades2" id="exampleFormControlTextarea1"
                            rows="2" placeholder="Descripción:"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-5">
                    <button type="submit" class="btn bg-danger btn-sm btn-block text-white"><b>Añadir</b></button>
                </div>
            </div>
        </form>
    </div>
</div><!-- no quitar este contenedor -->

<jsp:include page="/views/layout/footer.jsp"></jsp:include>