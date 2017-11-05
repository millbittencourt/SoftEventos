package br.com.ucsal.util.mail;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import net.sourceforge.htmlunit.corejs.javascript.Context;

public class EmailUtil {

	private static EmailUtil instancia;

	private Email emailSistema;

	private EmailUtil() throws IOException {

		String nomeMail = "softeventosucsal@gmail.com";
		String usuarioMail = "SoftEventos";
		String senhaMail = "";
		String smtpHostMail = "smtp.gmail.com";
		String smtpPortMail = "587";
		String smtpAuth = "true";
		String smtpStarttls = "true";
		
		emailSistema = new Email(nomeMail, usuarioMail, senhaMail, smtpHostMail, smtpPortMail, smtpAuth,
				smtpStarttls);

	}

	public static EmailUtil getInstancia() throws IOException {

		if (instancia == null) {
			instancia = new EmailUtil();
		}

		return instancia;
	}

	public Email getEmailSistema() {
		return emailSistema;
	}

}
