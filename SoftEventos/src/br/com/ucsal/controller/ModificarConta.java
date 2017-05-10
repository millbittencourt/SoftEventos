package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.AlunoDAO;
import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Usuario;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("conta");
		
		usuario.setLogin(request.getParameter("login"));
		usuario.setSenha(request.getParameter("senha"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setTelefone(request.getParameter("telefone"));
		
		ContaDAO.modificarConta(usuario);
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
