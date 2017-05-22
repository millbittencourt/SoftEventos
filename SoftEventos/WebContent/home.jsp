 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.com.ucsal.model.Administrador"%>
<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title> Home </title>
	<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	
	<c:choose>

		<c:when test="<%=conta instanceof Administrador%>">
			<c:redirect url="home_administrador.jsp">
			</c:redirect>
		</c:when>

		<c:otherwise>
			<c:choose>
				
				<c:when test="${conta.verificado}">
					<c:choose>
						<c:when test="<%=conta instanceof Aluno%>">
							<c:redirect url="home_aluno.jsp">
							</c:redirect>
						</c:when>
						<c:when test="<%=conta instanceof Professor%>">
							<c:redirect url="home_professor.jsp">
							</c:redirect>
						</c:when>
					</c:choose>
				</c:when>

				<c:otherwise>
				
				<section>
				
				<div>
					<h2>Sua conta Ainda não foi verificada. Volte Mais tarde</h2>
					<p>Softeventos</p>
					<a href="index.jsp"> <button> Voltar </button> </a>
				</div>
				
				</section>
				
				</c:otherwise>
			</c:choose>

		</c:otherwise>

	</c:choose>
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>
	
</body>

</html>
