package br.com.ucsal.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.DocumentException;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.InscricaoDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Certificado;
import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Usuario;
import br.com.ucsal.util.PDFUtil;

/**
 * Servlet implementation class ConfirmarPresenca
 */
@WebServlet("/ConfirmarPresenca")
public class ConfirmarPresenca extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfirmarPresenca() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Aluno aluno = (Aluno) request.getSession().getAttribute("conta");

			long qrcode = Long.parseLong(request.getParameter("qrcode"));

			Evento evento = EventoDAO.getEventoQrcode(qrcode);

			InscricaoDAO.confirmarPresenca(aluno, evento);

			String pasta = getServletContext().getRealPath("") + File.separator + "pdf" + File.separator + "certificado"
					+ File.separator + aluno.getId();

			long dif = evento.getHoraComeco().getTime() - evento.getHoraTermino().getTime();
			Date duracao = new Date(dif);

			Certificado ce = new Certificado();
			ce.setData(evento.getData().toString());
			ce.setDuracao(duracao.getHours()+" ");
			ce.setLocal(evento.getLocal());
			ce.setNomeAluno(aluno.getNome());
			ce.setNomeEvento(evento.getNome());
			ce.setNomePalestrante(evento.getPalestrante());
			ce.setNomeProfessor(evento.getProfessor().getNome());

			PDFUtil.gerarCertificado(ce, pasta);

			request.setAttribute("confirmado", true);
			request.getRequestDispatcher("confirmar_presenca.jsp").forward(request, response);

		} catch (NoResultException e) {

			request.setAttribute("confirmado", false);
			request.getRequestDispatcher("confirmar_presenca.jsp").forward(request, response);

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
