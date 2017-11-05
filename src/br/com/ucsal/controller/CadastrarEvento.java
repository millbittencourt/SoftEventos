package br.com.ucsal.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Professor;

/**
 * Servlet implementation class CadastarEvento
 */
@WebServlet("/CadastrarEvento")
public class CadastrarEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarEvento() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SimpleDateFormat fData = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fHora = new SimpleDateFormat("HH:mm");

		String nome = request.getParameter("nome");
		String local = request.getParameter("local");
		Professor professor = (Professor) request.getSession().getAttribute("conta");
		String descricao = request.getParameter("descricao");
		String organizador = request.getParameter("organizador");
		String palestrante = request.getParameter("palestrante");

		String quantidadeString = request.getParameter("qtd");
		Integer quantidade = quantidadeString.equals("") ? -1 : Integer.parseInt(quantidadeString) ;
		
		
		Date data = null;
		Date horaC = null;
		Date horaT = null;

		try {

			data = fData.parse(request.getParameter("data"));
			horaC = fHora.parse(request.getParameter("hora_c"));
			horaT = fHora.parse(request.getParameter("hora_t"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		Evento evento = new Evento(nome, local, data, horaC, horaT, professor, descricao, organizador, palestrante,
				quantidade);

		EventoDAO.criarEvento(evento);

		response.sendRedirect("adm_evento.jsp?id="+evento.getId());
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
