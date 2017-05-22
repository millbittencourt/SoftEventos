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
	
	<h3> Eventos </h3>

	
	<c:forEach items="${eventoDAO.getEventos()}" var="evento">
	
		<div class="evento" id="${evento.id}">
			<img alt="${evento.nome}" src="img/${evento.id}">
			<div>
			<h4>${evento.nome}</h4>
			<ul>
				<li>Dia: <fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
				<li>Palestrante: ${evento.palestrante}</li>
				<li>Local: ${evento.local}</li>
			</ul>
			</div>
			<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">
			<button>Ver Mais</button>
			</a>
		</div>
	
	</c:forEach>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
