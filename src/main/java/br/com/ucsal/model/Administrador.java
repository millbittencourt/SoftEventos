package br.com.ucsal.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "administradores")
@PrimaryKeyJoinColumn(name = "id")
public class Administrador extends Conta {
	
	private int tipo;
	
	public Administrador() {
	}
	
	public Administrador(String login, String senha, int tipo) {
		super(login, senha);
		this.tipo = tipo;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}	

}
