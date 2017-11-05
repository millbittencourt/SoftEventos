package br.com.ucsal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.InscricaoDAO;
import br.com.ucsal.model.Inscricao;
import br.com.ucsal.util.mail.EnviarEmail;

/**
 * Servlet implementation class EnviarEmailParaAlunos
 */
@WebServlet("/EnviarEmailParaAlunos")
public class EnviarEmailParaAlunos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EnviarEmailParaAlunos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String assunto = request.getParameter("titulo");
		String mensagem = request.getParameter("mensagem");
		String id = request.getParameter("id");
		List<Inscricao> inscricoes = InscricaoDAO.getEmailsAlunosEvento(EventoDAO.getEvento(Long.parseLong(id)));

		List<String> destinatarios = new ArrayList<>();

		for (Inscricao inscricao : inscricoes) {
			destinatarios.add(inscricao.getAluno().getEmail());
		}
	
		try {
			EnviarEmail.simples(assunto, "<p>"+mensagem+"</p>", "text/html", destinatarios);
			response.sendRedirect("adm_evento.jsp?id=" + id);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erro", e.getMessage());
			request.getRequestDispatcher("adm_evento.jsp?id=" + id).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
