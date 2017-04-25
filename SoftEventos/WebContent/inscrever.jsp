<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title> inscrever-se em evento </title>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="usuario" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>

<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>


</head>
<body>
	
	<div>
	<h1> Você tem certeza que deseja se inverser no Evento: <c:out value="${evento.nome}"></c:out>
	</h1>
	
	<a href="InscreverseEvento?id=${evento.id}"> Sim </a> 
	<br>
	<a href="eventos.jsp"> Não </a>
	</div>

</body>
</html>