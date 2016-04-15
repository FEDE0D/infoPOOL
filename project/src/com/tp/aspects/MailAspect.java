package com.tp.aspects;

import com.tp.util.ApplicationContextProvider;
import com.tp.util.Mail;

public class MailAspect {

	private String adminMail;
	
	public MailAspect(){
		adminMail = "federicogpacheco@gmail.com";
	}
	
	public void sendNotificationToAdmin(){
		((Mail) ApplicationContextProvider.getApplicationContext().getBean("Mail")).sendMail("java.tp.7@gmail.com", adminMail, "Nueva denuncia", "Se ha realizado una nueva denuncia");
	}
	
	public void sendNotificationToAdminFake(){
		System.out.println("SENDING EMAIL...");
	}
	
}
