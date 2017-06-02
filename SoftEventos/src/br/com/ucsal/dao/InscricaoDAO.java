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

	public static void removerInscricaoAluno(Aluno aluno) {
		List<Inscricao> inscricoes = getInscricoesAluno(aluno);

		for (Inscricao inscricao : inscricoes) {
			removerInscricao(inscricao);
		}

	}

}
