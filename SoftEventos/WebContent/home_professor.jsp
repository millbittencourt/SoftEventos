<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
   <title> Home </title>
   <jsp:useBean id="usuario" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
</head>
<body>
	
	Bem vindo: <c:out value="${usuario.nome}"></c:out> 
	<c:import url="nav.html"></c:import>
	<a href="modificar_professor.jsp"> Modificar Conta </a>
	
</body>
</html>