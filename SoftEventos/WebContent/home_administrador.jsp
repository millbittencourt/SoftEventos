<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title>Home</title>

<jsp:useBean id="usuarioDAO" class="br.com.ucsal.dao.UsuarioDAO"></jsp:useBean>

</head>
<body>

	<c:import url="nav.html"></c:import>

	Administrador
	<br>
	<br>


	<c:forEach items="${usuarioDAO.getUsuariosNaoVerificados()}" var="usu">
		<div class="usuario-nao-verificado" id="${usu.id}">
			<h5>${usu.nome}</h3>
			<ul>
				<li>${usu.cpf}</li>
			</ul>
			Confirmar usuário:
			<a href="ConfirmarUsuario?id=${usu.id}&conf=n" alt="Não"> Não </a>
			<a href="ConfirmarUsuario?id=${usu.id}&conf=s" alt="Sim"> Sim </a>
		</div>
	</c:forEach>
	asa


</body>
</html>