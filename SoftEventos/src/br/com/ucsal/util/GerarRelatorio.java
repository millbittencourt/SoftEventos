package br.com.ucsal.util;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class GerarRelatorio {

	public static void main(String[] args) {
		Document document = new Document(PageSize.A4, 72, 72, 72, 72);
		try {
			
			
			PdfWriter.getInstance(document, new FileOutputStream("Adobe.pdf"));
			document.open();
			Font f = new Font(FontFamily.COURIER, 20, Font.BOLD);
			Paragraph p1 = new Paragraph("Certificado JAVA",f);
			p1.setAlignment(Element.ALIGN_CENTER);
			p1.setSpacingAfter(20);
			document.add(p1);
			Font f2 = new Font(FontFamily.COURIER, 10, Font.BOLD);
			Paragraph p2 = new Paragraph("Estou utilizando a classe Paragraph para criar um bloco de texto na gera��o do meu primeiro arquivo PDF.",f2);
			document.add(p2);
			
			PdfPTable table = new PdfPTable(2);
			PdfPCell header = new PdfPCell(new Paragraph("Confirma��o do Evento"));

		
			header.setColspan(2);
			table.addCell(header); 
			table.addCell("abstract");
			table.addCell("extends");
			document.add(table);


		}catch(DocumentException de) {
			System.err.println(de.getMessage());
		}catch(IOException ioe) {
			System.err.println(ioe.getMessage());
		}
		document.close();
		try {
			Desktop.getDesktop().open(new File("Adobe.pdf"));
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
		}
	}
}
