package com.korea.mall.mail;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {
	private JavaMailSender mailSender;	// email ���� ����� �⺻�� �Ǵ� interface 
    private MimeMessage message;	
    private MimeMessageHelper messageHelper;	// MimeMessage�� ���� �� �ִ� Ŭ����, �ؽ�Ʈ,img �� html �������� ����
    											// subj, content, from, to �� ����
	// �ڵ� ������
    public MailUtils(JavaMailSender mailSender) throws MessagingException {	
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);	// ���� ����
    }

    public void setText(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);	// ���� ����
    }

    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
        messageHelper.setFrom(email, name);		// ������ ���
    }

    public void setTo(String u_email) throws MessagingException {
        messageHelper.setTo(u_email);		// ���� ���
    }

    public void addInline(String contentId, DataSource dataSource) throws MessagingException {	// addInline(���Ե� �̹����� id ��Ʈ����Ʈ��, ������ ���)
        messageHelper.addInline(contentId, dataSource);		// �̹��� ����
    }

    public void send() {
        mailSender.send(message);		// ���� ����
    }
}
