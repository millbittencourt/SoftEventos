
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Deletar Conta</title>
<jsp:useBean id="conta" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section>
		<form action="#" method="POST">
			<p>
				Digite sua senha para confirmação:<br> <input type="password" name="senha" placeholder="Senha">
			</p>
			<button type="submit">Deletar conta</button>

		</form>
	</section>

	<section>
		<c:if test="${param.senha==conta.senha}">
			<div>
				<h3>Você tem certeza que deseja Deletar Sua conta</h3>

				<a href="DeletarUsuario"> <button>Sim</button> </a> 
				<a href="index.jsp"> <button>Não</button> </a>
			</div>
		</c:if>
	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
