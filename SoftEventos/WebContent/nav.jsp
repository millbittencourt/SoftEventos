<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav>

	<div id="logo">
		<a href="index.jsp"> <img alt="logo" src="img/logo.png">
		</a>
	</div>

	<div id="btn-menu">
		<i class="fa fa-navicon"></i>
	</div>

	<div id="all-buttons">

		<div id="contexto-button">
			<ul>
				<li><a href="eventos.jsp">
						<button>Eventos</button>
				</a></li>
				<li><a href="#sobre">
						<button>Sobre</button>
				</a></li>
				<li><a href="#contato">
						<button>Contato</button>
				</a></li>
			</ul>

		</div>

		<div id="conta-button">
			<c:choose>

				<c:when test="${conta.login == null}">

					<button onclick="over('log')">Login</button>

					<div id="btn-cadastro">

						<button>Cadastre-se</button>

						<ul class="cadastros">
							<li><a href="cadastrar_aluno.jsp"><button>Aluno</button></a></li>
							<li><a href="cadastrar_professor.jsp"><button>Professor</button></a></li>
						</ul>

					</div>
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

	</div>

</nav>




<section class="overlay" id="log">
	<div onclick="over('log')" class="over-back"></div>
	<div class="over-conteudo" >
		<c:import url="login.jsp"></c:import>
	</div>
</section>

<script>
	$(document).ready(function() {
		$("#btn-cadastro").hover(function() {
			$(".cadastros").slideToggle("fast");
		});

		$("#btn-cadastro").click(function() {
			$(".cadastros").slideToggle("fast");
		});

		$("#btn-menu").click(function() {
			$("#all-buttons").slideToggle("slow");
		});
		
	});
</script>

<script>
	(function verErr() {
		var erro = document.getElementById("erro").innerHTML;
		if (false) {
			exbover();
		}
	})();
	
	function over(x){
		
		$("#"+x).fadeToggle("fast");
	}
</script>