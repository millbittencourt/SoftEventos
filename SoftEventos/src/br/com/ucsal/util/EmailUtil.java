package br.com.ucsal.util;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class EmailUtil {

	public static void simpleMail() throws AddressException, MessagingException {

		String to = "alan10sou@gmail.com";
		String from = "softeventos@softeventos.com";
		String host = "localhost";// or IP address

		Properties prop = new Properties();
		prop.setProperty("mail.smtp.host", host);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.port", "25");
		prop.put("mail.smtp.starttls.enable", "true");
		
		prop.put("mail.smtp.socketFactory.port", "25"); 
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");


		Session session = Session.getInstance(prop, null);

		try {
			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress(from));

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			message.setSubject("Funfou");
			message.setText("Aehooooooooooooooo");

			Transport.send(message);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}
