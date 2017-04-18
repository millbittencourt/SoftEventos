package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.AlunoDAO;
import br.com.ucsal.model.Aluno;

/**
 * Servlet implementation class CadastrarEvento
 */
@WebServlet("/CadastrarAluno")
public class CadastrarAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarAluno() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Aluno aluno = new Aluno(request.getParameter("login"), request.getParameter("senha"),
				request.getParameter("email"), request.getParameter("nome"), request.getParameter("cpf"),
				request.getParameter("telefone"), request.getParameter("curso"), request.getParameter("turma"));

		AlunoDAO.criarAluno(aluno);

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
