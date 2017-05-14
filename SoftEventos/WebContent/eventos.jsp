 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="br.com.ucsal.dao.EventoDAO"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Eventos </title>
	<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	
	<c:forEach items="${eventoDAO.getEventos()}" var="evento">
		<div class="evento" id="${evento.id}">
			<h3>${evento.nome}</h3>
			<ul>
				<li><fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
				<li>${evento.palestrante}</li>
				<li>${evento.local}</li>
			</ul>
			<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">Ver Mais</a>
		</div>
	</c:forEach>

	</main>

	<footer> Softeventos </footer>

</body>

</html>
