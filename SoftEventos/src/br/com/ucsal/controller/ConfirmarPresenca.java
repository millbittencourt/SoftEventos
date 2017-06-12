package br.com.ucsal.controller;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.dao.EventoDAO;
import br.com.ucsal.dao.InscricaoDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Evento;
import br.com.ucsal.model.Usuario;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Aluno aluno = (Aluno) request.getSession().getAttribute("conta");
			
			long qrcode = Long.parseLong(request.getParameter("qrcode"));
			
			Evento evento = EventoDAO.getEventoQrcode(qrcode);
			
			InscricaoDAO.confirmarPresenca(aluno, evento);
				
		
			request.setAttribute("confirmado", true);
			request.getRequestDispatcher("confirmar_presenca.jsp").forward(request, response);

		
		}catch (NoResultException e){
					
			request.setAttribute("confirmado", false);
			request.getRequestDispatcher("confirmar_presenca.jsp").forward(request, response);

		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
