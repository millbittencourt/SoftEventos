 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Cadastrar Evento </title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	
	<c:out value="${erro}"></c:out>
	
	<form action="CadastrarEvento" method="post">

		<p>
			Nome: <br> <input type="text" name="nome" placeholder="Nome"
				required>
		</p>

		<p>
			Local: <br> <input type="text" name="local" placeholder="Local"
				required>
		</p>

		<p>
			Date: <br> <input type="date" name="data" placeholder="Horário"
				required>
		</p>


		<p>
			Horário: <br> <input type="time" name="hora"
				placeholder="Horário" required>
		</p>

		<p>
			Descrição: <br>
			<textarea rows="5" cols="15" name="descricao" placeholder="Decriçã o"
				required></textarea>
		</p>

		<p>
			Organizador: <br> <input type="text" name="organizador"
				placeholder="Organizador" required>
		</p>

		<p>
			Palestrante: <br> <input type="text" name="palestrante"
				placeholder="Palestante" required>
		</p>

		<p>
			Quantidade Máxima: <br> <input type="number" name="qtd">
		</p>

		<button type="submit">Cadastrar</button>

	</form>
	
	</main>

	<footer> Softeventos </footer>

</body>

</html>
