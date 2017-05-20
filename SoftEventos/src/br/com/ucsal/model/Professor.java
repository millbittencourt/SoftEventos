package br.com.ucsal.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "professores")
@PrimaryKeyJoinColumn(name = "id")
public class Professor extends Usuario {
	
	public Professor() {
	}
	
	public Professor(String login, String senha, String nome, String telefone, String cpf, String email,
			boolean verificado) {
		super(login, senha, nome, telefone, cpf, email, verificado);
	}
	
	

}
