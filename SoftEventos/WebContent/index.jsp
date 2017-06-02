<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>SoftEventos</title>
<c:import url="links.html"></c:import>
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section id="cover">

		<div id="cover-imagem" style="background-image: url('img/palestra.jpg');">

			<div id="cover-all">

				<div id="cover-texto">
					<h5>Evento Lorem</h5>
					<p>Lorem ipsum dolor sit amet</p>

					<button id="btn-ver">Ver mais</button>
				</div>

				<div id="cover-buttons">
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


	<section id="principal-eventos"></section>


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

		<form action="EnviarEmail">
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

			<button type="submit" class="btn-az">Enviar</button>
		</form>
	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
