package br.com.ucsal.dao;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Aluno;

public class AlunoDAO {
	
	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void criarAluno(Aluno aluno){
		
		banco.getTransaction().begin();
		banco.persist(aluno);
		banco.getTransaction().commit();
	}
	

	public static Aluno pegarAluno(long id){
		
		banco.getTransaction().begin();
		Aluno aluno = banco.find(Aluno.class, id);
		banco.getTransaction().commit();
		return aluno;
		
	}
	
	
	public static void modificarAluno(Aluno aluno){
		
		banco.getTransaction().begin();
		banco.merge(aluno);
		banco.getTransaction().commit();
		
	}
	
	public static void removerAluno(Aluno aluno){
		
		banco.getTransaction().begin();
		banco.remove(aluno);
		banco.getTransaction().commit();
		
	}


}
