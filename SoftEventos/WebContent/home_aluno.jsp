
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="br.com.ucsal.model.Aluno"%>

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


<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="<%=!(conta instanceof Aluno)%>">
	<c:redirect url="404.html"></c:redirect>
</c:if>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section class="titulo">
		<h3>Aluno</h3>
		Bem vindo: ${aluno.nome}
	</section>

	<section class="home-menu">
		<ul>
			<li><a href="modificar_conta.jsp"><button>Modificar Conta</button></a></li>
			<li><a href="deletar_conta.jsp"><button>Deletar Conta</button> </a></li>
		</ul>
	</section>

	<section id="eventos">


		<c:forEach items="${inscricaoDAO.getInscricoesAluno(aluno)}" var="inscricao">
			<c:set var="evento" value="${inscricao.evento}"></c:set>
			<div class="evento" id="${evento.id}">
				<h4>${evento.nome}</h4>
				<a href="evento.jsp?id=${evento.id}" alt="Ver Mais"> <img alt="${evento.nome}"
					src="img/eventos/${evento.id}/principal" width="100%" onerror="this.src='img/sem-imagem.jpg'">
				</a>
				<div>
					<ul>
						<li>Dia: <fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
						<li>Palestrante: ${evento.palestrante}</li>
						<li>Local: ${evento.local}</li>
					</ul>
				</div>
				<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">
					<button>Ver Mais</button>
				</a>
				<c:if test="${inscricao.presente}">
					<a href="GerarCertificado?id=${evento.id}" alt="Gerar Certificado">
						<button>
							Certificado <i class="fa fa-download"></i>
						</button>
					</a>
				</c:if>
			</div>

		</c:forEach>


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
