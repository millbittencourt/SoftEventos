package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.ProfessorDAO;
import br.com.ucsal.exeptions.DadoUnicoJaExistenteExeption;
import br.com.ucsal.model.Professor;
import br.com.ucsal.util.ValidadorUtil;

/**
 * Servlet implementation class CadastrarProfessor
 */
@WebServlet("/CadastrarProfessor")
public class CadastrarProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarProfessor() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			
		Professor professor = new Professor(request.getParameter("login"), request.getParameter("senha"),
				request.getParameter("nome"), request.getParameter("telefone"), request.getParameter("cpf"),
				request.getParameter("email"), false);

		ValidadorUtil.validarDadoUnicoConta(professor.getLogin(), "login");
		ValidadorUtil.validarDadoUnicoUsuario(professor.getEmail(), "email");
		ValidadorUtil.validarDadoUnicoUsuario(professor.getCpf(), "cpf");
		
		ProfessorDAO.criarProfessor(professor);
		
		response.sendRedirect("index.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	} catch (DadoUnicoJaExistenteExeption e) {
		request.setAttribute("erro", e.getMessage().toString());
		request.getRequestDispatcher("cadastrar_professor.jsp").forward(request, response);

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
