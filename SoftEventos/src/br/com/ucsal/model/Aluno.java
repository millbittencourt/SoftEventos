package br.com.ucsal.model;

import javax.persistence.*;

@Entity
@Table(name = "Alunos")
@PrimaryKeyJoinColumn(name = "id")
public class Aluno extends Usuario {

	private String nome;
	private String cpf;
	private String telefone;
	private String curso;
	private String turma;

	public Aluno() {
		super();
	}

	public Aluno(String login, String senha, String email, String nome, String cpf, String telefone, String curso,
			String turma, boolean verificacao) {

		super(login, senha, email, verificacao);
		this.nome = nome;
		this.cpf = cpf;
		this.telefone = telefone;
		this.curso = curso;
		this.turma = turma;

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

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public String getTurma() {
		return turma;
	}

	public void setTurma(String turma) {
		this.turma = turma;
	}
}