<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="br.com.ucsal.dao.EventoDAO"%>

<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Eventos </title>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>

</head>

<body>

<c:import url="nav.html"></c:import>

<main>

<c:forEach items="${eventoDAO.getEventos()}" var="evento">
	<div class="evento" id="${evento.id}">
		<h3>${evento.nome}</h3>
		<ul>
			<li>${evento.data}</li>
			<li>${evento.palestrante}</li>
			<li>${evento.local}</li>
		</ul>
		<a href="evento.jsp/?id=${evento.id}" alt="Ver Mais">Ver Mais</a>
	</div>
</c:forEach>

</main>
</body>
</html>