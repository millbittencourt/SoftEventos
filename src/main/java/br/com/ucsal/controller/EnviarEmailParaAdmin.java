//package br.com.ucsal.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import br.com.ucsal.dao.EventoDAO;
//import br.com.ucsal.dao.InscricaoDAO;
//import br.com.ucsal.model.Inscricao;
//import br.com.ucsal.util.mail.EnviarEmail;
//
///**
// * Servlet implementation class EnviarEmailParaAdmin
// */
//@WebServlet("/EnviarEmailParaAdmin")
//public class EnviarEmailParaAdmin extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public EnviarEmailParaAdmin() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		String assunto = request.getParameter("titulo");
//		String mensagem = request.getParameter("mensagem");
//		String id = request.getParameter("id");
//
//		List<String> destinatarios = new ArrayList<>();
//		destinatarios.add("softeventosucsal@gmail.com");
//		
//		try {
//			
//			EnviarEmail.simples(assunto, "<p>"+mensagem+"</p>", "text/html", destinatarios);
//			response.sendRedirect("index.jsp");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("erro", e.getMessage());
//			request.getRequestDispatcher("index.jsp").forward(request, response);
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
