package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.UsuarioDAO;
import br.com.ucsal.model.Usuario;

/**
 * Servlet implementation class ApagarUsuario
 */
@WebServlet("/ConfirmarUsuario")
public class ConfirmarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfirmarUsuario() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("3");
		Usuario usuario = UsuarioDAO.getUsuario(Integer.parseInt(request.getParameter("id")));

		if ("s".equals(request.getParameter("conf"))) {
			System.out.println("3.1");
			usuario.setVerificacao(true);
			UsuarioDAO.modificarUsuario(usuario);
			System.out.println("3.12");
		} else {
			System.out.println("3.2");
			UsuarioDAO.removerUsusario(usuario);
			System.out.println("3.22");
		}
		System.out.println("4");
		response.sendRedirect("home-administrador.jsp");
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
