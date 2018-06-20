package br.com.ucsal.util;

import javax.persistence.NoResultException;

import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.dao.UsuarioDAO;
import br.com.ucsal.exeptions.DadoUnicoJaExistenteExeption;

public class ValidadorUtil {

	private final static String MENSAGEM = "Já exite um usuário com o mesmo %s";

	public static Object validarDadoUnicoUsuario(Object parametro, String nomeParametro)
			throws DadoUnicoJaExistenteExeption {

		try {

			if (UsuarioDAO.isExisteParametro(parametro, nomeParametro)) {
				throw new DadoUnicoJaExistenteExeption(String.format(MENSAGEM, nomeParametro));
			}
			return parametro;

		} catch (NoResultException e) {
			return parametro;
		}
	}

	public static Object validarDadoUnicoConta(Object parametro, String nomeParametro)
			throws DadoUnicoJaExistenteExeption {
		try {

			if (ContaDAO.isExisteParametro(parametro, nomeParametro)) {
				throw new DadoUnicoJaExistenteExeption(String.format(MENSAGEM, nomeParametro));
			}
			return parametro;

		} catch (NoResultException e) {
			return parametro;
		}
	}

}
