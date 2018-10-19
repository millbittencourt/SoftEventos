package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.model.Curso;

public class CursoDAO {
	
	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static void adcionarCurso(Curso curso){
		banco.getTransaction().begin();
		banco.persist(curso);
		banco.getTransaction().commit();
	}
	
	public static List<Curso> getCursos(){
		List<Curso> cursos = null;
		banco.getTransaction().begin();
		try{
			cursos = (List<Curso>) banco.createQuery("from Curso").getResultList();
		}finally {
			banco.getTransaction().commit();
		}
		return cursos;
	}
	
	public static void removerCurso(Curso curso){
		banco.getTransaction().begin();
		banco.remove(curso);;
		banco.getTransaction().commit();
	}


}
