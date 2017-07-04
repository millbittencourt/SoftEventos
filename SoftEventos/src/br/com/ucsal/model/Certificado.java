package br.com.ucsal.model;

public class Certificado {
	
	private String nomeEvento;
	
	private String data;
	
	private String local;
	
	private String duracao;
	
	private String nomeAluno;
	
	private String nomeProfessor;
	
	private String nomePalestrante;
	
	private String nomeOrganizacao;
	
	public Certificado() {
		// TODO Auto-generated constructor stub
	}

	public Certificado(String nomeEvento, String data, String local, String duracao, String nomeAluno,
			String nomeProfessor, String nomePalestrante, String nomeOrganizacao) {
		super();
		this.nomeEvento = nomeEvento;
		this.data = data;
		this.local = local;
		this.duracao = duracao;
		this.nomeAluno = nomeAluno;
		this.nomeProfessor = nomeProfessor;
		this.nomePalestrante = nomePalestrante;
		this.nomeOrganizacao = nomeOrganizacao;
	}

	public String getNomeEvento() {
		return nomeEvento;
	}

	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getDuracao() {
		return duracao;
	}

	public void setDuracao(String duracao) {
		this.duracao = duracao;
	}

	public String getNomeAluno() {
		return nomeAluno;
	}

	public void setNomeAluno(String nomeAluno) {
		this.nomeAluno = nomeAluno;
	}

	public String getNomeProfessor() {
		return nomeProfessor;
	}

	public void setNomeProfessor(String nomeProfessor) {
		this.nomeProfessor = nomeProfessor;
	}

	public String getNomePalestrante() {
		return nomePalestrante;
	}

	public void setNomePalestrante(String nomePalestrante) {
		this.nomePalestrante = nomePalestrante;
	}

	public String getNomeOrganizacao() {
		return nomeOrganizacao;
	}

	public void setNomeOrganizacao(String nomeOrganizacao) {
		this.nomeOrganizacao = nomeOrganizacao;
	}

	
	
}
