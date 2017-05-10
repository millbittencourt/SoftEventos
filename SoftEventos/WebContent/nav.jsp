<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav>
	<ul>
		<li><a href="index.jsp"> SoftEventos</a></li>
		<li><a href="eventos.jsp"> Eventos </a></li>
		<li><a href="cadastrar_aluno.jsp"> Cadastrar Alunos</a></li>
		<li><a href="cadastrar_professor.jsp"> Cadastrar Professor</a></li>
	</ul>

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
			<a href="Sair"> Sair</a>
		</button>
	</c:when>
</c:choose>

</nav>
