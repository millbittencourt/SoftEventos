
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Modificar Conta</title>
<jsp:useBean id="conta" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-3.2.1.js"></script>


</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section>
		<form action="ModificarConta" method="post">

			<span> ${erro} </span>

			<p>

				Login: <br> <input type="checkbox" value="c-login"> <input id="c-login" type="text" name="login"
					placeholder="Login" value="${conta.login}" disabled>
			</p>

			<p>
				Senha: <br> <input type="checkbox" value="c-senha"> <input id="c-senha" type="password" name="senha"
					placeholder="Senha" value="${conta.senha}" disabled>
			</p>

			<p>
				Email: <br> <input type="checkbox" value="c-email"> <input id="c-email" type="email" name="email"
					placeholder="Email" value="${conta.email}" disabled>
			</p>


			<p>
				Telefone: <br> <input type="checkbox" value="c-telefone"> <input id="c-telefone" type="text"
					name="telefone" placeholder="Telefone" value="${conta.telefone}" disabled>
			</p>


			<button type="submit">Modificar</button>


		</form>
	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

	<script>
		$(document).ready(function() {
			$("input[type='checkbox']").click(function() {
				$("#" + $(this).attr("value")).attr({
					"disabled" : function(i, origValue){
				        return !origValue; 
				}});
			});
		});
	</script>
</body>

</html>
