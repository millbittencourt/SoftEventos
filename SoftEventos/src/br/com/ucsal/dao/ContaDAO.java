package br.com.ucsal.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.ucsal.model.Conta;

public class ContaDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static Conta autenticarConta(String login, String senha) throws NoResultException {
		Conta conta = null;

		String hql = "SELECT con FROM Conta As con WHERE con.login=:login AND con.senha=:senha";
		
		banco.getTransaction().begin();
		try {
			conta = (Conta) banco.createQuery(hql).setParameter("login", login).setParameter("senha", senha)
					.getSingleResult();			
		} finally {
			banco.getTransaction().commit();
		}

		return conta;
	}
	
	public static boolean isExisteParametro(Object parametro, String nomeParametro){

		String hql = "SELECT con FROM Conta As con WHERE con." + nomeParametro + "=:" + nomeParametro;
		Conta conta;
		banco.getTransaction().begin();
		try {
			 conta = (Conta) banco.createQuery(hql).setParameter(nomeParametro, parametro).getSingleResult();		
		} finally {
			banco.getTransaction().commit();
		}

		return conta != null;
	} 
	
	public static void removerConta(Conta conta){
		banco.getTransaction().begin();
		banco.remove(conta);
		banco.getTransaction().commit();
	}
	
	public static void modificarConta(Conta conta){
		banco.getTransaction().begin();
		banco.merge(conta);
		banco.getTransaction().commit();
	}

}
