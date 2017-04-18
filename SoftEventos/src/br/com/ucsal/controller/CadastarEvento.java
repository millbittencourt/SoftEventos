package br.com.ucsal.controller;

import java.util.Date;
import java.text.SimpleDateFormat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.UsuarioDAO;
import br.com.ucsal.model.Evento;

/**
 * Servlet implementation class CadastarEvento
 */
@WebServlet("/CadastarEvento")
public class CadastarEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastarEvento() {
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

		Date data = null;
		Date hora = null;

		try {

			data = fData.parse(request.getParameter("data"));
			hora = fHora.parse(request.getParameter("hora"));

		} catch (Exception e) {
			System.out.println("Erro: Cadastrar Evento - Hora e Data");
			e.printStackTrace();
		}

		Evento evento = new Evento(request.getParameter("nome"), request.getParameter("local"), data, hora,
				request.getParameter("descricao"), request.getParameter("organizador"),
				request.getParameter("palestrante"), Integer.parseInt(request.getParameter("qtd")));

		EventoDAO.criarEvento(evento);

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
