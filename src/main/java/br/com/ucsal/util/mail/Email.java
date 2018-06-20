package br.com.ucsal.util.mail;

public class Email {

	private String nomeMail;
	private String usuarioMail;
	private String senhaMail;

	private String smtpHostMail;
	private String smtpPortMail;

	private String smtpAuth;
	private String smtpStarttls;
	
	public Email() {
		// TODO Auto-generated constructor stub
	}
	
	public Email(String nomeMail, String usuarioMail, String senhaMail, String smtpHostMail, String smtpPortMail,
			String smtpAuth, String smtpStarttls) {
		super();
		this.nomeMail = nomeMail;
		this.usuarioMail = usuarioMail;
		this.senhaMail = senhaMail;
		this.smtpHostMail = smtpHostMail;
		this.smtpPortMail = smtpPortMail;
		this.smtpAuth = smtpAuth;
		this.smtpStarttls = smtpStarttls;
	}
	

	@Override
	public String toString() {
		return "Email [nomeMail=" + nomeMail + ", usuarioMail=" + usuarioMail + ", senhaMail=" + senhaMail
				+ ", smtpHostMail=" + smtpHostMail + ", smtpPortMail=" + smtpPortMail + ", smtpAuth=" + smtpAuth
				+ ", smtpStarttls=" + smtpStarttls + "]";
	}


	public String getNomeMail() {
		return nomeMail;
	}

	public void setNomeMail(String nomeMail) {
		this.nomeMail = nomeMail;
	}

	public String getUsuarioMail() {
		return usuarioMail;
	}

	public void setUsuarioMail(String usuarioMail) {
		this.usuarioMail = usuarioMail;
	}

	public String getSenhaMail() {
		return senhaMail;
	}

	public void setSenhaMail(String senhaMail) {
		this.senhaMail = senhaMail;
	}

	public String getSmtpHostMail() {
		return smtpHostMail;
	}

	public void setSmtpHostMail(String smtpHostMail) {
		this.smtpHostMail = smtpHostMail;
	}

	public String getSmtpPortMail() {
		return smtpPortMail;
	}

	public void setSmtpPortMail(String smtpPortMail) {
		this.smtpPortMail = smtpPortMail;
	}

	public String getSmtpAuth() {
		return smtpAuth;
	}

	public void setSmtpAuth(String smtpAuth) {
		this.smtpAuth = smtpAuth;
	}

	public String getSmtpStarttls() {
		return smtpStarttls;
	}

	public void setSmtpStarttls(String smtpStarttls) {
		this.smtpStarttls = smtpStarttls;
	}

}
