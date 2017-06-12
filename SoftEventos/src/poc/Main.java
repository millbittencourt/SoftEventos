package poc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.AddressException;

import br.com.ucsal.dao.AlunoDAO;
import br.com.ucsal.model.Aluno;
import br.com.ucsal.model.Usuario;
import br.com.ucsal.util.mail.EnviarEmail;

public class Main {

	public static void main(String[] args) throws IOException {
		alunoX();
	}

	public static void alunoX() {

		List<String> destinatarios = new ArrayList<>();

		destinatarios.add("softeventoucsal@gmail.com");
		destinatarios.add("alan10sou@gmail.com");

		try {
			EnviarEmail.simples(" Morte ", "<p> algo algo algo algo lago </p>", "text/html",  destinatarios);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
