package com.firstproj.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.firstproj.common.dto.CodeDto;
import com.firstproj.common.dto.MailDto;

public interface CommonService {
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception;
    
    public void sendMail(MailDto mailInfo) throws Exception;
    
    public void getPrivateInfo(HttpServletRequest request, Model model, HttpSession session);
}
