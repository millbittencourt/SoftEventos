
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>

<meta charset="utf-8">
<title>Modificar ${evento.nome}</title>
<c:import url="links.html"></c:import>

</head>

<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	<section>

		<form action="ModificarEvento?id=${param.id}" method="post">
		
		<span> ${erro} </span>

			<p>
				Nome: <br> <input type="checkbox" value="c-nome"> <input id="c-nome" type="text" name="nome"
					placeholder="Nome" value="${evento.nome}" style="display: none" disabled>
			</p>


			<p>
				Local: <br> <input type="checkbox" value="c-local"> <input id="c-local" type="text" name="local"
					placeholder="Local" value="${evento.local}" disabled>
			</p>

			<p>
				Data: <br> <input type="checkbox" value="c-data"> <input id="c-data" type="date" name="data"
					placeholder="Data" value="<fmt:formatDate pattern="yyyy-MM-dd" 
            value="${evento.data}" />" disabled>
			</p>


			<p>
				Horário Comeco: <br> <input type="checkbox" value="c-hora_c"> 
				<input id="c-hora_c" type="time" name="hora_c"	placeholder="Horário" value='<fmt:formatDate pattern="HH:mm"
 			value="${evento.horaComeco}" />' disabled>
			</p>

			<p>
				Horário Termino: <br> <input type="checkbox" value="c-hora_t"> <input id="c-hora_t" type="time" name="hora_t"
					placeholder="Horário" value='<fmt:formatDate pattern="HH:mm"
 			value="${evento.horaTermino}" />' disabled>
			</p>

			<p>
				Descrição: <br> <input type="checkbox" value="c-descricao">
				<textarea id="c-descricao" rows="5" cols="15" name="descricao" placeholder="Decrição" disabled>
 			<c:out value="${evento.descricao}"></c:out>
 			</textarea>
			</p>

			<p>
				Organizador: <br> <input type="checkbox" value="c-organizador"> <input id="c-organizador" type="text"
					name="organizador" placeholder="Organizador" value="${evento.organizador}" disabled>
			</p>

			<p>
				Palestrante: <br> <input type="checkbox" value="c-palestrante"> <input id="c-palestrante" type="text"
					name="palestrante" placeholder="Palestante" value="${evento.palestrante}" disabled>
			</p>

			<p>
				Quantidade Máxima: <br> <input type="checkbox" value="c-qtd"> <input id="c-qtd" type="number"
					name="qtd" value="${evento.quantidade}" disabled>
			</p>

			<button type="submit">Modificar</button>

			<a href="eventos.jsp">
				<button>Cancelar</button>
			</a>

		</form>

	</section>
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>


	<script>
		$(document).ready(function() {
			$("input[type='checkbox']").click(function() {
				$("#" + $(this).attr("value")).attr({
					"disabled" : function(i, origValue) {
						return !origValue;
					}
				});
			});
		});
	</script>


</body>

</html>
