package br.com.ucsal.model;

import javax.persistence.*;

@Entity
@Table(name = "Administradores")
@PrimaryKeyJoinColumn(name = "id")
public class Administrador extends Usuario {

	int nivel;

	public Administrador() {
		super();

	}

	public Administrador(String login, String senha, int nivel) {
		super(login, senha);
		this.nivel = nivel;
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

}