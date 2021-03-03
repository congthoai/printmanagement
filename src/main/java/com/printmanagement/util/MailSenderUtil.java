package com.printmanagement.util;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSenderUtil {
	@Autowired
    private JavaMailSender mailSender;
	
	public boolean sendMail(String sendTo, String subject, String body) {
		// TODO Auto-generated method stub
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setTo(sendTo);
			helper.setSubject(subject);
			
		    String htmlMsg = "<h3>" +body+ "</h3>" +"<img src='http://www.apache.org/images/asf_logo_wide.gif'>";
			message.setContent(htmlMsg, "text/html");
			
			mailSender.send(message);
			return true;
		} catch (Exception e) {
			return false;
		}

	}
}
