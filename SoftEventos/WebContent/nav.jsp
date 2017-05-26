<jsp:useBean id="conta" class="br.com.ucsal.model.Conta" scope="session"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

				<button onclick="exbover()">Login</button>

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

<section id="overlay">
	<div onclick="fechover()"></div>
	<c:import url="login.jsp"></c:import>
</section>

<script>
	$(document).ready(function() {
		$("#btn-cadastro").hover(function() {
			$(".cadastros").slideToggle("fast");
		});
		
		$("#btn-cadastro").click(function() {
			$(".cadastros").slideToggle("fast");
		});
		
		
		$("#btn-menu").click(function(){
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

	function exbover() {
		document.getElementById("overlay").style.display = 'block';
	}

	function fechover() {
		document.getElementById("overlay").style.display = 'none';

	}
</script>