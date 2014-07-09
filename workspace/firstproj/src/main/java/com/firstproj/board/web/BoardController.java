package com.firstproj.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Resource(name="BoardServiceImpl")
	private BoardServiceImpl boardService;
	
	@RequestMapping(value="/list.page")
	public String getBoardList(Model model) throws Exception{
		
		List<BoardDto> boardList = boardService.getBoardList();
		
		model.addAttribute("boardList", boardList);
		return "board/list";
	}
	
	@RequestMapping(value="/view.page")
	public String getView(){
		return "board/view";
	}
	
	@RequestMapping(value="/write.page")
	public String writeBoard(){
		
		return "board/write";
	}
}
