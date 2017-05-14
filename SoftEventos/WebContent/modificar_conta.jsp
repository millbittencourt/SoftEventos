
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Modificar Conta</title>
<jsp:useBean id="conta" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main> 
	<c:out value="${erro}"></c:out>

	<form action="ModificarConta" method="post">


		<p>
			Login: <br> <input type="text" name="login" placeholder="Login" value="${conta.login}">
		</p>

		<p>
			Senha: <br> <input type="password" name="senha" placeholder="Senha" value="${conta.senha}">
		</p>

		<p>
			Email: <br> <input type="email" name="email" placeholder="Email" value="${conta.email}">
		</p>


		<p>
			Telefone: <br> <input type="text" name="telefone" placeholder="Telefone" value="${conta.telefone}">
		</p>


		<button type="submit">Modificar</button>

	</form>

	</main> 
	
	<footer> Softeventos </footer>
</body>

</html>
