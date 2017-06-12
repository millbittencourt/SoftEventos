package br.com.ucsal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.exeptions.DadoUnicoJaExistenteExeption;
import br.com.ucsal.model.Usuario;
import br.com.ucsal.util.ValidadorUtil;

/**
 * Servlet implementation class ModificarConta
 */
@WebServlet("/ModificarConta")
public class ModificarConta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarConta() {
		super();
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario usuario = (Usuario) request.getSession().getAttribute("conta");

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");

		System.out.println(login + " " + senha + " " + email + " " + telefone);
		System.out.println(login == null);

		try {

			usuario.setSenha(senha == null ? usuario.getSenha() : senha);
			usuario.setTelefone(telefone == null ? usuario.getTelefone() : telefone);

			usuario.setLogin(
					login == null ? usuario.getLogin() : (String) ValidadorUtil.validarDadoUnicoConta(login, "login"));

			usuario.setEmail(
					email == null ? usuario.getEmail() : (String) ValidadorUtil.validarDadoUnicoUsuario(email, "email"));

			ContaDAO.modificarConta(usuario);

		} catch (DadoUnicoJaExistenteExeption e) {
			request.setAttribute("erro", e.getMessage().toString());
			request.getRequestDispatcher("modificar_conta.jsp").forward(request, response);
		}

		response.sendRedirect("home.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
