package br.com.ucsal.dao;

import javax.persistence.EntityManager;

import br.com.ucsal.dao.BancoUtil;
import br.com.ucsal.model.Administrador;
import br.com.ucsal.model.Usuario;

public class UsuarioDAO {
	
	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static Usuario autenticar(Usuario usuario){
		
		String hql = "SELECT us FROM Usuario As us WHERE us.login=:login AND us.senha=:senha";
		
		Usuario aux = null;
		
		try {
			
			aux = (Usuario) banco.createQuery(hql)
					.setParameter("login", usuario.getLogin())
					.setParameter("senha", usuario.getSenha())
					.getSingleResult();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return aux;
		
	}
	
	public static boolean isExists(Usuario usuario){
		
		boolean existe = false;
		
		String hql = "SELECT us FROM Usuario As us WHERE us.login=:login AND us.senha=:senha";
		
		try {
			
			Usuario aux = (Usuario) banco.createQuery(hql)
					.setParameter("login", usuario.getLogin())
					.setParameter("senha", usuario.getSenha())
					.getSingleResult();
			
			existe = aux != null;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return existe;
		
	}
	
	
	
}
