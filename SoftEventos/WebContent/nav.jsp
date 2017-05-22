<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav>

	<a href="index.jsp"> <img alt="logo" src="img/logo.png"> </a>
	
	<div>
		<a href="eventos.jsp">
			<button>Eventos</button>
		</a>
	</div>

	<div>
		<c:choose>

			<c:when test="${conta.login == null}">

				<button onclick="exbover()">Login</button>
				<span id="btn-cadastro">
					<button>Cadastre-se</button>

					<ul class="cadastros">
						<a href="cadastrar_aluno.jsp"><li>Aluno</li></a>
						<a href="cadastrar_professor.jsp"><li>Professor</li></a>
					</ul>
				</span>
			</c:when>

			<c:when test="${conta.login != null}">

				<a href="home.jsp">
					<button>Home</button>
				</a>
				<a href="SairConta">
					<button>Sair</button>
				</a>

			</c:when>

		</c:choose>
	</div>
</nav>

<section id="overlay">
	<div onclick="fechover()"></div>
	<c:import url="login.jsp"></c:import>
</section>

<script>
	$(document).ready(function() {
		$("#btn-cadastro").hover(function() {
			$(".cadastros").slideToggle("slow");
		});
	});
</script>

<script>
	(function verErr() {
		var erro = document.getElementById("erro").innerHTML;
		if (erro !== "") {
			exblog();
		}
	})();

	function exbover() {
		document.getElementById("overlay").style.display = 'block';
	}

	function fechover() {
		document.getElementById("overlay").style.display = 'none';

	}
</script>