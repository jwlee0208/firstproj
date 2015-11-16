package com.firstproj.share.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/share")
public class ShareController {
    
//    @Resource(name="ShareServiceImpl")
//    private ShareServiceImpl shareService;
//    
//    @RequestMapping(value={"/", ""})
//    public String getShareRoot(){
//        return "redirect:/share/main";
//    }
//    
//    @RequestMapping(value="/info")
//    public String getShareInfo(Model model, HttpSession session){
//        this.shareService.setShareInfo(model, session);
//        return "common/ajaxShareInfo";
//    }

}
