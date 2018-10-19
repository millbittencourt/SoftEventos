
<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="javax.persistence.NoResultException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Home</title>
<c:import url="links.html"></c:import>

<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>

<jsp:useBean id="conta" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<c:set var="professor" value="${conta}" scope="page"></c:set>
</head>

<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="<%=!(conta instanceof Professor)%>">
	<c:redirect url="404.html"></c:redirect>
</c:if>


<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section class="titulo">
		<h3>Professor</h3>
		Bem vindo: ${professor.nome}
	</section>

	<section class="home-menu">
		<ul>
			<li><a href="modificar_conta.jsp"><button>Modificar Conta</button></a></li>
			<li><a href="cadastrar_evento.jsp"><button>Cadastrar Eventos</button> </a></li>
			<li><a href="deletar_conta.jsp"><button>Deletar Conta</button> </a></li>
		</ul>
	</section>

	<section class="overlay" id="qr">
		<div onclick="over('qr')" class="over-back"></div>
		<div class="over-conteudo">
			<div id="qrcode"></div>
			<a id="linkqrcode">
				<button class="btn-az">
					<i class="fa fa-download"></i>
				</button>
			</a>
		</div>
	</section>

	<section id="eventos">

		<c:catch var="SemEvento">

			<c:forEach items="${eventoDAO.getEventosProfessor(professor)}" var="evento">


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

					<c:choose>
						<c:when test="${false}">
							<a href="GerarRelatorio?id=${evento.id}" alt="Gerar Relatório">
								<button>
									Relatório <i class="fa fa-download"></i>
								</button>
							</a>
						</c:when>
						<c:otherwise>
							<button class="qrclass" id="hb" value="${evento.qrcode}">
								QRCode <i class="fa fa-qrcode"></i>
							</button>
						</c:otherwise>
					</c:choose>
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

	<script>
		$(document)
				.ready(
						function() {
							$(".qrclass")
									.click(
											function() {

												var $hash = $(this).attr(
														"value");
												$("#qrcode").empty();

												jQuery('#qrcode').qrcode(
														"http://localhost:8080/SoftEventos/confirmar_presenca.jsp?qrcode="
																+ $hash);

												var canvas = document
														.getElementById("qrcode").children;
												var img = canvas[0].toDataURL();

												var a = $("#linkqrcode").attr(
														"href", img).attr(
														"download",
														"qrcode.png");

												a.click();

												over('qr');
											});

						});
	</script>

</body>

</html>
