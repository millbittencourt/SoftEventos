<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav>
<div>
<a href="index.jsp"> <img alt="logo" src="img/logo.png"> </a>
	<ul>
		<li><a href="eventos.jsp"> Eventos </a></li>
		<li><a href="cadastrar_aluno.jsp"> Cadastrar Alunos</a></li>
		<li><a href="cadastrar_professor.jsp"> Cadastrar Professor</a></li>
	</ul>
</div>

<div>
<c:choose>
	<c:when test="${conta.login == null}">
		<button>
			<a href="login.jsp"> Login </a>
		</button>
	</c:when>
	<c:when test="${conta.login != null}">
		<button>
			<a href="home.jsp">Home</a>
		</button>
		<button>
			<a href="SairConta"> Sair</a>
		</button>
	</c:when>
</c:choose>
</div>
</nav>
