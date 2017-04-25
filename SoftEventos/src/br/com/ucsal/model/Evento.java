package br.com.ucsal.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Eventos")
public class Evento {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	private String nome;
	private String local;
	
	@Temporal(TemporalType.DATE)
	private Date data;
	
	@Temporal(TemporalType.TIME)
	private Date hora;
	
	@ManyToOne
	@JoinColumn(name="id_professor", referencedColumnName="id")
	private Professor professor;
	
	private String descricao;
	private String organizador;
	private String palestrante;
	
	private int quantidade;
	
	
	public Evento() {
		/*A taglib precisa de um construtor vazio*/
	}
	
	
	
	public Evento(String nome, String local, Date data, Date hora, Professor professor, String descricao,
			String organizador, String palestrante, int quantidade) {
		super();
		this.nome = nome;
		this.local = local;
		this.data = data;
		this.hora = hora;
		this.professor = professor;
		this.descricao = descricao;
		this.organizador = organizador;
		this.palestrante = palestrante;
		this.quantidade = quantidade;
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Date getHora() {
		return hora;
	}

	public void setHora(Date hora) {
		this.hora = hora;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getOrganizador() {
		return organizador;
	}

	public void setOrganizador(String organizador) {
		this.organizador = organizador;
	}

	public String getPalestrante() {
		return palestrante;
	}

	public void setPalestrante(String palestrante) {
		this.palestrante = palestrante;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}



	public Professor getProfessor() {
		return professor;
	}



	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
	
	
}
