package br.com.ucsal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Inscricoes")
public class Inscricao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@ManyToOne
	@JoinColumn(name="id_aluno", referencedColumnName="id")
	private Aluno aluno;

	@ManyToOne
	@JoinColumn(name="id_evento", referencedColumnName="id")
	private Evento evento;
	
	
	private boolean presenca;
	
	public Inscricao() {
	}

	public Inscricao(Aluno aluno, Evento evento, boolean presenca) {
		super();
		this.aluno = aluno;
		this.evento = evento;
		this.presenca = presenca;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public Aluno getAluno() {
		return aluno;
	}


	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}


	public Evento getEvento() {
		return evento;
	}


	public void setEvento(Evento evento) {
		this.evento = evento;
	}


	public boolean isPresenca() {
		return presenca;
	}


	public void setPresenca(boolean presenca) {
		this.presenca = presenca;
	}
	
	
}
