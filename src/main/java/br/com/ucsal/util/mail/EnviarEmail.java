package br.com.ucsal.util.mail;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class EnviarEmail {

	public static void simples(String assunto, String mensagem, String tipoMensagem, List<String> destinatarios)
			throws AddressException, IOException {

		Email emailSistema = EmailUtil.getInstancia().getEmailSistema();

		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.host", emailSistema.getSmtpHostMail());
		prop.setProperty("mail.smtp.auth", emailSistema.getSmtpAuth());
		prop.setProperty("mail.smtp.starttls.enable", emailSistema.getSmtpStarttls());
		prop.setProperty("mail.smtp.port", emailSistema.getSmtpPortMail());

		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailSistema.getNomeMail(), emailSistema.getSenhaMail());
			}
		};

		Session session = Session.getDefaultInstance(prop, auth);
		session.setDebug(true);

		try {

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(emailSistema.getUsuarioMail()));

			boolean prim = true;
			for (String destinatario : destinatarios) {
				if (prim) {
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
					prim = false;
				} else {
					msg.addRecipient(Message.RecipientType.CC, new InternetAddress(destinatario));
				}
			}

			msg.setSubject(assunto);
			msg.setContent(mensagem, tipoMensagem);

			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

	public static void comArquivos(String assunto, String mensagem, String tipoMensagem, List<String> destinatarios,
			List<String> arquivos) throws IOException {
		Email emailSistema = EmailUtil.getInstancia().getEmailSistema();

		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.host", emailSistema.getSmtpHostMail());
		prop.setProperty("mail.smtp.auth", emailSistema.getSmtpAuth());
		prop.setProperty("mail.smtp.starttls.enable", emailSistema.getSmtpStarttls());
		prop.setProperty("mail.smtp.port", emailSistema.getSmtpPortMail());

		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailSistema.getNomeMail(), emailSistema.getSenhaMail());
			}
		};

		Session session = Session.getDefaultInstance(prop, auth);
		session.setDebug(true);

		try {

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(emailSistema.getUsuarioMail()));

			boolean prim = true;
			for (String destinatario : destinatarios) {
				if (prim) {
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
					prim = false;
				} else {
					msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(destinatario));
				}
			}

			msg.setSubject(assunto);

			MimeBodyPart mensagemTexto = new MimeBodyPart();
			mensagemTexto.setContent(mensagem, tipoMensagem);

			Multipart mps = new MimeMultipart();

			for (String arquivo : arquivos) {

				MimeBodyPart anexo = new MimeBodyPart();
				FileDataSource fds = new FileDataSource(arquivo);
				anexo.setDataHandler(new DataHandler(fds));
				anexo.setFileName(fds.getName());

				mps.addBodyPart(anexo);

			}

			mps.addBodyPart(mensagemTexto);
			
			msg.setContent(mps);
			
			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}
}
