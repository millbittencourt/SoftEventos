 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Home </title>
	<jsp:useBean id="conta" class="br.com.ucsal.model.Aluno" scope="session"></jsp:useBean>
	<jsp:useBean id="inscricaoDAO" class="br.com.ucsal.dao.InscricaoDAO"></jsp:useBean>
	<c:set var="aluno" value="${conta}" scope="page"> </c:set>
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	
	Aluno <br>
	<br>
	Bem vindo: <c:out value="${aluno.nome}"></c:out>

	<ul>
		<li><a href="modificar_conta.jsp"> Modificar Conta</a></li>
		<li><a href="deletar_conta.jsp"> Deletar Conta </a></li>
	</ul>
	
	<c:catch var="SemEvento">
	
	<c:forEach items="${inscricaoDAO.getInscricoesAluno(aluno)}"
		var="inscricao">
		<c:set var="evento" value="${inscricao.evento}"></c:set>
		<div class="evento"
			<c:if test="${inscricao.presente}">style="background-color: green"</c:if>>
			<h3>${evento.nome}</h3>
			<ul>
				<li><fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
				<li>${evento.palestrante}</li>
				<li>${evento.local}</li>
			</ul>
			<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">Ver Mais</a>
			<c:set var="evento" value="${inscricao.evento}"></c:set>
			<c:choose>
				<c:when test="${inscricao.presente}">
				Confirmado
			</c:when>
				<c:when test="${!inscricao.presente}">
				Em Falta
			</c:when>
			</c:choose>
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
