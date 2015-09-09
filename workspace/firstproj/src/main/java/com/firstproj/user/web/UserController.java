package com.firstproj.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.firstproj.common.CommonConstant;
import com.firstproj.common.dto.CodeDto;
import com.firstproj.common.dto.MailDto;
import com.firstproj.common.dto.ShareDto;
import com.firstproj.common.service.impl.CommonServiceImpl;
import com.firstproj.common.util.AES256Util;
import com.firstproj.common.validate.JsonResponse;
import com.firstproj.share.service.ShareServiceImpl;
import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;
import com.firstproj.user.validate.UserValidator;

@Controller
@RequestMapping(value="/user")
@SessionAttributes("userInfo")
public class UserController {
    
    Log log = LogFactory.getLog(this.getClass());
    
	@Resource(name="UserServiceImpl")
	private UserServiceImpl         userService;
	
	@Resource(name="CommonServiceImpl")
	private CommonServiceImpl       commonService;
	
	@Resource(name="ShareServiceImpl")
	private ShareServiceImpl        shareService;
	
    @Inject
    private VelocityEngine          velocityEngine;
    
    @Inject
    private MessageSourceAccessor   messageSource;

    @RequestMapping(value="/regist")
    public String registUser(Model model, HttpServletRequest request) throws Exception{
        return this.registUser(model, request, 0);
    }
    
	@RequestMapping(value="/regist/{boardId}")
	public String registUser(Model model, HttpServletRequest request, @PathVariable int boardId) throws Exception{
	    /*
        String        referer       = request.getHeader("Referer");
        log.info("[ REFER ] : " + referer);           
        
        // Nation List 
        CodeDto       nationCodeDto = new CodeDto();
        nationCodeDto.setCodeType("01");
        List<CodeDto> nationList    = this.commonService.selectCodeList(nationCodeDto);
        
        // Language List 
        CodeDto       langCodeDto   = new CodeDto();
        langCodeDto.setCodeType("02");
        List<CodeDto> languageList  = this.commonService.selectCodeList(langCodeDto);
        
        model.addAttribute("prevPage"       , referer);
	    model.addAttribute("nationList"     , nationList);
	    model.addAttribute("languageList"   , languageList);
	    */
	    this.setRequiredInfos(model, request);
		return "/user/regist";
	}
	
	private void setRequiredInfos(Model model, HttpServletRequest request) throws Exception{
        String        referer       = request.getHeader("Referer");
        log.info("[ REFER ] : " + referer);           
        
        // Nation List 
        CodeDto       nationCodeDto = new CodeDto();
        nationCodeDto.setCodeType("01");
        List<CodeDto> nationList    = this.commonService.selectCodeList(nationCodeDto);
        
        // Language List 
        CodeDto       langCodeDto   = new CodeDto();
        langCodeDto.setCodeType("02");
        List<CodeDto> languageList  = this.commonService.selectCodeList(langCodeDto);
        
        model.addAttribute("prevPage"       , referer);
        model.addAttribute("nationList"     , nationList);
        model.addAttribute("languageList"   , languageList);
	    
	}
	
	@RequestMapping(value="/regist.json")
	@ResponseBody
	public JSONObject registUser(Model model, @Valid @ModelAttribute UserDto userDto, BindingResult result) throws Exception{

	    JSONObject    returnObj    = new JSONObject();
		String        resultCode   = "REGIST_0000";
		String        resultMsg    = "";
		
		int           registResult = 0;
		
		if(result.hasErrors()){
			resultCode   = "REGIST_0001"; 	
			resultMsg    = "invalid_parameter";
		}else{
			
			String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
			
			userDto.setPasswd(hashedPassword);
			
			registResult = this.userService.insertUserInfo(userDto);
			
			if(registResult > 0){
				resultCode  = "REGIST_0002";
				resultMsg   = "duplicated_user";
			}else{
				resultCode  = "REGIST_0000";
				resultMsg   = "complelted";				
			}
		}
		returnObj.put("returnCode", resultCode);
		returnObj.put("resultMsg", resultMsg);
		
		return returnObj;
	}
	
    @RequestMapping(value="/registAction")
    @ResponseBody	
    public JsonResponse registUser2(Model model, HttpServletRequest request, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        log.info("[ UserController.registAction() ][ userDto.toString() ] : " + userDto.toString()); 
        
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.insertValidate(result, userDto);
        
        String resultCode   = "REGIST_0000";
        String resultMsg    = "";
        
        int    registResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
            
            userDto.setPasswd(hashedPassword);
            
            UserDto duplicatedUser = this.userService.selectUserInfo(userDto);
            
            if(duplicatedUser == null){
                registResult = this.userService.insertUserInfo(userDto);
               
                if(registResult > 0){  
                    log.info("[ UserController.registAction() ][ userDto.toString() ][ 2nd ] : " + userDto.toString()); 
                    
                    resultCode  = "REGIST_0000";
                    resultMsg   = "complelted";       
                    
                    // create share(blog) 
                    ShareDto shareDto = new ShareDto();
                    shareDto.setUserId(userDto.getUserId());
                    shareDto.setShareName(userDto.getUserNm() +"'s Share");
                    shareDto.setIntroduce("Please, fill out your introduce.");
                    shareDto.setShareType("1");
                    
                    this.shareService.insertShareInfo(shareDto);
                    
                    // Sending Mail
                    AES256Util aes256util  = new AES256Util(CommonConstant.IV);
                    
                    MailDto mailInfo = new MailDto();
                    mailInfo.setContentType("text/html; charset=utf-8");
                    mailInfo.setMailTo(aes256util.decrypt(userDto.getEmail()));
                    mailInfo.setMailFrom("jwlee0208@gmail.com");
                    mailInfo.setMailSubject("[Tryout.com] Congraturation! Happy join us!!");
                    mailInfo.setTemplateName("welcomeJoinningTemplate.vm");
                    
                    log.info("[ UserController.registAction() ][ userDto.getLanguage() ] : " + userDto.getLanguage());
                    log.info("[ UserController.registAction() ][ new Locale(userDto.getLanguage()) ] : " + new Locale(userDto.getLanguage()));
                    
                    
                    // 메시지 다국어 처리
                    String welcomeMsg = null;
                    
                    try{
                        welcomeMsg = messageSource.getMessage("welcome.joinning", new Locale(userDto.getLanguage())); 
                    }catch(Exception e){
                        e.printStackTrace();
                        log.error("[ UserController.registAction() ][ welcomeMsg ] Error Occured...");
                        welcomeMsg = "Welcome!!!";
                    }
                            //new String(resourceBundle.getString("welcome.joinning").getBytes("8859_1"), "UTF-8");
                    
                    log.info("[ UserController.registAction() ][ welcomeMsg ] : " + welcomeMsg);
                    
                    // Velocity Template 에 Mapping할 Data Map
                    Map<String, Object> contentMap = new HashMap<String, Object>();
                    contentMap.put("mailTo"         , mailInfo.getMailTo());
                    contentMap.put("welcomeMessage" , welcomeMsg);
                    mailInfo.setModel(contentMap);
                    
                    
                    // setting content
                    String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "./mailTemplates/welcomeJoinningTemplate.vm", "UTF-8", mailInfo.getModel());
                    mailInfo.setMailContent(body);
                    
                    // mail 발송
                    try{
                        commonService.sendMail(mailInfo);    
                    }catch(Exception e){
                        e.printStackTrace();
                        log.info("[ 메일 발송 오류 ]");
                    }
                    

                }else{
                    resultCode  = "REGIST_0002";
                    resultMsg   = "insert_error";
                }

            }else{
                resultCode  = "REGIST_0003";
                resultMsg   = "duplicated_user";
            }
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(resultMsg);

        }

//        model.addAttribute("userInfo", this.userService.selectUserInfo(userDto));
        return returnObj;
    }
	
    @RequestMapping(method = RequestMethod.GET, value="/registOk")
    public String registOk(HttpServletRequest request) throws Exception{
        return "/user/registOk";
    }
    
    @RequestMapping(value="/modify/{userId}")
    public String modifyUser(HttpServletRequest request, Model model, HttpSession session, @PathVariable String userId) throws Exception{
        this.commonService.getPrivateInfo(request, model, session);
        this.setRequiredInfos(model, request);
        return "/user/ajaxRegistForm";
    }
    
    
    @RequestMapping(value="/modifyAction")
    @ResponseBody   
    public JsonResponse modifyUser(Model model, HttpServletRequest request, HttpSession session, SessionStatus status, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        log.info("[ UserController.registAction() ][ userDto.toString() ] : " + userDto.toString()); 
        
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.updateValidate(result, userDto);
        
        String resultCode   = "REGIST_0000";
        String resultMsg    = "";
        
        int    updateResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            updateResult = this.userService.modifyUserInfo(userDto);
            
            if(updateResult > 0){  
                log.info("[ UserController.registAction() ][ userDto.toString() ][ 2nd ] : " + userDto.toString()); 
                    
                resultCode  = "REGIST_0000";
                resultMsg   = "complelted";
                
                session.removeAttribute("userInfo");
                session.setAttribute("userInfo", this.userService.selectUserInfo(userDto));
                
                // 다국어 설정 필요.
                
                
             }else{
                resultCode  = "REGIST_0002";
                resultMsg   = "insert_error";
                }
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(resultMsg);

        }

        return returnObj;
    }    
    
}
