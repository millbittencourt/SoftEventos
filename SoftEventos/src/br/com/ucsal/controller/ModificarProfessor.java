package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.ProfessorDAO;
import br.com.ucsal.model.Professor;

/**
 * Servlet implementation class ModificarProfessor
 */
@WebServlet("/ModificarProfessor")
public class ModificarProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarProfessor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Professor professor = (Professor) request.getSession().getAttribute("usuario");
		
		professor.setLogin(request.getParameter("login"));
		professor.setSenha(request.getParameter("senha"));
		professor.setEmail(request.getParameter("email"));
		professor.setTelefone(request.getParameter("telefone"));
		
		ProfessorDAO.modificarProfessor(professor);
		
		response.sendRedirect("home_professor.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
