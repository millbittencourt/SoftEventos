<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="br.com.ucsal.dao.EventoDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
   <title> Home </title>
   <jsp:useBean id="usuario" class="br.com.ucsal.model.Professor" scope="session"></jsp:useBean>
   <jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
</head>
<body>
	
	Bem vindo: <c:out value="${usuario.nome}"></c:out> 
	<c:import url="nav.html"></c:import>
	
	<ul>
	<li><a href="modificar_professor.jsp"> Modificar Conta </a></li>
	<li> <a href="cadastrar_evento.jsp"> Cadastrar Eventos </a></li>
	<li> <a href="deletar_conta.jsp" > Deletar Conta </a></li>
	</ul>
	
	<!-- 
	<c:forEach items="${eventoDAO.getEventosProfessor(usuario)}" var="evento">
	<div class="evento" id="${evento.id}">
		<h3>${evento.nome}</h3>
		<ul>
			<li> <fmt:formatDate pattern="dd-MM-yyyy" 
            value="${evento.data}" /></li>
			<li>${evento.palestrante}</li>
			<li>${evento.local}</li>
		</ul>
		aba
		<a href="evento.jsp?id=${evento.id}" alt="Ver Mais">Ver Mais</a>
	</div>
	 -->
	 
</c:forEach>
	
</body>
</html>