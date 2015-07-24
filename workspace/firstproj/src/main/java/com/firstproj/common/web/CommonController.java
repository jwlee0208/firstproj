package com.firstproj.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.service.BoardArticleService;
import com.firstproj.board.service.BoardService;

@Controller
@RequestMapping(value="/common")
public class CommonController {

    @Resource(name = "BoardArticleServiceImpl")
    private BoardArticleService boardArticleService;
    
    @Resource(name = "BoardServiceImpl")
    private BoardService    boardService;
    
    @RequestMapping(value = "/sideBoardList")
    public String getSideBoardList(Model model) throws Exception{
        model.addAttribute("sideBoardList", this.boardArticleService.selectSideBoardList());
        return "common/ajaxSideBoardList";
    }
    
    @RequestMapping(value = "/menu")
    public String getMenu(Model model) throws Exception{
        
        model.addAttribute("boardCategoryList", this.boardService.selectBoardCategoryList());
        model.addAttribute("boardList", this.boardService.getBoardList());
        
        return "common/ajaxMenu";
    }

}
