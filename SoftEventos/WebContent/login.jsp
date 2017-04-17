<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
	<title> Login </title>
</head>
<body>
<c:import url="nav.html"></c:import>
    	
<form method="POST" action="AutenticarUsuario"> 

<p> 
	Login: <br>
 <input type="text" name="login" placeholder="Login">
</p>

<p> 
	Senha: <br>
 <input type="password" name="senha" placeholder="Senha">
</p>

<button type="submit"> Entrar </button>

</form>


</body>
</html>