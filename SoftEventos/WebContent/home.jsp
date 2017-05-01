<%@page import="br.com.ucsal.model.Administrador"%>
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
<jsp:useBean id="usuario" class="br.com.ucsal.model.Usuario"
	scope="session"></jsp:useBean>
</head>
<body>
	<c:choose>

		<c:when test="<%=usuario instanceof Administrador%>">
			<c:redirect url="home_administrador.jsp">
			</c:redirect>
		</c:when>

		<c:otherwise>
			<c:when test="${!ususario.verificacao}">
				<c:choose>
					<c:when test="<%=usuario instanceof Aluno%>">
						<c:redirect url="home_aluno.jsp">
						</c:redirect>
					</c:when>
					<c:when test="<%=usuario instanceof Professor%>">
						<c:redirect url="home_professor.jsp">
						</c:redirect>
					</c:when>
				</c:choose>
			</c:when>

			<c:otherwise>
				<h1>Sua conta Ainda não foi verificada. Volte Mais tarde</h1>
				<p>Loren ipsun dolor si amet</p>
				<a href="indes.jsp"> Voltar </a>
			</c:otherwise>

		</c:otherwise>

	</c:choose>

</body>
</html>