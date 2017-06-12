
<%@page import="br.com.ucsal.model.Professor"%>
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
	<section>
		<h3 class="titulo">Modificar Evento</h3>
	</section>

	<section>

		<form action="ModificarEvento?id=${param.id}" method="post" class="cadastro">
			<p>
				<span> ${erro} </span>
			</p>
			<fieldset>
				<p>
					Data: <br> <input type="checkbox" value="c-data"> <input id="c-data" type="date" name="data"
						placeholder="Data" value="<fmt:formatDate pattern="yyyy-MM-dd" 
            value="${evento.data}" />" disabled>
				</p>


				<p class="input-peq">
					Comeco: <br> <input type="checkbox" value="c-hora_c"> <input id="c-hora_c" type="time" name="hora_c"
						placeholder="Horário" value='<fmt:formatDate pattern="HH:mm"
 			value="${evento.horaComeco}" />' disabled>
				</p>

				<p class="input-peq">
					Termino: <br> <input type="checkbox" value="c-hora_t"> <input id="c-hora_t" type="time" name="hora_t"
						placeholder="Horário" value='<fmt:formatDate pattern="HH:mm"
 			value="${evento.horaTermino}" />' disabled>
				</p>
			</fieldset>

			<fieldset>
				<p>
					Local: <br> <input type="checkbox" value="c-local"> <input id="c-local" type="text" name="local"
						placeholder="Local" value="${evento.local}" disabled>
				</p>
			</fieldset>

			<fieldset>
				<p class="input-peq">
					Quantidade Máxima: <br> <input type="checkbox" value="c-qtd"> <input id="c-qtd" type="number"
						name="qtd" value="${(evento.quantidade == -1) ? 1 : evento.quantidade }" disabled>
				</p>
			</fieldset>

			<p>
				Descrição: <br> <input type="checkbox" value="c-descricao">
				<textarea id="c-descricao" rows="10" name="descricao" placeholder="Decrição" disabled>${evento.descricao}</textarea>
			</p>


			</div>

			<p>
				<button type="submit" class="btn-az">Modificar</button>

				<a href="evento.jsp?id=${param.id}">
					<button class="btn-az" type="button">Cancelar</button>
				</a>
			</p>
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
