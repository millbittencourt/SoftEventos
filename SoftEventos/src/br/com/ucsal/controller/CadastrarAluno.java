package br.com.ucsal.controller;

 import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.model.Aluno;
import br.com.ucsal.dao.AlunoDAO;
import br.com.ucsal.util.ValidadorUtil;
import br.com.ucsal.exeptions.DadoUnicoJaExistenteExeption;

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

		try {

			Aluno aluno = new Aluno(request.getParameter("login"), request.getParameter("senha"),
					request.getParameter("nome"), request.getParameter("telefone"), request.getParameter("cpf"),
					request.getParameter("email"), false, request.getParameter("curso"), 
					request.getParameter("turma"));
			
			ValidadorUtil.validarDadoUnicoConta(aluno.getLogin(), "login");
			ValidadorUtil.validarDadoUnicoUsuario(aluno.getEmail(), "email");
			//ValidadorUtil.validarDadoUnicoUsuario(aluno.getCpf(), "cpf");

			AlunoDAO.criarAluno(aluno);

			response.sendRedirect("login.jsp");
			response.getWriter().append("Served at: ").append(request.getContextPath());

		} catch (DadoUnicoJaExistenteExeption e) {

			request.setAttribute("erro", e.getMessage().toString());
			request.getRequestDispatcher("cadastrar_aluno.jsp").forward(request, response);

		}
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
