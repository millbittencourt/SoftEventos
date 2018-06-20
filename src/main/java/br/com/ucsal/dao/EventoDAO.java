package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Professor;

public class EventoDAO {

	public EventoDAO() {
	}

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static void criarEvento(Evento ev) {

		banco.getTransaction().begin();
		try {
			banco.persist(ev);
		} finally {
			banco.getTransaction().commit();
		}
	}

	public static List<Evento> getEventos() {
		List<Evento> eventos = null;
		banco.getTransaction().begin();
		try {
			eventos = (List<Evento>) banco.createQuery("from Evento").getResultList();
		} finally {
			banco.getTransaction().commit();
		}

		return eventos;
	}

	public static Evento getEvento(long id) {

		banco.getTransaction().begin();
		try {
			Evento evento = banco.find(Evento.class, id);
			return evento;
		} finally {
			banco.getTransaction().commit();
		}

	}

	public static void modificarEvento(Evento evento) {

		banco.getTransaction().begin();
		try {
			banco.merge(evento);
		} finally {
			banco.getTransaction().commit();
		}

	}

	public static List<Evento> getEventosProfessor(Professor professor) {

		String hql = "from Evento WHERE professor=:professor";
		List<Evento> eventos = null;
		banco.getTransaction().begin();
		try {
			eventos = (List<Evento>) banco.createQuery(hql).setParameter("professor", professor).getResultList();
		} finally {
			banco.getTransaction().commit();
		}
		return eventos;

	}

	public static void removerEvento(Evento evento) {

		banco.getTransaction().begin();
		try {
			banco.remove(evento);
		} finally {
			banco.getTransaction().commit();
		}
	}

	public static void removerEventosProfessor(Professor professor) {

		List<Evento> eventos = getEventosProfessor(professor);
		for (Evento evento : eventos) {
			removerEvento(evento);
		}
	}
	
	public static Evento getEventoQrcode(long qrcode){
		String hql = "from Evento WHERE qrcode=:qrcode";
		banco.getTransaction().begin();
		Evento evento;
		try {
			evento = (Evento) banco.createQuery(hql).setParameter("qrcode", qrcode).getSingleResult();
		} finally {
			banco.getTransaction().commit();
		}
		return evento;
	}
	
	public static List<Evento> getQtdEvento(int qtd){
		String hql = "from Evento order by id desc";
		List<Evento> eventosQtd = null;
		banco.getTransaction().begin();
		try {
			eventosQtd = (List<Evento> ) banco.createQuery(hql).setMaxResults(qtd).getResultList();
		} finally {
			banco.getTransaction().commit();
		}
		return eventosQtd;
	}

}
