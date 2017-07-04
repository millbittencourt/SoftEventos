package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Professor;;

public class ProfessorDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static void criarProfessor(Professor professor) throws NoResultException {

		banco.getTransaction().begin();
		banco.persist(professor);
		banco.getTransaction().commit();
	}

	public static Professor pegarProfessor(long id) {

		banco.getTransaction().begin();
		Professor professor = banco.find(Professor.class, id);
		banco.getTransaction().commit();

		return professor;
	}

	public static void modificarProfessor(Professor professor) {

		banco.getTransaction().begin();
		banco.merge(professor);
		banco.getTransaction().commit();
	}
	
	public static List<Professor> getProfessoresNaoVerificados() {

		String hql = "from Professor where verificado=:verificado";
		List<Professor> professores = null;

		banco.getTransaction().begin();
		try {
			professores = (List<Professor>) banco.createQuery(hql).setParameter("verificado", false).getResultList();
		} finally {
			banco.getTransaction().commit();
		}
		return professores;
	}

}
