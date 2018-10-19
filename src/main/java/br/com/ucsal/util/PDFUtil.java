package br.com.ucsal.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.TabSettings;
import com.itextpdf.text.pdf.PdfWriter;

import br.com.ucsal.model.Certificado;

public class PDFUtil {


	public static void gerarCertificado(Certificado certificado, String pasta) throws FileNotFoundException {

		System.out.println(pasta);

		Document document = new Document(PageSize.A4.rotate());
		
		File uploadDir = new File(pasta);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		
		try {
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pasta+File.separator
					+"certificado.pdf"));
			document.open();

			Font fontTitulo = new Font(Font.FontFamily.COURIER, 45);
			fontTitulo.setColor(8, 23, 77);

			Font fontNormal = new Font(Font.FontFamily.HELVETICA, 15);
			fontNormal.setColor(8, 23, 77);

			Font fontMedia = new Font(Font.FontFamily.COURIER, 30);
			fontMedia.setColor(8, 23, 77);
			fontMedia.setStyle(Font.ITALIC);

			Paragraph titulo = new Paragraph("Certificado", fontTitulo);
			titulo.setAlignment(Element.ALIGN_CENTER);

			titulo.setSpacingAfter(10);
			titulo.setSpacingBefore(50);

			document.add(titulo);

			Paragraph preNome = new Paragraph("Certificamos que", fontNormal);
			preNome.setAlignment(Element.ALIGN_CENTER);

			preNome.setSpacingBefore(20);
			preNome.setSpacingAfter(-10);

			document.add(preNome);

			Paragraph nome = new Paragraph(certificado.getNomeAluno(), fontMedia);
			nome.setAlignment(Element.ALIGN_CENTER);

			document.add(nome);

			Paragraph linha = new Paragraph("_____________________", fontNormal);
			linha.setSpacingBefore(-20);
			linha.setAlignment(Element.ALIGN_CENTER);

			document.add(linha);

			String descricao = "\u0009 \u0009 \u0009 \u0009 Participou do evento " + certificado.getNomeEvento()
					+ " no dia " + certificado.getData() + " durante " + certificado.getDuracao() + " com "
					+ certificado.getNomePalestrante() + " como Palestrante, sob supervisão de "
					+ certificado.getNomeProfessor() + " e organizado pela " + certificado.getNomeOrganizacao();

			Paragraph texto = new Paragraph(descricao, fontNormal);
			texto.setAlignment(Element.ALIGN_JUSTIFIED);

			texto.setSpacingAfter(20);
			texto.setSpacingBefore(25);

			texto.setIndentationLeft(90);
			texto.setIndentationRight(90);

			document.add(texto);

			Paragraph nomeOrganizador = new Paragraph(certificado.getNomeProfessor(), fontMedia);
			nomeOrganizador.setAlignment(Element.ALIGN_CENTER);

			nomeOrganizador.setSpacingBefore(150);

			document.add(nomeOrganizador);
			document.add(linha);

			Paragraph diretor = new Paragraph("Diretor", fontNormal);
			diretor.setAlignment(Element.ALIGN_CENTER);
			diretor.setSpacingAfter(-15);

			document.add(diretor);

			document.close();
		} catch (DocumentException e) {
			e.printStackTrace();
		}

	}

}
