
<%@page import="javax.persistence.NoResultException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Home</title>
<jsp:useBean id="conta" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<c:set var="professor" value="${conta}" scope="page">
</c:set>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section>
		Professor <br> <br> Bem vindo: ${professor.nome}"
	</section>

	<section>
		<ul>
			<li><a href="modificar_conta.jsp"> Modificar Conta </a></li>
			<li><a href="cadastrar_evento.jsp"> Cadastrar Eventos </a></li>
			<li><a href="deletar_conta.jsp"> Deletar Conta </a></li>
		</ul>
	</section>

	<section>

		<c:catch var="SemEvento">

			<c:forEach items="${eventoDAO.getEventosProfessor(professor)}" var="evento">
				
				
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
					
					<c:if test="${true}">
						<a href="GerarRelatorio?id=${evento.id}" alt="Gerar Relatório">
							<button style="background-color: green">
								Gerar Relatório
							</button>
						</a>
					</c:if>
			
					<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">
						<button> Ver Mais </button>
					</a>
					
				</div>
			</c:forEach>

		</c:catch>

		<c:if test="${SemEvento != null}">
			<h3>Voce Não possui eventos cadastrados</h3>
		</c:if>

	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>
</body>

</html>
