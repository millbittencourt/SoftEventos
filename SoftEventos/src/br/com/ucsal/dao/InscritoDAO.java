package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Inscricao;

public class InscritoDAO {
	

	public InscritoDAO() {
	}

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void criarInscricao(Inscricao inscricao){
		
		banco.getTransaction().begin();
		banco.persist(inscricao);
		banco.getTransaction().commit();
	}
	
	public static List<Inscricao> getInscricoesAluno(Aluno aluno){
		
		String hql = "from Inscricao WHERE aluno=:aluno";
		
		banco.getTransaction().begin();
		List<Inscricao> inscricoes = (List<Inscricao>)
				banco.createQuery(hql).setParameter("aluno", aluno).getResultList();
		banco.getTransaction().commit();
		
		return inscricoes;
		
	}
	
	

}
