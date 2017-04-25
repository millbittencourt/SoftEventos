<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="usuario" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>

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
<li>Data: <fmt:formatDate pattern="dd-MM-yyyy" value="${evento.data}" /></li>
<li>Horario:  <fmt:formatDate pattern="HH:mm" value="${evento.hora}" /> </li>
<li>Local: ${evento.local}</li>
<li>Quantidade: ${evento.quantidade}</li>
<li>Professor: ${evento.professor }
</ul>

<p>
${evento.descricao}
</p>

</div>

<c:if test="<%=usuario instanceof Aluno%>">
	<a href="inscrever.jsp?id=${param.id}"> increver-se </a>
</c:if>

<c:if test="<%=usuario instanceof Professor%>">

<c:if test="${evento.professor.id == usuario.id}">	
	<a href="modificar_evento.jsp?id=${param.id}"> Modificar Evento </a>
</c:if>
</c:if>


</main>

</body>
</html>