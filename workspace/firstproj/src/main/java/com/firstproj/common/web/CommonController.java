package com.firstproj.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.service.BoardArticleService;

@Controller
@RequestMapping(value="/common")
public class CommonController {

    @Resource(name = "BoardArticleServiceImpl")
    private BoardArticleService boardArticleService;
    
    @RequestMapping(value = "/sideBoardList")
    public String getSideBoardList(Model model) throws Exception{
        model.addAttribute("sideBoardList", this.boardArticleService.selectSideBoardList());
        return "common/ajaxSideBoardList";
    }

}
