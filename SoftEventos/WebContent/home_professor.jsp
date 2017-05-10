 <%@page import="javax.persistence.NoResultException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Home </title>
	<jsp:useBean id="conta" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
	<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
	<c:set var="professor" value="${conta}" scope="page"> </c:set>
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>
	
	<main>
	
	Professor
	<br>
	<br> Bem vindo:
	<c:out value="${professor.nome}"></c:out>
	
	<ul>
		<li><a href="modificar_conta.jsp"> Modificar Conta </a></li>
		<li><a href="cadastrar_evento.jsp"> Cadastrar Eventos </a></li>
		<li><a href="deletar_conta.jsp"> Deletar Conta </a></li>
	</ul>
	
	<c:catch var="SemEvento">
	
	<c:forEach items="${eventoDAO.getEventosProfessor(professor)}"
		var="evento">
		<div class="evento" id="${evento.id}">
			<h3>${evento.nome}</h3>
			<ul>
				<li><fmt:formatDate pattern="dd-MM-yyyy" value="${evento.data}" /></li>
				<li>${evento.palestrante}</li>
				<li>${evento.local}</li>
			</ul>
			<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">Ver Mais</a>
		</div>
	</c:forEach>
	
	</c:catch>
	
	<c:if test="${SemEvento != null}">
	<h3> Voce Não possui eventos cadastrados</h3>
	</c:if>
	
	</main>
	
	<footer> Softeventos </footer>
</body>

</html>
