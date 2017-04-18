<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title>SoftEventos</title>
<jsp:useBean id="usuario" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>
</head>
<body>

	<c:import url="nav.html"></c:import>
	
	<c:if test="${usuario != null}">
		<c:if test="<%=usuario instanceof Aluno%>">
		<a href="home_aluno.jsp"> Home </a>
		</c:if>
		<c:if test="<%=usuario instanceof Professor%>">
		<a href="home_professor.jsp"> Home </a>
		</c:if>
	</c:if>
	<br>
	<main>

	<section>Quem somos nós?</section>

	<div>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
			do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
			enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
			ut aliquip ex ea commodo consequat. Duis aute irure dolor in
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
			culpa qui officia deserunt mollit anim id est laborum.</p>
	</div>

	</main>


</body>
</html>
