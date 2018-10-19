package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.InscricaoDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Inscricao;

/**
 * Servlet implementation class InscreverseEvento
 */
@WebServlet("/InscreverseEvento")
public class InscreverseEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InscreverseEvento() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Aluno aluno = (Aluno) request.getSession().getAttribute("conta");

		Inscricao inscricao = new Inscricao(aluno, EventoDAO.getEvento(Integer.parseInt(request.getParameter("id"))),
				false);
		
		InscricaoDAO.criarInscricao(inscricao);

		response.sendRedirect("eventos.jsp");
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
