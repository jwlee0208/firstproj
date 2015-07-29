package com.firstproj.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
    
    @RequestMapping(value = "/menu/{menuType}")
    public String getMenu(Model model, @PathVariable String menuType) throws Exception{
        /*
        model.addAttribute("boardCategoryList", this.boardService.getBoardCategoryList());
        model.addAttribute("boardList", this.boardService.getBoardList());
        */
        StringBuffer sb = new StringBuffer();
        sb.append("common/");
        if(menuType.equals("blog")){
            model.addAttribute("boardCategoryList", this.boardService.getBoardCategoryAndBoardList());
            sb.append("ajaxBlogMenu");
        }else{
            sb.append("ajaxMenu");
        }
        return sb.toString();
    }

}
