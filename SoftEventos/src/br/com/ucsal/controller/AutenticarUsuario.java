package br.com.ucsal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ucsal.model.Usuario;
import br.com.ucsal.DAO.UsuarioDAO;


@WebServlet("/AutenticarUsuario")
public class AutenticarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AutenticarUsuario() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario(request.getParameter("login"), request.getParameter("senha"));
		
		usuario = UsuarioDAO.Autenticar(usuario);
		
		if(usuario != null){

			request.getSession().setAttribute("usuario", usuario );
			response.sendRedirect("index.jsp");
			response.getWriter().append("Served at: ").append(request.getContextPath());
			
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
