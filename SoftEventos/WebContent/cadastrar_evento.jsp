<%@page import="br.com.ucsal.model.Professor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Cadastrar Evento</title>

<c:import url="links.html"></c:import>
<script src="js/jquery.mask.js"></script>
<script src="js/masks.js"></script>

<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>

</head>

<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="<%=!(conta instanceof Professor)%>">
	<c:redirect url="404.html"></c:redirect>
</c:if>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>

	<div class="titulo">
		<h3>Evento</h3>
	</div>

	<section class="cadastro">

		<form action="CadastrarEvento" method="post">
			<p>
				<span> ${erro} </span>
			</p>
			<fieldset>
				<legend> Dados Principais </legend>
				<p>
					<i> Nome </i> <input type="text" name="nome" placeholder="Nome" required> <span>*</span>
				</p>

				<p>
					<i> Local </i> <input type="text" name="local" placeholder="Local" required><span>*</span>
				</p>
			</fieldset>
			<fieldset>
				<legend> Sobre o evento </legend>
				<p>
					<i> Organizador </i> <input type="text" name="organizador" placeholder="Organizador" required><span>*</span>
				</p>

				<p>
					<i> Palestrante </i> <input type="text" name="palestrante" placeholder="Palestante" required><span>*</span>
				</p>
			</fieldset>
			<fieldset>
				<legend> Data / Hora </legend>
				<p>
					<i> Data </i> <input type="date" name="data" placeholder="Data" required><span>*</span>
				</p>

				Horario:
				<p class="input-peq">
					<i> Horário Começo </i> <input type="time" name="hora_c" placeholder="Começo" required><span>*</span>
				</p>

				<p class="input-peq">
					<i> Horário Termino</i> <input type="time" name="hora_t" placeholder="Termino" required><span>*</span>
				</p>
			</fieldset>
			<fieldset class="input-top">
				<legend> Quantidade </legend>
				<p>
					<i>Quantidade Máxima: </i> <input type="number" name="qtd" min="1" placeholder="Quantidade">
				</p>
			</fieldset>

			<p>
				Descrição:
				<textarea rows="10" cols="" name="descricao" placeholder="..." required></textarea>
			</p>

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
