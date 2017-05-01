package br.com.ucsal.model;

import javax.persistence.*;

@Entity
@Table(name = "Usuarios")
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(unique = true)
	private String login;

	private String senha;

	@Column(unique = true)
	private String email;

	private boolean verificacao;

	public Usuario() {

	}

	public Usuario(String login, String senha) {
		super();
		this.login = login;
		this.senha = senha;
	}

	public Usuario(String login, String senha, String email, boolean verificacao) {
		super();
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.verificacao = verificacao;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isVerificacao() {
		return verificacao;
	}

	public void setVerificacao(boolean verificacao) {
		this.verificacao = verificacao;
	}

}
