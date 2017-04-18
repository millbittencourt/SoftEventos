<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="eventdo" class="br.com.ucsal.model.Evento"></jsp:useBean>

<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>
<title><c:out value="${evento.nome}"></c:out></title>

</head>
<body>

<c:import url="nav.html"></c:import>

<main>

<h1>${evento.nome}</h1>

<div>

<ul>
<li>Palestrante: ${evento.palestrante}</li>
<li>Organizador: ${evento.local}</li>
<li>Data: ${evento.data}</li>
<li>Horario: ${evento.hora}</li>
<li>Local: ${evento.local}</li>
</ul>

<p>
${evento.descricao}
</p>

</div>


</main>

</body>
</html>