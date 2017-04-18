<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

   <title> Modificar Professor </title>
   <jsp:useBean id="usuario" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
</head>
<body>
    	
   <c:import url="nav.html"></c:import>
   
   
   <form action="ModificarProfessor" method="post">

		<p>
			Login: <br> <input type="text" name="login" placeholder="Login" value="${usuario.login}">
		</p>

		<p>
			Senha: <br> <input type="password" name="senha"
				placeholder="Senha" value="${usuario.senha}">
		</p>

		<p>
			Email: <br> <input type="email" name="email" placeholder="Email" value="${usuario.email}">
		</p>


		<p>
			Telefone: <br> <input type="text" name="telefone"
				placeholder="Telefone" value="${usuario.telefone}">
		</p>


		<button type="submit">Modificar</button>

	</form>
   
</body>
</html>