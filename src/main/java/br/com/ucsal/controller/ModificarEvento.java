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
 * Servlet implementation class ModificarEvento
 */
@WebServlet("/ModificarEvento")
public class ModificarEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarEvento() {
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

		String dataString;
		String horaCString;
		String horaTString;

		Date data = null;
		Date horaC = null;
		Date horaT = null;

		try {
			data = fData.parse(request.getParameter("data"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			horaC = fHora.parse(request.getParameter("hora_c"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			horaT = fHora.parse(request.getParameter("hora_t"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		String local = request.getParameter("local");

		String descricao = request.getParameter("descricao");

		String quantidadeString = request.getParameter("qtd") == null ? "" : request.getParameter("qtd");
		Integer quantidade = "".equals(quantidadeString) ? -1 : Integer.parseInt(quantidadeString);

		Evento evento = EventoDAO.getEvento(Long.parseLong(request.getParameter("id")));

		evento.setLocal(local == null ? evento.getLocal() : local);
		evento.setDescricao(descricao == null ? evento.getDescricao() : descricao);
		evento.setQuantidade(quantidade == null ? evento.getQuantidade() : quantidade);
		evento.setData(data == null ? evento.getData() : data);
		evento.setHoraComeco(horaC == null ? evento.getHoraComeco() : horaC);
		evento.setHoraTermino(horaT == null ? evento.getHoraTermino() : horaT);

		EventoDAO.modificarEvento(evento);

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
