package br.com.ucsal.DAO;

import javax.persistence.EntityManager;
import br.com.ucsal.DAO.BancoUtil;
import br.com.ucsal.model.Administrador;
import br.com.ucsal.model.Usuario;

public class UsuarioDAO {
	
	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();
	
	public static boolean Autenticar(Usuario usuario){
		
		boolean permissao = false;
		
		String hql = "SELECT us FROM ususarios As us WHERE us.login=:login AND us.senha=:senha";
		
		try {
			
			Usuario aux = (Usuario) banco.createQuery(hql)
					.setParameter("login", usuario.getLogin())
					.setParameter("senha", usuario.getSenha())
					.getSingleResult();
			
			permissao = aux != null;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return permissao;
		
	}
	
	public static void teste(){
		
		Administrador ad = new Administrador("beta", "456", 1);
		
		banco.getTransaction().begin();
		banco.persist(ad);
		banco.getTransaction().commit();
		
	}
	
}
