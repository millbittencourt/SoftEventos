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
 * Servlet implementation class ModificarAluno
 */
@WebServlet("/ModificarAluno")
public class ModificarAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarAluno() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Aluno aluno = (Aluno) request.getSession().getAttribute("usuario");
		
		aluno.setLogin(request.getParameter("login"));
		aluno.setSenha(request.getParameter("senha"));
		aluno.setEmail(request.getParameter("email"));
		aluno.setTelefone(request.getParameter("telefone"));
		
		AlunoDAO.modificarAluno(aluno);
		response.sendRedirect("home_aluno.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
