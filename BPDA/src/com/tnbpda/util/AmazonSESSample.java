package com.tnbpda.util;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;


public class AmazonSESSample {
	
	private static final String SMTP_SERVER_HOST = "email-smtp.eu-west-1.amazonaws.com";
    private static final String SMTP_SERVER_PORT = "587";
    private static final String SUBJECT = "Sending mail with SES SMTP and Java Mail";
    private static final String BODY = "Hi,<br><br>This is a programmatic email.";

    public static void main(String[] args) {
        final String SMTP_USER_NAME = "AKIAIHTBTYURKZ74GWFA";
        final String SMTP_USER_PASSWORD = "AtRl83q1EnBPhAamfFqaguW0BGoX9IWT8EAXerWS4ywo";
        final String FROM_USER_EMAIL = "info@tnbpda";
        final String FROM_USER_FULLNAME = "administrator";
        final String TO_USER_EMAIL = "esabhinav@gmail.com";

        AmazonSESSample sendingMailThroughAWSSESSMTPServer = new AmazonSESSample();
        sendingMailThroughAWSSESSMTPServer.sendMail(SMTP_SERVER_HOST, SMTP_SERVER_PORT, SMTP_USER_NAME, SMTP_USER_PASSWORD, FROM_USER_EMAIL, FROM_USER_FULLNAME, TO_USER_EMAIL, SUBJECT, BODY);
    }
    
    void sendMail(String smtpServerHost, String smtpServerPort,  String smtpUserName, String smtpUserPassword, String fromUserEmail, String fromUserFullName, String toEmail, String subject, String body) {
        try {
            Properties props = System.getProperties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.port", smtpServerPort);
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.auth", "true");

            Session session = Session.getDefaultInstance(props);

            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromUserEmail, fromUserFullName));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject);
            msg.setContent(body, "text/html");

            Transport transport = session.getTransport();
            transport.connect(smtpServerHost, smtpUserName, smtpUserPassword);
            transport.sendMessage(msg, msg.getAllRecipients());
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
}