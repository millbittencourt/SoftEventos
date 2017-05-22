 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!DOCTYPE html>
 <html>

 <head>
 	<meta charset="utf-8">
 	<title>SoftEventos</title>
 	<jsp:useBean id="usuarioDAO" class="br.com.ucsal.dao.UsuarioDAO"></jsp:useBean>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

 <body>

 	<header>
 		<c:import url="nav.jsp"></c:import>
 	</header>

 	<main>
 	
 	Administrador <br>
	<br>
 	
	<c:forEach items="${usuarioDAO.getUsuariosNaoVerificados()}" var="usu" >
		<div class="usuario" id="${usu.id}">
			<h5>${usu.nome}</h3>
				${usu.cpf} 
				Confirmar usuário: 
				<a href="ConfirmarUsuario?id=${usu.id}&conf=n" alt="Não"> Não </a> 
				<a href="ConfirmarUsuario?id=${usu.id}&conf=s" alt="Sim"> Sim </a>
		</div>
	</c:forEach> 

 	</main>

 	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer> 

 </body>

 </html>
