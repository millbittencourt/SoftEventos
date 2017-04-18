<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastar Aluno</title>
</head>
<body>
	<c:import url="nav.html"></c:import>

	<form action="CadastrarAluno" method="post">

		<p>
			Login: <br> <input type="text" name="login" placeholder="Login">
		</p>

		<p>
			Senha: <br> <input type="password" name="senha"
				placeholder="Senha">
		</p>


		<p>
			Email: <br> <input type="email" name="email" placeholder="Email">
		</p>

		<p>
			Nome: <br> <input type="text" name="nome" placeholder="Nome"
				required>
		</p>

		<p>
			CPF: <br> <input type="text" name="cpf" placeholder="CPF"
				required>
		</p>

		<p>
			Telefone: <br> <input type="text" name="telefone"
				placeholder="Telefone" required>
		</p>

		<p>
			Curso: <br> <input type="text" name="curso" placeholder="Curso"
				required>
		</p>

		<p>
			Turma: <br> <input type="text" name="turma" placeholder="Turma"
				required>
		</p>

		<button type="submit">Cadastrar</button>

	</form>

</body>
</html>