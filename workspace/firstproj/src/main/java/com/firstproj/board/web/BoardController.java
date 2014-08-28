package com.firstproj.board.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardServiceImpl;
import com.firstproj.common.util.PagedList;
import com.firstproj.user.dto.UserDto;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;

	@Resource(name = "BoardServiceImpl")
	private BoardServiceImpl boardService;

	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardList(HttpServletRequest request, Model model, BoardArticleDto boardDto) throws Exception {
//System.out.println(">>> getBoardList()");
//		List<BoardDto> boardList = boardService.getBoardList();

		model = this.getBoardCommonList(request, model, boardDto);
		
//		model.addAttribute("boardList", boardList);
		return "board/list";
	}

	private Model getBoardCommonList(HttpServletRequest request, Model model, BoardArticleDto boardDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText = request.getParameter("searchText");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		int boardId = boardDto.getBoardId();
		
		int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

		int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardId", boardId);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText", searchText);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);

		int totalListCnt = boardService.selectListCnt(paramMap);
//System.out.println("totalListCnt : " + totalListCnt);
		// paging condition setting
		paramMap.put("pageNo", pageNo);
		paramMap.put("listRowCnt", listRowCnt);
		paramMap.put("totalListCnt", totalListCnt);
		paramMap.put("pageSize", DEFAULT_PAGE_SIZE);

		PagedList result = boardService.getBoardPagedList(paramMap);

		model.addAttribute("pagedResult", result);
		model.addAttribute("boardId", boardId);
		return model;
	}
	
	@RequestMapping(value = "/view.page")
	public String getBoardContent(HttpServletRequest request, Model model, BoardArticleDto boardDto, @Param int selectedArticleId) throws Exception{
		
		BoardArticleDto contentInfo = null;
		BoardArticleDto prevContentInfo = null;
		BoardArticleDto nextContentInfo = null;
		
		if(selectedArticleId > 0){
			boardDto.setArticleId(selectedArticleId);
			// 글 조회
			contentInfo = this.boardService.selectBoardContent(boardDto);
			// 이전 글 조회
			prevContentInfo = this.boardService.selectPrevBoardContent(boardDto);
			// 다음 글 조회
			nextContentInfo = this.boardService.selectNextBoardContent(boardDto);
		}
		
		model.addAttribute("contentInfo", contentInfo);
		model.addAttribute("prevContentInfo", prevContentInfo);
		model.addAttribute("nextContentInfo", nextContentInfo);
		
		model.addAttribute("boardId", boardDto.getBoardId());
		
		return "board/view";
	}

	@RequestMapping(value = "/write.page")
	public String writeBoard(Model model, BoardArticleDto boardDto, HttpSession session) {
		
//		System.out.println("session : " + (session == null));
//		System.out.println("userId : " + ((UserDto)session.getAttribute("userInfo")).getUserId());
		
		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){
			model.addAttribute("boardId", boardDto.getBoardId());			
		}else{
			return "redirect:/login";
		}
		
		return "board/write";
	}

	@RequestMapping(value = "/insertBoard.json")
	@ResponseBody
	public JSONObject insertBoard(@Valid BoardArticleDto boardDto, BindingResult bindingResult, HttpSession session) throws Exception {

		JSONObject jsonObj = new JSONObject();
		int insertResult = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){
		
			boardDto.setAuthorId(sessionInfo.getUserId());
			boardDto.setAuthorNm(sessionInfo.getUserNm());
			
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}else{
				insertResult = this.boardService.insertBoard(boardDto);
			}						
		}
		
		jsonObj.put("result", (insertResult > 0) ? true : false);
		return jsonObj;
	}
}
