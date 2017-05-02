package br.com.ucsal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.ucsal.dao.BancoUtil;
import br.com.ucsal.model.Administrador;
import br.com.ucsal.model.Usuario;

public class UsuarioDAO {

	private static EntityManager banco = BancoUtil.getInstancia().getConexcao().createEntityManager();

	public static Usuario autenticar(Usuario usuario) {

		String hql = "SELECT us FROM Usuario As us WHERE us.login=:login AND us.senha=:senha";

		Usuario aux = null;
																															
		aux = (Usuario) banco.createQuery(hql).setParameter("login", usuario.getLogin())
				.setParameter("senha", usuario.getSenha()).getSingleResult();

		return aux;

	}

	public static boolean isExists(Usuario usuario) {

		boolean existe = false;

		String hql = "SELECT us FROM Usuario As us WHERE us.login=:login AND us.senha=:senha";

		try {

			Usuario aux = (Usuario) banco.createQuery(hql).setParameter("login", usuario.getLogin())
					.setParameter("senha", usuario.getSenha()).getSingleResult();

			existe = aux != null;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return existe;

	}

	public static Usuario getUsuario(long id) {

		banco.getTransaction().begin();
		Usuario usuario = banco.find(Usuario.class, id);
		banco.getTransaction().commit();

		return usuario;
	}

	public static void removerUsusario(Usuario usuario) {

		banco.getTransaction().begin();
		banco.remove(usuario);
		banco.getTransaction().commit();
	}

	public static List<Usuario> getUsuariosNaoVerificados() {
		
		banco.getTransaction().begin();
		List<Usuario> usuarios = (List<Usuario>) banco.createQuery("from Usuario where verificacao=:verificacao")
				.setParameter("verificacao", false).getResultList();
		banco.getTransaction().commit();

		return usuarios;
	}

	public static void modificarUsuario(Usuario usuario) {

		banco.getTransaction().begin();
		banco.merge(usuario);
		banco.getTransaction().commit();

	}

	private static void teste() {

		Administrador adm = new Administrador("adm", "adm", "ad@ad", 1);

		banco.getTransaction().begin();
		banco.persist(adm);
		banco.getTransaction().commit();

	}

}
