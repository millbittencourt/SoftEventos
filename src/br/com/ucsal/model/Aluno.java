package br.com.ucsal.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "alunos")
@PrimaryKeyJoinColumn(name = "id")
public class Aluno extends Usuario {

	private String curso;
	private String turma;
	
	public Aluno() {
	}

	public Aluno(String login, String senha, String nome, String telefone, String cpf, String email, boolean verificado,
			String curso, String turma) {
		super(login, senha, nome, telefone, cpf, email, verificado);
		this.curso = curso;
		this.turma = turma;
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
