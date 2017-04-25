<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title> inscrever-se em evento </title>
<jsp:useBean id="eventoDAO" class="br.com.ucsal.dao.EventoDAO"></jsp:useBean>
<jsp:useBean id="usuario" class="br.com.ucsal.model.Usuario" scope="session"></jsp:useBean>

<c:set var="evento" value="${eventoDAO.getEvento(param.id)}"></c:set>


</head>
<body>
	

<form action="ModificarEvento?id=${param.id}" method="post">

<p> 
	Nome: <br>
 <input type="text" name="nome" placeholder="Nome" value="${evento.nome}"  style="display: none" required>
</p>


<p> 
	Local: <br>
 <input type="text" name="local" placeholder="Local" value="${evento.local}" required>
</p>

<p> 
	Date: <br>
	<input type="date" name="data" placeholder="Data" value="<fmt:formatDate pattern="yyyy-MM-dd" 
            value="${evento.data}" />" required>
</p>


<p> 
	Horário: <br>
 <input type="time" name="hora" placeholder="Horário" value='<fmt:formatDate pattern="HH:mm"
 			value="${evento.hora}" />' required>
</p>

<p> 
	Descrição: <br>
 <textarea rows="5" cols="15" name="descricao" placeholder="Decriçã o" value="" required>
 <c:out value="${evento.descricao}"></c:out>
 </textarea>
</p>

<p> 
	Organizador: <br>
 <input type="text" name="organizador" placeholder="Organizador" value="${evento.organizador}" required>
</p>

<p> 
	Palestrante: <br>
 <input type="text" name="palestrante" placeholder="Palestante" value="${evento.palestrante}" required>
</p>

<p> 
	Quantidade Máxima: <br>
 <input type="number" name="qtd" value="${evento.quantidade}">
</p>

<button type="submit"> Modificar </button>

</form>

<button><a href="eventos.jsp"> Cancelar </a></button>	


</body>
</html>