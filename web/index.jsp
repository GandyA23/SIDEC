<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 09:47 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar Sesión</title>
        <meta charset="utf-8">
        <meta name="author" content="SIDEC | UTEZ 2020">
        <meta name="description" content="Iniciar Sesión">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/estilos.css">
	    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
    </head>

    <body>
        <div class="d-flex align-items-center justify-content-center m-4 mx-auto">
            <div class=" row d-flex bg-redDark align-items-center justify-content-center mx-auto" style="height: 50%; width: 75%; border-radius: 30px;">
                <div class="col-sm-7 m-3 d-flex justify-content-center p-4 mx-auto" style="height: 45%; width: 90%; border-radius: 30px;">
                    <div>
                        <div class="d-flex justify-content-center">
                            <img src="assets/img/LogoESC.jpg" style="width: 235px;height: 210px;border-radius: 200px" class="img-fluid" alt="Responsive image">
                        </div>
                        <h1 style="color:white; text-align: center; font-size: 50px;"><strong>SIDEC</strong></h1>
                        <h4 style="color:white;font-size:30px; text-align: center;">Sistema de Expedientes Controlados</h4>
                        <br>
                        <div class="d-flex justify-content-center">
                            <img src="assets/img/iebem.png" style="width: 220px;height: 60px;border-radius: 10px" class="img-fluid" alt="Responsive image">
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 m-3 bg-white mx-auto" style="height: 45%; width: 90%; border-radius: 30px;">
                    <form method="post" action="<%=request.getContextPath()%>/LoginServlet">
                        <div class=" d-flex justify-content-center">
                            <h3 style="font-weight: bold; text-align: center;"><u>Iniciar Sesión</u></h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <img src="assets/img/user3.png" style="height: 65%; width: 65%" class="img-fluid" alt="Responsive image">
                        </div>
                        <br>
                        <div class="p-2">
                            <input type="text" name="cct" class="form-control text-center" placeholder="CCT" style="border-radius:10px;" required>
                        </div>
                        <div class="p-2">
                            <input type="password" name="password" class="form-control text-center" placeholder="Contraseña" style="border-radius:10px" required>
                        </div>

                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">
                                <b>Olvidé mi contraseña </b>
                            </button>
                            <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Atención</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Si olvidaste tu contraseña debes comunicarte con el administrador del sistema para que la restablezca.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <%-- <div class="alert alert-dark" role="alert">
                                Atención:
                            </div> --%>
                        </div>
                        <div class="p-3">
                            <button type="submit" value="Login" class="btn btn-danger btn-sm btn-block" style="border-radius:10px; color: white">Ingresar</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <footer class="container">
            <h6 class="text-center" style="color: black; font-size: 16px;text-align: center;">Los datos personales recabados serán protegidos, incorporados y tratados en el sistema de datos personales
                correspondiente,de conformidad con el supuesto por la ley federal de transparencia y acceso a la
                información pública gubernamental y demás disposiciones aplicables.</h6>
        </footer>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</html>