package com.firstproj.board.web;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	public static final int DEFAULT_PAGE_NO = 1;              
    public static final int DEFAULT_PAGE_SIZE = 10;   
	
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
	
	@RequestMapping(value="/insertBoard.json")
	@ResponseBody
	public JSONObject insertBoard(BoardDto boardDto) throws Exception{
		
		JSONObject jsonObj = new JSONObject();
		
		int insertResult = this.boardService.insertBoard(boardDto);
		System.out.println("boardDto == null  : " + (boardDto == null));
		System.out.println("requested value  : " + boardDto.getTitle() +", " + boardDto.getContent());
				
		jsonObj.put("result", (insertResult > 0) ? true : false);
		
		return jsonObj;
	}
}
