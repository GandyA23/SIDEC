	<%@ page import="mx.edu.utez.model.bean.LoginBean" %>    <%--
      Created by IntelliJ IDEA.
      User: Gandy Avila
      Date: 29/06/2020
      Time: 02:32 a. m.
      To change this template use File | Settings | File Templates.
    --%>
		<%@ page contentType="text/html;charset=UTF-8" language="java" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html lang="es">
		<head>
		<title>SIDEC | Menú</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="SIDEC | UTEZ 2020">
		<meta name="description" content="Sistema de Expedientes Controlados">
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/assets/css/estilos.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/css/simple-sidebar.css" rel="stylesheet">
		<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
		</head>
		<body>
			<%
        HttpSession sesionActiva = request.getSession();
        LoginBean usuarioWeb = (LoginBean) sesionActiva.getAttribute("UsuarioActivo");
        if (usuarioWeb==null){
		request.getRequestDispatcher("/index.jsp").forward(request, response);%>
		<jsp:forward page="/index.jsp"></jsp:forward>
			<%}%>

