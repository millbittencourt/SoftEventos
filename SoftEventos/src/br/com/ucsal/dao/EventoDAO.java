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
		

		banco.getTransaction().begin();
		Evento evento = banco.find(Evento.class, id);
		banco.getTransaction().commit();
	
		
		return evento;
		
	}
	
	public static void modificarEvento(Evento evento){
		
		banco.getTransaction().begin();
		banco.merge(evento);
		banco.getTransaction().commit();
		
		
	}
}
