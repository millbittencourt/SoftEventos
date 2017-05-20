package br.com.ucsal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.InscricaoDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Professor;
import br.com.ucsal.model.Usuario;

/**
 * Servlet implementation class DeletarConta
 */
@WebServlet("/DeletarUsuario")
public class DeletarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeletarUsuario() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario usuario = (Usuario) request.getSession().getAttribute("conta");

		if (usuario instanceof Aluno) {
			InscricaoDAO.removerInscricaoAluno((Aluno) usuario);
			
		} else if (usuario instanceof Professor) {
			EventoDAO.removerEventosProfessor((Professor) usuario);
			
		}
		
		ContaDAO.removerConta(usuario);
		request.getSession().removeAttribute("conta");

		response.sendRedirect("index.jsp");
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
