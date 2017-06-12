<form method="POST" action="AutenticarConta" class="login">
	<div>
	<span id="erro"> ${erro} </span>
	<p>
		Login
		<i></i>
		<input type="text" name="login" placeholder="Login"> <span>*</span>
	</p>

	<p>
		Senha 
		<i></i>
		<input type="password" name="senha" placeholder="Senha"> <span>*</span>

	</p>
	<br>
	</div>
	<p>
		<button id="login-btn" type="submit" class="btn-az">
			Entrar <i class="fa fa-sign-in"></i>
		</button>
	</p>
</form>