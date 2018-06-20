package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Inscricao;

public class InscricaoDAO {

	public InscricaoDAO() {
	}

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static void criarInscricao(Inscricao inscricao) {

		banco.getTransaction().begin();
		banco.persist(inscricao);
		banco.getTransaction().commit();
	}

	public static List<Inscricao> getInscricoesAluno(Aluno aluno) {

		String hql = "from Inscricao WHERE aluno=:aluno";
		List<Inscricao> inscricoes = null;

		banco.getTransaction().begin();
		try {
			inscricoes = (List<Inscricao>) banco.createQuery(hql).setParameter("aluno", aluno).getResultList();

		} finally {
			banco.getTransaction().commit();
		}

		return inscricoes;

	}

	public static boolean isInscrito(Aluno aluno, Evento evento) {

		banco.getTransaction().begin();

		String hql = "SELECT ins FROM Inscricao As ins WHERE ins.aluno=:aluno and ins.evento=:evento";
		try {
			Inscricao inscricao = (Inscricao) banco.createQuery(hql).setParameter("aluno", aluno)
					.setParameter("evento", evento).getSingleResult();
			return inscricao != null;
		} catch (NoResultException e) {
			return false;
		} finally {
			banco.getTransaction().commit();
		}
	}

	public static void removerInscricao(Inscricao inscricao) {
		banco.getTransaction().begin();
		banco.remove(inscricao);
		banco.getTransaction().commit();
	}

	public static void removerInscricao(Aluno aluno, Evento evento) {
		banco.getTransaction().begin();

		String hql = "Delete Inscricao As ins WHERE ins.aluno=:aluno and ins.evento=:evento";
		try {
			banco.createQuery(hql).setParameter("aluno", aluno).setParameter("evento", evento).executeUpdate();

		} finally {
			banco.getTransaction().commit();
		}
	}

	public static void removerInscricoesAluno(Aluno aluno) {
		banco.getTransaction().begin();

		String hql = "Delete Inscricao As ins WHERE ins.aluno=:aluno";
		try {
			banco.createQuery(hql).setParameter("aluno", aluno).executeUpdate();
		} finally {
			banco.getTransaction().commit();
		}

	}

	public static void confirmarPresenca(Aluno aluno, Evento evento) {
		banco.getTransaction().begin();

		String hql = "update Inscricao As ins set ins.presente=:presente WHERE ins.aluno=:aluno and ins.evento=:evento";
		try {
			banco.createQuery(hql).setParameter("presente", true).setParameter("aluno", aluno)
					.setParameter("evento", evento).executeUpdate();
		} finally {
			banco.getTransaction().commit();
		}

	}

	public static List<Inscricao> getEmailsAlunosEvento(Evento evento) {
		banco.getTransaction().begin();

		String hql = "from Inscricao where evento=:evento";
		List<Inscricao> inscricoes = null;
		try {
			inscricoes = (List<Inscricao>) banco.createQuery(hql).setParameter("evento", evento).getResultList();
		} finally {
			banco.getTransaction().commit();
		}
		return inscricoes;
	}

	public static long getQtdInscricoesEvento(Evento evento) {
		banco.getTransaction().begin();
		long qtd = 0;
		try {
			qtd = (long) banco.createQuery("select count(*) from Inscricao where evento=:evento")
					.setParameter("evento", evento).getSingleResult();
		} finally {
			banco.getTransaction().commit();
		}
		return qtd;
	}

}
