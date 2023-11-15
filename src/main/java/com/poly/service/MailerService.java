package com.poly.service;

import java.io.UnsupportedEncodingException;



import com.poly.entity.Mailer;

import javax.mail.MessagingException;

public interface MailerService {

	void send(Mailer mail) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;

	void sendEmail(String recipientEmail, String link) throws MessagingException, UnsupportedEncodingException;

}
