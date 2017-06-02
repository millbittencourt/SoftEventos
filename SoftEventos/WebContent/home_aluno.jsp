
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Home</title>
<c:import url="links.html"></c:import>

<jsp:useBean id="conta" class="br.com.ucsal.model.Aluno" scope="session"></jsp:useBean>
<jsp:useBean id="inscricaoDAO" class="br.com.ucsal.dao.InscricaoDAO"></jsp:useBean>
<c:set var="aluno" value="${conta}" scope="page"></c:set>
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section>
		<h3>Aluno</h3>
		Bem vindo: ${aluno.nome}
	</section>

	<section>
		<ul>
			<li><a href="modificar_conta.jsp"> Modificar Conta</a></li>
			<li><a href="deletar_conta.jsp"> Deletar Conta </a></li>
		</ul>
	</section>

	<section>

		<c:catch var="SemEvento">

			<c:forEach items="${inscricaoDAO.getInscricoesAluno(aluno)}" var="inscricao">

				<c:set var="evento" value="${inscricao.evento}"></c:set>

				<div class="evento" id="${evento.id}">
					<h4>${evento.nome}</h4>
					<a href="evento.jsp?id=${evento.id}" alt="Ver Mais"> <img alt="${evento.nome}"
						src="img/eventos/${evento.id}/principal" width="100%">
					</a>
					<div>
						<ul>
							<li>Dia: <fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
							<li>Palestrante: ${evento.palestrante}</li>
							<li>Local: ${evento.local}</li>
						</ul>
					</div>

					<c:if test="${inscricao.presente}">
						<a href="GerarCertificado?id=${evento.id}" alt="Gerar Certificado">
							<button style="background-color: green">Gerar Certificado</button>
						</a>
					</c:if>

					<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">
						<button>Ver Mais</button>
					</a>

				</div>

			</c:forEach>

		</c:catch>

		<c:if test="${SemEvento != null}">
			<div>
				<h3>Voce Não se increveu em nenhum evento</h3>
			</div>
		</c:if>

	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
