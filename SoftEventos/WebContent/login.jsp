 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Login </title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	
	<c:out value="${erro}"></c:out>

	<form method="POST" action="AutenticarConta">

		<p>
			Login: <br> 
			<input type="text" name="login" placeholder="Login">
		</p>

		<p>
			Senha: <br> 
			<input type="password" name="senha"	placeholder="Senha">
		</p>

		<button type="submit"> Entrar </button>

	</form>

	</main>

	<footer> Softeventos </footer>

</body>

</html>
