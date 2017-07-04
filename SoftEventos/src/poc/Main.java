package poc;

import java.io.FileNotFoundException;
import java.io.IOException;

import br.com.ucsal.model.Certificado;

public class Main {

	public static void main(String[] args) throws IOException {
		alunoX();
	}

	public static void alunoX() throws FileNotFoundException {

		// List<String> destinatarios = new ArrayList<>();
		//
		// destinatarios.add("softeventoucsal@gmail.com");
		// destinatarios.add("alan10sou@gmail.com");
		//
		// try {
		// EnviarEmail.simples(" Morte ", "<p> algo algo algo algo lago </p>",
		// "text/html", destinatarios);
		//
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// Administrador adm = new Administrador("admin","admin", 1);
		// ContaDAO.adm(adm);
		
		Certificado ce = new Certificado();
		ce.setNomeEvento("algo");
		ce.getLocal();
		
		String pasta = "pidiefi.pdf";
	}

}
