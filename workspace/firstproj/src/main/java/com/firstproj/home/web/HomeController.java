package com.firstproj.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardArticleServiceImpl;

@Controller
@RequestMapping(value="/")
public class HomeController {
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;
	
	@RequestMapping(value="/home.page")
	public String goHome(Model model) throws Exception{
		
		BoardArticleDto boardDto01 = new BoardArticleDto();
		boardDto01.setBoardId(1);
		
		List<BoardArticleDto> getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);

		BoardArticleDto boardDto02 = new BoardArticleDto();
		boardDto02.setBoardId(2);
		
		List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

		model.addAttribute("articleFive01", getBoardArticleFive01);
		model.addAttribute("articleFive02", getBoardArticleFive02);
		
		return "home";
	}
	
	@RequestMapping(value="/home2.page")
	public String goHome() throws Exception{		
		return "home2";
	}	
	
	@RequestMapping(value="/aboutUs.page")
	public String goAboutUs() throws Exception{
		return "/info/aboutUs";
	}
//	@RequestMapping(value="/getFiveArticle.page")
//	public String getBoardArticle(Model model) throws Exception{
//		
//		return "/board/articleFive";
//	}
}
