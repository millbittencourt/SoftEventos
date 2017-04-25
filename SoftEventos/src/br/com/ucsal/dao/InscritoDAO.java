package br.com.ucsal.dao;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Inscrito;

public class InscritoDAO {
	

	public InscritoDAO() {
	}

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void criarInscrito(Inscrito inscrito){
		
		banco.getTransaction().begin();
		banco.persist(inscrito);
		banco.getTransaction().commit();
	}
	

}
