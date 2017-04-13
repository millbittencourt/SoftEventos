package br.com.ucsal.DAO;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Evento;

public class EventoDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void create(Evento ev){
		
		banco.getTransaction().begin();
		banco.persist(ev);
		banco.getTransaction().commit();
	}
}
