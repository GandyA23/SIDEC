    <%--
      Created by IntelliJ IDEA.
      User: Gandy Avila
      Date: 29/06/2020
      Time: 02:32 a. m.
      To change this template use File | Settings | File Templates.
    --%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
        <title>SIDEC | Menú</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/assets/css/estilos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/simple-sidebar.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/2efaf80395.js" crossorigin="anonymous"></script>
        </head>
        <body>

         <%if ((request.getSession(false).getAttribute("Administrador") == null)) {%>
            <jsp:forward page="/index.jsp"></jsp:forward><%}%>

         <%if ((request.getSession(false).getAttribute("Director") == null)) {%>
            <jsp:forward page="/index.jsp"></jsp:forward><%}%>

         <%if ((request.getSession(false).getAttribute("Docente") == null)) {%>
            <jsp:forward page="/index.jsp"></jsp:forward><%}%>