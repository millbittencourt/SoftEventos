package br.com.ucsal.dao;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Professor;;

public class ProfessorDAO {


	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void criarProfessor(Professor professor){
		
		banco.getTransaction().begin();
		banco.persist(professor);
		banco.getTransaction().commit();
	}
	

	public static Professor pegarProfessor(long id){
		
		banco.getTransaction().begin();
		Professor professor = banco.find(Professor.class, id);
		banco.getTransaction().commit();
		
		return professor;
	}
	
	
	public static void removerProfessor(Professor professor){
		
		banco.getTransaction().begin();
		banco.remove(professor);
		banco.getTransaction().commit();
	}
	
	public static void modificarProfessor(Professor professor){
		
		banco.getTransaction().begin();
		banco.merge(professor);
		banco.getTransaction().commit();
	}
}
