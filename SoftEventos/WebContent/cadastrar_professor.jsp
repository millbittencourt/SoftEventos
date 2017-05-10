 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!DOCTYPE html>
 <html>

 <head>
 	<meta charset="utf-8">
 	<title> Cadastrar Professor </title>
 </head>

 <body>

 	<header>
 		<c:import url="nav.jsp"></c:import>
 	</header>

 	<main>

 		<c:out value="${erro}"></c:out>
 		

 		<form action="CadastrarProfessor" method="post">

 			<p>
 				Login: <br> <input type="text" name="login" placeholder="Login"
 				required>
 			</p>

 			<p>
 				Senha: <br> <input type="password" name="senha"
 				placeholder="Senha" required>
 			</p>

 			<p>
 				Email: <br> <input type="email" name="email" placeholder="Email"
 				required>
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

 			<button type="submit">Cadastrar</button>
 		</form>

 	</main>

 	<footer> Softeventos </footer>

 </body>

 </html>
