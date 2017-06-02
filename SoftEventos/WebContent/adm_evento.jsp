
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

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	<section id="evento-img">
		
		<div id="cover-imagem" style= "background-image:  url('img/eventos/${evento.id}/principal');">

			<div id="cover-all">

				<div id="cover-texto">
					<h5>${evento.nome}</h5>
				</div>
			</div>
		</div>

		<p>
			<form method="post" action="UploadImagemEvento" enctype="multipart/form-data">
				<input type="text" name="id" style="display: none" value="${evento.id}"> 
				<input type="file" name="uploadFile">
				<button type="submit"> Enviar </button>
			</form>
		</p>
	</section>
	
	<section id="modificar">
		Modifique:
		<a href="modificar_evento.jsp?id=${evento.id}"><button> Modificar </button></a>
	</section>
	
	<section id="estatisticas">
		${evento.id}
	</section>

	<section id="evento-email">
		<form action="#">
			<p>
				Nome:
				<input type="text" name="nome" placeholder="Seu Nome" required>
			</p>
			
			<p>
				Titulo:
				<input type="text" name="titulo" placeholder="Titulo" required>
			</p>
			
			<br>
			Mensagem:
			<textarea rows="10" cols="" placeholder="Sua Mensagem" required></textarea>
			
			<button type="submit"> Enviar </button>
		</form>
	</section>
	
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
