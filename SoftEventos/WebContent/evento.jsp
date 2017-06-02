<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<c:import url="links.html"></c:import>
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section id="evento">

		<div class="evento-cover" style="background-image: url('img/eventos/${evento.id}/principal');">

			<div>

				<h1>${evento.nome}</h1>
				<c:if test="<%=conta instanceof Aluno%>">
					${inscricaoDAO.isInscrito(conta, evento)}
						
					<c:choose>
						<c:when test="${!inscricaoDAO.isInscrito(conta, evento)}">

							<button onclick="over('ins')">increver-se</button>

							<section class="overlay" id="ins">

								<div onclick="over('ins')" class="over-back"></div>
								<div class="over-conteudo">
									<h3>Você tem certeza que deseja inscrever-se no Evento: ${evento.nome}</h3>

									<a href="InscreverseEvento?id=${evento.id}">
										<button>Sim</button>
									</a>
									<button onclick="over('ins')">Não</button>
								</div>

							</section>

						</c:when>

						<c:otherwise>

							<button onclick="over('desi')">Desinscrever-se</button>

							<section class="overlay" id="desi">

								<div onclick="over('desi')" class="over-back"></div>
								<div class="over-conteudo">
									<h3>Você tem certeza que deseja desinscrever-se do Evento: ${evento.nome}</h3>

									<a href="desinscrever?id=${param.id}">
										<button>Desincrever-se</button>
									</a>

									<button onclick="over('desi')">Não</button>
								</div>

							</section>

						</c:otherwise>

					</c:choose>

				</c:if>

				<c:if test="<%=conta instanceof Professor%>">
					<c:if test="${evento.professor.id == conta.id}">
						<a href="adm_evento.jsp?id=${param.id}">
							<button>Administração do evento</button>
						</a>
					</c:if>
				</c:if>

			</div>

		</div>

		<div>
			<table>
				<tr>
					<td>Palestrante:</td>
					<td>${evento.palestrante}</td>
				</tr>
				<tr class="g">
					<td>Organizador:</td>
					<td>${evento.local}</td>
				</tr>
				<tr>
					<td>Data:</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></td>
				</tr>
				<tr class="g">
					<td>Horario de Começo:</td>
					<td><fmt:formatDate pattern="HH:mm" value="${evento.horaComeco}" /></td>
				</tr>
				<tr class="g">
					<td>Horario de Termino:</td>
					<td><fmt:formatDate pattern="HH:mm" value="${evento.horaTermino}" /></td>
				</tr>
				
				<tr>
					<td>Local:</td>
					<td>${evento.local}</td>
				</tr>
				<tr class="g">
					<td>Quantidade:</td>
					<td>${evento.quantidade}</td>
				</tr>
				<tr>
					<td>Professor:</td>
					<td>${evento.professor.nome }</td>
				</tr>

			</table>
			<div  class="evento-desc">
				<p>${evento.descricao}</p>
			</div>
		</div>

	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>


</body>

</html>
