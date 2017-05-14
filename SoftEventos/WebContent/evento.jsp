<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
	<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
	<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>
	<title>${evento.nome}</title>
	<jsp:useBean id="inscricaoDAO" class="br.com.ucsal.dao.InscricaoDAO"></jsp:useBean>
	<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<h1>${evento.nome}</h1>

	<div>

		<ul>
			<li>Palestrante: ${evento.palestrante}</li>
			<li>Organizador: ${evento.local}</li>
			<li>Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
			<li>Horario: <fmt:formatDate pattern="HH:mm" value="${evento.hora}" /></li>
			<li>Local: ${evento.local}</li>
			<li>Quantidade: ${evento.quantidade}</li>
			<li>Professor: ${evento.professor }
		</ul>

		<p>${evento.descricao}</p>

	</div>

	<c:if test="<%=conta instanceof Aluno%>">
		<c:if test="${!inscricaoDAO.isInscrito(conta)}">
			<a href="inscrever.jsp?id=${param.id}"> increver-se </a>
		</c:if>
	</c:if> <c:if test="<%=conta instanceof Professor%>">
		<c:if test="${evento.professor.id == conta.id}">
			<a href="modificar_evento.jsp?id=${param.id}"> Modificar Evento </a>
		</c:if>
	</c:if> </main>

	<footer> Softeventos </footer>

</body>

</html>
