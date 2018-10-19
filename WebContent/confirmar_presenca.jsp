
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Confirmar presença</title>
<c:import url="links.html"></c:import>

</head>

<body>


	<header>
	</header>
	
	<main>
	<section>

		<c:choose>
			<c:when test="${confirmado == null}">

				<div class="cadastro">
					<c:import url="login.jsp"></c:import>
				</div>
				<c:if test="${conta.login != null}">
					<c:redirect url="ConfirmarPresenca?qrcode=${param.qrcode}"></c:redirect>
				</c:if>

			</c:when>
			<c:when test="${confirmado == true}">
				<div class="titulo" >
					<h1> Presença Confrimada :)</h1>
					<a href="index.jsp"> <button class="btn-az"> Ir para a pagina inical </button></a>
				</div>
			</c:when>
			<c:when test="${confirmado == false}">
				<div class="titulo" >
					<h1>QrCode quebrado ou Tempo de confirmação exedido :(</h1>
					<a href="index.jsp"> <button class="btn-az"> Ir para a pagina inical </button></a>
				</div>
			</c:when>
		</c:choose>

	</section>
	</main>

	<footer>
	</footer>

</body>
</html>