<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="br.com.ucsal.dao.EventoDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>SoftEventos</title>
<c:import url="links.html"></c:import>
</head>

<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section id="cover">

		<div id="cover-imagem">

			<div class="cover-all">

				<c:forEach items="${eventoDAO.getQtdEvento(3)}" var="evento" varStatus="it">
	
					<div class="cover-texto" id="cover-${evento.id}" evento="${evento.id}">
						<h3>${evento.nome}</h3>
						<h5>
							<fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" />
						</h5>
						<a href="evento.jsp?id=${evento.id}">
							<button id="btn-ver">Ver mais</button>
						</a>
					</div>


					<i class="point" id="${it.index}"> &#9675; </i>
				</c:forEach>

				<div class="cover-buttons">
					<button id="btn-ant">
						<i class="fa fa-angle-left"></i>
					</button>
					<button id="btn-prox">
						<i class="fa fa-angle-right"></i>
					</button>
				</div>

			</div>

		</div>

	</section>


	<section id="principal-eventos" style="display: none">
		<div>
			<c:forEach items="${eventoDAO.getQtdEvento(3)}" var="evento">

				<div class="evento" id="${evento.id}">
					<h4>${evento.nome}</h4>
					<a href="evento.jsp?id=${evento.id}" alt="Ver Mais"> <img alt="${evento.nome}"
						src="img/eventos/${evento.id}/principal" width="100%">
					</a>
					<div>
						<ul>
							<li>Dia: <fmt:formatDate pattern="dd/MM/yyyy" value="${evento.data}" /></li>
							<li>Local: ${evento.local}</li>
						</ul>
					</div>
				</div>

			</c:forEach>
		</div>

	</section>


	<section id="sobre">
		<div>
			<h2>Quem somos nós?</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
				magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

		</div>
	</section>


	<section id="contato">

		<h2>Envie-nos uma mensagem</h2>

		<form action="EnviarEmailParaAdmin" method="Post">
			<div>
				<p>
					<legend>
						Nome: <span>*</span>
					</legend>
					<input type="text" name="nome" placeholder="Nome" required>
				</p>
				<p>
					<legend>
						Titulo:<span>*</span>
					</legend>
					<input type="text" name="titulo" placeholder="Titulo" required>
				</p>
			</div>

			<p>
				<legend>
					Mensagem:<span>*</span>
				</legend>
				<textarea rows="10" cols="" placeholder="..." required></textarea>
			</p>

			<button type="submit" class="btn-az">
				<i class="fa fa-send"></i>
			</button>
		</form>
	</section>

	</main>

	<script>
		var count = 0;
		var list = 0;
		var max = 0;

		function fat() {
			var y = list[count];

			var aux = $("#" + y.id);
			aux.fadeToggle("fast");
			var back = "url('img/eventos/" + aux.attr("evento")
					+ "/principal'), url('img/sem-imagem.jpg')";
			$("#cover-imagem").css("background-image", back);

			var point = $("#" + count);

			if (point.text() == " ○ ") {
				//	ṕoint.text(" &#9679; ");
				$("#" + count).text(" ● ");
			} else {
				//  ṕoint.text(" &#9675 ");
				$("#" + count).text(" ○ ");

			}

		}

		(function() {

			list = $(".cover-texto");
			max = list.length;
			fat();

		})();

		$("#btn-prox").click(function() {

			fat()

			count++;
			if (count == max) {
				count = 0;
			}

			fat()

		});

		$("#btn-ant").click(function() {
			fat()
			count--;
			if (count == -1) {
				count = max - 1;
			}

			fat()

		});

		$(document).keydown(function(e) {
			switch (e.which) {
			case 37:
				$("#btn-ant").click();
				break;
			case 39:
				$("#btn-prox").click();
				break;
			default:
				return;
			}
		});

		$(".point").click(function() {
			fat();
			count = $(this).attr("id");
			fat();
		})
	</script>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
