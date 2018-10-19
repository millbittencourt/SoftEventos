
<%@page import="br.com.ucsal.model.Professor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">

<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>

<title>Administrar ${evento.nome}</title>

<c:import url="links.html"></c:import>
</head>

<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="<%=!(conta instanceof Professor)%>">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="${evento.professor.id != conta.id}">
	<c:redirect url="404.html"></c:redirect>
</c:if>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	<section id="evento-img">

		<div id="cover-imagem" style="background-image:  url('img/eventos/${evento.id}/principal');"></div>
		<h4 class="titulo">${evento.nome}</h4>

	</section>

	<section class="cadastro">
		Modificar a imagem do evento:
		<form method="post" action="UploadImagemEvento" enctype="multipart/form-data">

			<input type="text" name="id" style="display: none" value="${evento.id}"> <input type="file" name="uploadFile">
			<br><br>
			<button type="submit" class="btn-az">
				Enviar <i class="fa fa-upload"></i>
			</button>
		</form>
		<br> <br> Modificar valores evento:<br> <a href="modificar_evento.jsp?id=${evento.id}">
			<button class="btn-az">
				Modificar <i class="fa fa-edit"></i>
			</button>
		</a>
	</section>

	<section id="contato">
		<h3 class="titulo">Envie uma mensagem para seus Inscritos</h3>
		<form action="EnviarEmailParaAlunos?id=${evento.id}" method="post">
			<span id="erro"> ${erro} </span>
			<div>
				<p>
					<legend>
						Titulo:<span>*</span>
					</legend>
					<input type="text" name="titulo" placeholder="Titulo" required>
				</p>
			</div>

			<p>
				<legend>
					Mensagem:<span>*</span>
				</legend>
				<textarea rows="10" cols="" placeholder="..." required></textarea>
			</p>
			<p>

				<button type="submit" class="btn-az">
					<i class="fa fa-send"></i>
				</button>
			</p>
		</form>
	</section>

	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
