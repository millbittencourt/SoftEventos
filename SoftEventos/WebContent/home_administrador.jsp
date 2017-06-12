
<%@page import="br.com.ucsal.model.Administrador"%>
<%@page import="br.com.ucsal.model.Professor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>SoftEventos</title>
<c:import url="links.html"></c:import>

<jsp:useBean id="usuarioDAO" class="br.com.ucsal.dao.UsuarioDAO"></jsp:useBean>
<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<jsp:useBean id="alunoDAO" class="br.com.ucsal.dao.AlunoDAO"></jsp:useBean>
</head>

<c:if test="${empty conta.login }">
	<c:redirect url="404.html"></c:redirect>
</c:if>
<c:if test="<%=!(conta instanceof Administrador)%>">
	<c:redirect url="404.html"></c:redirect>
</c:if>


<body>

	<header>
		<c:import url="nav.jsp"></c:import>
	</header>

	<main>
	<section class="titulo">
		<h3>Administrador</h3>
	</section>

	<section>
		<div class="alunos">
			<h3 class="titulo">Alunos</h3>
			<c:forEach items="${alunoDAO.getAlunosNaoVerificado()}" var="usu">
				<div class="usuario" id="${usu.id}">
					<i class="fa fa-group"></i>
					<ul>
						<li>Nome: ${usu.nome}</li>
						<li>Cpf: ${usu.cpf}</li>
					</ul>
					<div>
						<a href="ConfirmarUsuario?id=${usu.id}&conf=n" alt="Não">
							<button>Não</button>
						</a> <a href="ConfirmarUsuario?id=${usu.id}&conf=s" alt="Sim">
							<button>Sim</button>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="professores">
			<h3 class="titulo">Professores</h3>
			<c:forEach items="${alunoDAO.getAlunosNaoVerificado()}" var="usu">
				<div class="usuario" id="${usu.id}">
					<i class="fa fa-mortar-board"></i>
					<ul>
						<li>Nome: ${usu.nome}</li>
						<li>Cpf: s${usu.cpf}</li>
					</ul>
					<div>
						<a href="ConfirmarUsuario?id=${usu.id}&conf=n" alt="Não">
							<button>Não</button>
						</a> <a href="ConfirmarUsuario?id=${usu.id}&conf=s" alt="Sim">
							<button>Sim</button>
						</a>
					</div>
				</div>
			</c:forEach>


		</div>

	</section>
	</main>

	<footer>
		<c:import url="footer.jsp"></c:import>
	</footer>

</body>

</html>
