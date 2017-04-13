<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
	<title> Login </title>
</head>
<body>

<form method="POST" action="AutenticarUsuario"> 


    	<nav>
    	<ul> 
    	<li> <a href="eventos.jsp"> Eventos </a> </li>
    	<li> <a href="login.jsp"> Login </a></li>
    	<li> <a href="cadastar-evento.jsp"> Login </a></li>
    	</ul>
    	</nav>

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