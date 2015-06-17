package com.firstproj.common.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.firstproj.common.dao.CommonDao;
import com.firstproj.common.dto.CodeDto;
import com.firstproj.common.dto.MailDto;
import com.firstproj.common.service.CommonService;

@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService{
    final Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="CommonDao")
    private CommonDao commonDao;
    
    private Message message;
    
    private static final String mailServer = "smtp.gmail.com";
    
    private static final String temp01 = "jwlee0208@gmail.com";
    
    @Override
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception{
        return this.commonDao.selectCodeList(codeDto);
    }
    
    @Override
    public void sendMail(MailDto mailInfo) throws Exception{
        
        Properties properties = new Properties();
        
        properties.put("mail.smtp.host", mailServer);
        properties.put("mail.smtp.port", 465);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");

        Authenticator auth = new SMTPAuthenticator(temp01, "");
     
        Session s = Session.getDefaultInstance(properties, auth);
        
        this.message = new MimeMessage(s);
        this.message.setHeader("content-type", "text/html; charset=utf-8");
        this.message.setFrom(new InternetAddress(mailInfo.getMailFrom(), MimeUtility.encodeText(mailInfo.getMailFrom(), "UTF-8", "B")));
        this.message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getMailTo(), MimeUtility.encodeText(mailInfo.getMailTo(), "UTF-8", "B")));
        this.message.setSubject(MimeUtility.encodeText(mailInfo.getMailSubject(), "UTF-8", "8"));
        this.message.setContent(mailInfo.getMailContent(), mailInfo.getContentType());
        this.message.setSentDate(new Date());
        
        try{
            Transport.send(this.message);    
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    private static class SMTPAuthenticator extends Authenticator{
        private String id = "";
        private String pw = "";
        
        public SMTPAuthenticator(String id, String pw){
            this.id = id;
            this.pw = pw;
        }
        @Override
        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
            return new javax.mail.PasswordAuthentication(id, pw);
        }
    }
}
