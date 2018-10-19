<%@page import="java.util.Date"%>
<%@page import="br.com.ucsal.model.Evento"%>
<%@page import="antlr.debug.Event"%>
<%@page import="br.com.ucsal.dao.BancoUtil"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="br.com.ucsal.model.Aluno"%>
<%@page import="br.com.ucsal.model.Professor"%>
<%@page import="br.com.ucsal.model.Administrador"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Popular </title>
</head>
<body>
	
	<h1> Popular Banco </h1>
	
	<%
	Administrador adm = new Administrador("admin","admin",1);
	Professor prof = new Professor("professor", "professor", "Daniel", "111111", "1111111", "prof@prof", true);
	Aluno aluno = new Aluno("aluno","aluno", "Fulano", "1111", "11111", "aluno@aluno", true, "Eng Software", "2015 1");
	
	
	EntityManager em = BancoUtil.getInstancia().getConexcao().createEntityManager();
	em.getTransaction().begin();
	
	em.persist(adm);
	em.persist(prof);
	em.persist(aluno);
	
	Evento evento = new Evento("Algo", "Lugar nenhum", new Date(), new Date(), new Date(), em.merge(prof), "algo algo algo", "ninguem", "alguem", 80);
	
	em.persist(evento);
	
	em.getTransaction().commit();
	
	%>
	
</body>
</html>