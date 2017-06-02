package br.com.ucsal.model;

import java.util.Date;

import javax.persistence.Column;
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
@Table(name = "eventos")
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String nome;
	private String local;

	@Temporal(TemporalType.DATE)
	private Date data;

	@Temporal(TemporalType.TIME)
	private Date horaComeco;

	@Temporal(TemporalType.TIME)
	private Date horaTermino;

	@ManyToOne
	@JoinColumn(name = "id_professor", referencedColumnName = "id")
	private Professor professor;

	@Column(length = 140)
	private String descricao;
	private String organizador;
	private String palestrante;

	private Integer quantidade;
	private Long qrcode;

	public Evento() {
	}

	public Evento(String nome, String local, Date data, Date horaComeco, Date horaTermino, Professor professor,
			String descricao, String organizador, String palestrante, Integer quantidade) {
		super();
		this.nome = nome;
		this.local = local;
		this.data = data;
		this.horaComeco = horaComeco;
		this.horaTermino = horaTermino;
		this.professor = professor;
		this.descricao = descricao;
		this.organizador = organizador;
		this.palestrante = palestrante;
		this.quantidade = quantidade;
		this.qrcode = (long) hashCode();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((horaComeco == null) ? 0 : horaComeco.hashCode());
		result = prime * result + ((horaTermino == null) ? 0 : horaTermino.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((organizador == null) ? 0 : organizador.hashCode());
		result = prime * result + ((palestrante == null) ? 0 : palestrante.hashCode());
		result = prime * result + ((professor == null) ? 0 : professor.hashCode());
		result = prime * result + ((quantidade == null) ? 0 : quantidade.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Evento other = (Evento) obj;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (horaComeco == null) {
			if (other.horaComeco != null)
				return false;
		} else if (!horaComeco.equals(other.horaComeco))
			return false;
		if (horaTermino == null) {
			if (other.horaTermino != null)
				return false;
		} else if (!horaTermino.equals(other.horaTermino))
			return false;
		if (id != other.id)
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (organizador == null) {
			if (other.organizador != null)
				return false;
		} else if (!organizador.equals(other.organizador))
			return false;
		if (palestrante == null) {
			if (other.palestrante != null)
				return false;
		} else if (!palestrante.equals(other.palestrante))
			return false;
		if (professor == null) {
			if (other.professor != null)
				return false;
		} else if (!professor.equals(other.professor))
			return false;
		if (quantidade == null) {
			if (other.quantidade != null)
				return false;
		} else if (!quantidade.equals(other.quantidade))
			return false;
		return true;
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

	public Date getHoraComeco() {
		return horaComeco;
	}

	public void setHoraComeco(Date horaComeco) {
		this.horaComeco = horaComeco;
	}

	public Date getHoraTermino() {
		return horaTermino;
	}

	public void setHoraTermino(Date horaTermino) {
		this.horaTermino = horaTermino;
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

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Long getQrcode() {
		return qrcode;
	}

	public void setQrcode(Long qrcode) {
		this.qrcode = qrcode;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

}
