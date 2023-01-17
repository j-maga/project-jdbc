package com.page.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.page.model.*;

public class PaymentDao
{
	private Connection con;
	
	private int amount;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public PaymentDao(Connection con)
	{
		this.con = con;
	}
	
	public static String generateOTP() {
		int random = (int) (Math.random() * 9000) + 1000;
		String otp = String.valueOf(random);
		return otp;
	}

	public boolean SendEmailtoUser(String email, String otp) {
		System.out.println("Invoked SendEmailtoUser");
		boolean success = false;
		try {

			List<InternetAddress> inetAddressList = new ArrayList<InternetAddress>();
			inetAddressList.add(new InternetAddress(email)); 

			InternetAddress[] recipientAddress = new InternetAddress[inetAddressList.size()];
			recipientAddress = inetAddressList.toArray(recipientAddress);

			String fromUser = "yogaportalsystem@gmail.com";

			if (recipientAddress != null && recipientAddress.length > 0)
			{

				Properties emailProps = new Properties();

				emailProps.put("mail.smtp.host", "smtp.gmail.com");
				emailProps.put("mail.smtp.port", "587");
				emailProps.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				final String smtpUserName = "yogaportalsystem@gmail.com";
				final String smtpPassword = "qwupdtcxhmmytywv";

				Session session1 = null;
				if (smtpUserName != null && smtpUserName.trim().length() > 0 && smtpPassword != null
						&& smtpPassword.trim().length() > 0) {
					emailProps.put("mail.smtp.starttls.enable", "true");
					emailProps.put("mail.smtp.auth", "true");
					emailProps.put("mail.debug", "false");
					emailProps.put("mail.smtp.socketFactory.fallback", "false");

					session1 = Session.getDefaultInstance(emailProps, new Authenticator()
					{

						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(smtpUserName, smtpPassword);
						}
					});
				} else {

					emailProps.put("mail.smtp.auth", "false");
					emailProps.put("mail.smtp.starttls.enable", "true");
					session1 = Session.getDefaultInstance(emailProps);
				}

				javax.mail.Message mimeMessage = new MimeMessage(session1);
				mimeMessage.addRecipients(Message.RecipientType.TO, recipientAddress);
				mimeMessage.setSubject("OTP Verification");
				Random random = new Random();
				/*
				 * int pin = random.nextInt(10000); otp =String.valueOf(pin);
				 */
				mimeMessage.setText("Welcome to Lilac Healthcare Online Booking" + "\n" + otp
						+ " -Your verification code Don't share with others");
				mimeMessage.setFrom(new InternetAddress(fromUser));
				mimeMessage.setSentDate(new Date(12, 02, 2022));
				Transport.send(mimeMessage);
				success = true;
				System.out.println("OTP Generated Successfully " + otp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;

	}

}