<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav>
	<div>
		<a href="index.jsp"> <img alt="logo" src="img/logo.png">
		</a>
		<ul>
			<li><a href="eventos.jsp"> Eventos </a></li>
			<li><a href="cadastrar_aluno.jsp"> Cadastrar Alunos</a></li>
			<li><a href="cadastrar_professor.jsp"> Cadastrar Professor</a></li>
		</ul>
	</div>

	<div>
		<c:choose>
			<c:when test="${conta.login == null}">
				<button onclick="exblog()">
					Login
				</button>
			</c:when>
			<c:when test="${conta.login != null}">
				<a href="home.jsp">
				<button> Home </button>
				</a>
				<a href="SairConta">
				<button> Sair </button>
				</a>
			</c:when>
		</c:choose>
	</div>
</nav>


<section id="login">
	<div onclick="fechlog()"></div>
	<c:import url="login.jsp"></c:import>
</section>

<script type="text/javascript">
	
	(function verErr() {
		var erro = document.getElementById("erro").innerHTML;
		if (erro !== "") {
			exblog();
		}
	})();

	function exblog() {
		document.getElementById("login").style.display = 'block';
	}

	function fechlog() {
		document.getElementById("login").style.display = 'none';
	}
	
</script>