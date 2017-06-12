
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Deletar Conta</title>
<c:import url="links.html"></c:import>

<jsp:useBean id="conta" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
</head>
<c:if test="${empty conta.login }"> <c:redirect url="404.html"></c:redirect> </c:if>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section class="cadastro">
		<form action="#" method="POST">
			<div>
				<p>
					Digite sua senha para confirmação: <br> <input type="password" name="senha" placeholder="Senha">
				</p>
			</div>
			<button type="submit" class="btn-az">Deletar</button>

		</form>
	</section>
	<c:if test="${param.senha==conta.senha}">
		<section class="overlay" style="display: block">
			<div class="over-back"></div>
			<div class="over-conteudo">
				<h3>Você tem certeza que deseja Deletar Sua conta</h3>
				<a href="DeletarUsuario">
					<button class="btn-az">Sim</button>
				</a> <a href="home.jsp">
					<button class="btn-az">Não</button>
				</a>
			</div>
		</section>
	</c:if> </main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
