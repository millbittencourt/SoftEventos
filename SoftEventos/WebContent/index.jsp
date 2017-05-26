<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>SoftEventos</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-3.2.1.js"></script>
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

	<section id="sobre">
		<div>
			<h2>Quem somos nós?</h2>
			<p>Praesent in mauris eu tortor porttitor accumsan. Mauris suscipit, ligula sit amet pharetra semper, nibh ante
				cursus purus, vel sagittis velit mauris vel metus. Aenean fermentum risus id tortor. Integer imperdiet lectus quis
				justo. Integer tempor. Vivamus ac urna vel leo pretium faucibus. Mauris elementum mauris vitae tortor. In dapibus
				augue non sapien. Aliquam ante. Curabitur bibendum justo non orci. Nam quis nulla. Integer malesuada. In in enim a
				arcu imperdiet malesuada. Sed vel lectus. Donec odio urna, tempus molestie, porttitor ut, iaculis quis, sem.
				Phasellus rhoncus. Aenean id metus id velit ullamcorper pulvinar. Vestibulum fermentum tortor id mi. Pellentesque</p>

		</div>
	</section>
	
	
	<section id="contato">
		
		<h3> Envie-nos uma mensagem</h3>
		
		<form action="EnviarEmail">
			<p>
			Nome:
			<input type="text" name="nome" placeholder="Seu Nome" required>
			</p><p>
			Titulo:
			<input type="text" name="titulo" placeholder="Titulo" required>
			</p>
			<br>
			Mensagem:
			<textarea rows="10" cols="" placeholder="Sua Mensagem" required></textarea>
			
			<button type="submit"> Enviar </button>
		</form>
	</section>
	
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>


	<script>
		$(document).ready(function() {
			$("#covxer").hover(function() {
				$("#texto-imagem").slideToggle("slow");
			});
		});
	</script>


</body>

</html>
