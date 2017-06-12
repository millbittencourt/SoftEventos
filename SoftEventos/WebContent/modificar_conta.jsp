<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Modificar Conta</title>
<c:import url="links.html"></c:import>

<jsp:useBean id="conta" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
</head>

<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>


<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section class="cadastro">
		<form action="ModificarConta" method="post">

			<span> ${erro} </span>

			<fieldset>
				<p>

					Login: <input type="checkbox" value="c-login"><br> <input id="c-login" type="text" name="login"
						placeholder="Login" value="${conta.login}" disabled>
				</p>

				<p>
					Senha: <input type="checkbox" value="c-senha"> <br>
					<input id="c-senha" type="password" name="senha" placeholder="Senha" value="" disabled>
				</p>

				<p>
					Email: <input type="checkbox" value="c-email"><br> <input id="c-email" type="email" name="email"
						placeholder="Email" value="${conta.email}" disabled>
				</p>


				<p>
					Telefone: <input type="checkbox" value="c-telefone"> <br> <input id="c-telefone" type="text"
						name="telefone" placeholder="Telefone" value="${conta.telefone}" disabled>
				</p>

			</fieldset>
			<p>
				<button type="submit" class="btn-az">Modificar</button>
			</p>

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
					"disabled" : function(i, origValue) {
						return !origValue;
					}
				});
			});
		});
	</script>
</body>

</html>
