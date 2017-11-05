package br.com.ucsal.controller;

 import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.ContaDAO;
import br.com.ucsal.model.Conta;

@WebServlet("/AutenticarConta")
public class AutenticarConta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AutenticarConta() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		try {

			Conta conta = ContaDAO.autenticarConta(login, senha);
			
			request.getSession().setAttribute("conta", conta);
			response.sendRedirect(request.getHeader("REFERER"));

		} catch (NoResultException e) {

			request.setAttribute("erro", "Usuário ou Senha inválidos");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
