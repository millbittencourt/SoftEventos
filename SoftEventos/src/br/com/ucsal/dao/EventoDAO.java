package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Usuario;

public class EventoDAO {
	
	public EventoDAO() {
	}

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void criarEvento(Evento ev){
		
		banco.getTransaction().begin();
		banco.persist(ev);
		banco.getTransaction().commit();
	}
	

	public static List<Evento> getEventos(){
		
		List<Evento> eventos = (List<Evento>) banco.createQuery("from Evento").getResultList();
		return eventos;
	}
	
	public static Evento getEvento(long id){
		
		String hql = "SELECT ev FROM Evento As ev WHERE ev.id=:id";
		
		Evento aux = null;
		
		try {
			
			aux = (Evento) banco.createQuery(hql)
					.setParameter("id", id)
					.getSingleResult();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return aux;
		
	}
}
