package br.com.ucsal.model;

import javax.persistence.*;

@Entity
@Table(name = "Professores")
@PrimaryKeyJoinColumn(name = "id")
public class Professor extends Usuario {

	private String nome;
	private String cpf;
	private String telefone;

	public Professor() {
		super();

	}

	public Professor(String login, String senha, String nome, String cpf, String telefone) {
		super(login, senha);
		this.nome = nome;
		this.cpf = cpf;
		this.telefone = telefone;

	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

}
