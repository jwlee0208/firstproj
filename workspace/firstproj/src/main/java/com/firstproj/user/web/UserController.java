package com.firstproj.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.mindrot.jbcrypt.BCrypt;
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

import com.firstproj.common.dto.CodeDto;
import com.firstproj.common.dto.MailDto;
import com.firstproj.common.service.impl.CommonServiceImpl;
import com.firstproj.common.validate.JsonResponse;
import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;
import com.firstproj.user.validate.UserValidator;

@Controller
@RequestMapping(value="/user")
@SessionAttributes("userInfo")
public class UserController {
    
    Log log = LogFactory.getLog(this.getClass());
    
	@Resource(name="UserServiceImpl")
	private UserServiceImpl    userService;
	
	@Resource(name="CommonServiceImpl")
	private CommonServiceImpl  commonService;
	
    @Inject
    private VelocityEngine velocityEngine;

	
	
	
	
	@RequestMapping(value="/regist/{boardId}")
	public String registUser(Model model, HttpServletRequest request, @PathVariable int boardId) throws Exception{
	    
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
		return "/user/regist";
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
                    resultCode  = "REGIST_0000";
                    resultMsg   = "complelted";       
                    
                    // Sending Mail
                    MailDto mailInfo = new MailDto();
                    mailInfo.setContentType("text/html; charset=utf-8");
                    mailInfo.setMailTo(userDto.getEmail());
                    mailInfo.setMailFrom("jwlee0208@gmail.com");
                    mailInfo.setMailSubject("[Tryout.com] Congraturation! Happy join us!!");
                    mailInfo.setTemplateName("welcomeJoinningTemplate.vm");
                    
                    
                    ResourceBundle resourceBundle = (userDto.getLanguage() != null) ? ResourceBundle.getBundle("Locale", new Locale(userDto.getLanguage())) : ResourceBundle.getBundle("Locale");
                    
                    String welcomeMsg = new String(resourceBundle.getString("welcome.message").getBytes("8859_1"), "UTF-8");
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

        model.addAttribute("userInfo", this.userService.selectUserInfo(userDto));
        return returnObj;
    }
	
    @RequestMapping(method = RequestMethod.GET, value="/registOk")
    public String registOk(HttpServletRequest request) throws Exception{
        return "/user/registOk";
    }
}
