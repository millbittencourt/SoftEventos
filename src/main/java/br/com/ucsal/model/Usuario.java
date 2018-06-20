package br.com.ucsal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "usuarios")
@PrimaryKeyJoinColumn(name = "id")
public class Usuario extends Conta {

	private String nome;
	private String telefone;

	@Column(unique = true)
	private String cpf;

	@Column(unique = true)
	private String email;
	private boolean verificado;
	
	public Usuario() {
	}
	
	public Usuario(String login, String senha, String nome, String telefone, String cpf, String email,
			boolean verificado) {
		super(login, senha);
		this.nome = nome;
		this.telefone = telefone;
		this.cpf = cpf;
		this.email = email;
		this.setVerificado(verificado);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isVerificado() {
		return verificado;
	}

	public void setVerificado(boolean verificado) {
		this.verificado = verificado;
	}

}
