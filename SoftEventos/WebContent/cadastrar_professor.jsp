
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Cadastrar Professor</title>

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
		<h3>Professor</h3>


		<form action="CadastrarProfessor" method="post">

			<span> ${erro} </span>

			<p>
				Login:<span>*</span> <br> <input type="text" name="login" placeholder="Login" required>
			</p>

			<p>
				Senha: <span>*</span> <br> <input type="password" name="senha" placeholder="Senha" required>
			</p>

			<p>
				Email: <span>*</span> <br> <input type="email" name="email" placeholder="Email" required>
			</p>

			<p>
				Nome: <span>*</span> <br> <input type="text" name="nome" placeholder="Nome" required>
			</p>

			<p>
				CPF: <span>*</span> <br> <input id="cpf" type="text" name="cpf" placeholder="CPF" required>
			</p>

			<p>
				Telefone: <span>*</span> <br> <input id="telefone" type="text" name="telefone" placeholder="Telefone" required>
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
