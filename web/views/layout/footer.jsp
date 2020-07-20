<%--
  Created by IntelliJ IDEA.
  User: Gandy Avila
  Date: 29/06/2020
  Time: 02:31 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    </div><!-- no quitar este contenedor -->
    <!--Hasta acá termina su formulario-->
    </div>
    <!-- ---------------------------------------------------------------------------------- -->
        <!-- FOOTER -->
        <footer class="bg-gris">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <h6 class="mr-3">Los datos personales recabados serán protegidos, incorporados y tratados en el sistema de
                        datos personales correspondiente, de conformidad con el supuesto por la ley federal de transparencia y acceso a la
                        información pública gubernamental y demás disposiciones aplicables.
                        </h6>
                    </div>
                </div>
            </div>
        </footer>

<!---------------------------------------------------------------------------------------->
    <script src="${pageContext.request.contextPath}/assets/css/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/css/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validacionesRol.js"></script>
    <script>
    $("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
    });
    </script>
    </body>
</html>