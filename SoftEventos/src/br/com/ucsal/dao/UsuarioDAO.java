package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.ucsal.model.Usuario;

public class UsuarioDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static Usuario getUsuario(long id) throws NoResultException {

		banco.getTransaction().begin();
		Usuario usuario = banco.find(Usuario.class, id);
		banco.getTransaction().commit();

		return usuario;
	}

	public static void modificarUsuario(Usuario usuario) {

		banco.getTransaction().begin();
		banco.merge(usuario);
		banco.getTransaction().commit();

	}

	public static void removerUsusario(Usuario usuario) {

		banco.getTransaction().begin();
		banco.merge(usuario);
		banco.remove(usuario);
		banco.getTransaction().commit();
	}

	public static List<Usuario> getUsuariosNaoVerificados() {
		List<Usuario> usuarios = null;
		banco.getTransaction().begin();
		try {
			usuarios = (List<Usuario>) banco.createQuery("from Usuario where verificado=:verificado")
					.setParameter("verificado", false).getResultList();
		} finally {
			banco.getTransaction().commit();
		}

		return usuarios;
	}

	public static boolean isExisteParametro(Object parametro, String nomeParametro) {

		String hql = "SELECT us FROM Usuario As us WHERE us." + nomeParametro + "=:" + nomeParametro;
		Usuario usuario;
		banco.getTransaction().begin();
		try {
			usuario = (Usuario) banco.createQuery(hql).setParameter(nomeParametro, parametro).getSingleResult();
		} finally {
			banco.getTransaction().commit();
		}

		return usuario != null;

	}

}
