package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Aluno;

public class AlunoDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static void criarAluno(Aluno aluno) {

		banco.getTransaction().begin();
		banco.persist(aluno);
		banco.getTransaction().commit();
	}

	public static Aluno pegarAluno(long id) {
		Aluno aluno = null;
		banco.getTransaction().begin();
		try {
			aluno = banco.find(Aluno.class, id);
		} finally {
			banco.getTransaction().commit();
		}
		return aluno;

	}

	public static void modificarAluno(Aluno aluno) {

		banco.getTransaction().begin();
		banco.merge(aluno);
		banco.getTransaction().commit();

	}

	public static List<Aluno> getAlunosNaoVerificado() {

		String hql = "from Aluno where verificado=:verificado";
		List<Aluno> alunos = null;

		banco.getTransaction().begin();
		try {
			alunos = (List<Aluno>) banco.createQuery(hql).setParameter("verificado", false).getResultList();
		} finally {
			banco.getTransaction().commit();
		}
		return alunos;
	}
}
