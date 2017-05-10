package br.com.ucsal.util;

 import javax.persistence.NoResultException;

import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.dao.UsuarioDAO;
import br.com.ucsal.exeptions.DadoUnicoJaExistenteExeption;

public class ValidadorUtil {

	private final static String MENSAGEM = "Já exite um usuário com o mesmo %s";
	/*
	 * private static void validarNullUsuario(Usuario usuario) { }
	 * 
	 * public static void validaNullrAluno(Aluno aluno){ }
	 * 
	 * public static void validarProfessor(Professor professor){ }
	 * 
	 */

	public static void validarDadoUnicoUsuario(Object parametro, String nomeParametro) throws DadoUnicoJaExistenteExeption {
		try {
			
			if (UsuarioDAO.isExisteParametro(parametro, nomeParametro)) {
				throw new DadoUnicoJaExistenteExeption(String.format(MENSAGEM, nomeParametro));
			}

		} catch (NoResultException e) {	}
	}
	
	public static void validarDadoUnicoConta(Object parametro, String nomeParametro) throws DadoUnicoJaExistenteExeption {
		try {
			
			if (ContaDAO.isExisteParametro(parametro, nomeParametro)) {
				throw new DadoUnicoJaExistenteExeption(String.format(MENSAGEM, nomeParametro));
			}

		} catch (NoResultException e) {	}
	}

}
