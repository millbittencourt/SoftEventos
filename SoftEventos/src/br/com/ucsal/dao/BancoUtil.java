package br.com.ucsal.dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceUnit;

public class BancoUtil {

	@PersistenceUnit
	private EntityManagerFactory conexcao = Persistence.createEntityManagerFactory("softeventos");

	private static BancoUtil instancia;

	public BancoUtil() {

	}

	public static BancoUtil getInstancia() {

		if (instancia == null) {
			instancia = new BancoUtil();
		}

		return instancia;

	}

	public EntityManagerFactory getConexcao() {
		return conexcao;
	}

}
