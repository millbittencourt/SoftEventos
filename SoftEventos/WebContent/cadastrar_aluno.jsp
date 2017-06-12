
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Cadastrar Aluno</title>

<c:import url="links.html"></c:import>
<script src="js/jquery.mask.js"></script>
<script src="js/masks.js"></script>

<jsp:useBean id="cursoDAO" class="br.com.ucsal.dao.CursoDAO"></jsp:useBean>
</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<section>

		<div class="titulo">
			<h3>
				Aluno <i class="fa fa-group"></i>
			</h3>
		</div>

		<form action="CadastrarAluno" method="post" class="cadastro">
			<p>
				<span> ${erro} </span>
			</p>

			<fieldset class="input-med">
				<legend> Informações Pessoais: </legend>

				<p>
					<i> Nome </i> <input type="text" name="nome" placeholder="Nome" required><span>*</span>
				</p>

				<p>
					<i> Email </i> <input type="email" name="email" placeholder="Email" required><span>*</span>
				</p>

				<p>
					<i> CPF </i> <input id="cpf" type="text" name="cpf" placeholder="CPF" required><span>*</span>
				</p>

				<p>
					<i> Telefone </i> <input id="telefone" type="text" name="telefone" placeholder="Telefone" required><span>*</span>
				</p>


			</fieldset>

			<fieldset class="input-top">
				<legend> Informações Curriculares: </legend>

				<p>
					Curso <select name="curso" required>
						<c:forEach items="${cursoDAO.getCursos()}" var="curso">
							<option>${curso.nome}</option>
						</c:forEach>
					</select><span>*</span>
				</p>

				<p>
					<i> Turma </i> <input id="turma" type="text" name="turma" placeholder="Turma" required><span>*</span>
				</p>
			</fieldset>

			<fieldset>
				<legend> Informações Conta: </legend>

				<p>
					<i> Login </i> <input type="text" name="login" placeholder="Login" required><span>*</span>
				</p>

				<p>
					<i> Senha </i> <input type="password" name="senha" placeholder="Senha" required><span>*</span>
				</p>
			</fieldset>

			<p>
				<button type="submit" class="btn-az">Cadastrar</button>
				<button type="reset" class="btn-az">Cancelar</button>
			</p>
		</form>
	</section>
	</main>

	<script>
		$(document).ready(function() {
			$("input").keypress(function() {
				$(this).prev().slideDown("fast");
			});

			$("input").blur(function() {
				$(this).prev().slideUp("fast")
			});

		});
	</script>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>
</body>

</html>
