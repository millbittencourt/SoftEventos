
<%@page import="poc.Main"%>
<%@page import="br.com.ucsal.util.mail.EnviarEmail"%>
<%@page import="org.apache.coyote.Request"%>
<%@page import="br.com.ucsal.util.mail.EmailUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Util</title>
	<c:import url="links.html"></c:import>
</head>

<body>	

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main> 
	
	<%
	Main.alunoX();
	%>
	
	</main>

	<footer> Softeventos </footer>
</body>

</html>
