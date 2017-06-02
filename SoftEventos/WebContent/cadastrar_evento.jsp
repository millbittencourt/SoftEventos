<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Cadastrar Evento</title>

<c:import url="links.html"></c:import>
<script src="js/jquery.mask.js"></script>
<script src="js/masks.js"></script>
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section class="cadastro">
		<h3>Evento</h3>

		<form action="CadastrarEvento" method="post">

			<span> ${erro} </span>
			<div>
			<p>
				Nome: <br> <input type="text" name="nome" placeholder="Nome" required>
			</p>

			<p>
				Local: <br> <input type="text" name="local" placeholder="Local" required>
			</p>

			<p>
				Date: <br> <input type="date" name="data" placeholder="Horário" required>
			</p>


			<p>
				Horário Começo: <br> <input type="time" name="hora_c" placeholder="Horário" required>
			</p>
			
			<p>
				Horário Termino: <br> <input type="time" name="hora_t" placeholder="Horário" required>
			</p>
			
			<p>
				Organizador: <br> <input type="text" name="organizador" placeholder="Organizador" required>
			</p>

			<p>
				Palestrante: <br> <input type="text" name="palestrante" placeholder="Palestante" required>
			</p>

			<p>
				Quantidade Máxima: <br> <input type="number" name="qtd" min="1">
			</p>
			
			</div>
			<p>
				Descrição: <br>
				<textarea rows="5" cols="15" name="descricao" placeholder="Decrição" required></textarea>
			</p>
			
			
			<button type="submit">Cadastrar</button>

		</form>
	</section>
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>


</body>

</html>
