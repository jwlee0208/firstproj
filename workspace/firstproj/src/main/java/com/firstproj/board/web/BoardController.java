package com.firstproj.board.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	public static final int DEFAULT_PAGE_NO    = 1;
	public static final int DEFAULT_PAGE_SIZE  = 10;

	@Resource(name="BoardServiceImpl")
	private BoardServiceImpl boardService;
	
//	@RequestMapping(value="/list")
//	public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{
//	       UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
//	        
//	        if(null != sessionInfo){
//	                    
//	        }else{
//	            return "redirect:/login?redirectPage=" + request.getRequestURI();
//	            
//	        }
//
//	        model = this.getBoardCommonList(request, model, boardDto);
//	        return "board/accordionList";
//	}
//	
//	@RequestMapping(value="/list/{menuId}")
//	public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @PathVariable int menuId) throws Exception{
//		
//		return this.getBoardList(request, model, boardDto, session);
//	}
//	
//	private Model getBoardCommonList(HttpServletRequest request, Model model, BoardDto boardDto) throws Exception{
//		// 검색 조건
//		String searchCondition = request.getParameter("searchCondition");
//		String searchText      = request.getParameter("searchText");
//		String startDate       = request.getParameter("startDate");
//		String endDate         = request.getParameter("endDate");
//		
//		int    pageNo          = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;
//
//		int    listRowCnt      = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;
//
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		// searching condition setting
//		paramMap.put("searchCondition", searchCondition);
//		paramMap.put("searchText"     , searchText);
//		paramMap.put("startDate"      , startDate);
//		paramMap.put("endDate"        , endDate);
//
//		int    totalListCnt    = boardService.getListCnt(paramMap);
//
//		paramMap.put("pageNo"         , pageNo);
//		paramMap.put("listRowCnt"     , listRowCnt);
//		paramMap.put("totalListCnt"   , totalListCnt);
//		paramMap.put("pageSize"       , DEFAULT_PAGE_SIZE);
//
//		PagedList result       = boardService.getBoardPagedList(paramMap);
//
//		model.addAttribute("pagedResult", result);
//		return model;
//
//	}
//	@RequestMapping(value = "/write")
//	public String createBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{
//		
//		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
//		
//		if(null != sessionInfo){
//					
//		}else{
//		    return "redirect:/login?redirectPage=" + request.getRequestURI();
//		}
//		model.addAttribute("categoryList", this.boardService.getBoardCategoryList());
//		
//		return "board/write";
//	}
//	
//	@SuppressWarnings("serial")
//	@RequestMapping(value = "/insertBoardAction.json", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONObject insertBoardAction(@Valid BoardDto boardDto, BindingResult bindingResult, HttpSession session) throws Exception {
//
////		System.out.println(">>> boardDto  : " + boardDto.toString());
//		
//		JSONObject    jsonObj         = new JSONObject();
//		int           insertResult    = 0;
//
//		UserDto       sessionInfo     = (UserDto)session.getAttribute("userInfo");
//		
//		if(null != sessionInfo){
//
//			boardDto.setCreateUserId(sessionInfo.getUserId());
//			boardDto.setCreateUserName(sessionInfo.getUserNm());
//	
//			if(bindingResult.hasErrors()){
//				jsonObj.put("validate", false);
//			}						
//		}
//		
//		insertResult = this.boardService.insertBoardInfo(boardDto);
//	
//		jsonObj.put("result", (insertResult > 0) ? true : false);
//		return jsonObj;
//	}	
//	
//	@RequestMapping(value = "/view")
//	public String getBoardContent(HttpServletRequest request, Model model, BoardDto boardDto, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{
//		
//		BoardDto boardInfo 		= null;
//		BoardDto prevBoardInfo 	= null;
//		BoardDto nextBoardInfo 	= null;
//		
//		if(selectedBoardId > 0){
//			boardDto.setBoardId(selectedBoardId);
//			// 글 조회
//			boardInfo     = this.boardService.selectBoardInfo(boardDto);
//			// 이전 글 조회
//			prevBoardInfo = this.boardService.getPrevBoardInfo(boardDto);
//			// 다음 글 조회
//			nextBoardInfo = this.boardService.getNextBoardInfo(boardDto);
//		}
//		
//		model.addAttribute("boardInfo"    , boardInfo);
//		model.addAttribute("prevBoardInfo", prevBoardInfo);
//		model.addAttribute("nextBoardInfo", nextBoardInfo);
//		
//		model.addAttribute("boardId"      , boardDto.getBoardId());
//		
//		return "board/view";
//	}
//	/**
//	 * 게시판 수정 페이지
//	 * @param model
//	 * @param boardDto
//	 * @param session
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/modify")
//	public String modifyBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{
//		
//		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
//		BoardDto boardInfo = null;
//		
//		if(null != sessionInfo){
//			
//			if(selectedBoardId > 0){
//				boardDto.setBoardId(selectedBoardId);
//			}
//
//			boardInfo = boardService.getBoardInfo(boardDto);
//			
//		}else{
//		    return "redirect:/login?redirectPage=" + request.getRequestURI();
//		}
//
//		model.addAttribute("categoryList", this.boardService.getBoardCategoryList());
//		model.addAttribute("boardInfo"	 , boardInfo);
//		return "board/write";
//	}
//	
//	@SuppressWarnings("serial")
//	@RequestMapping(value = "/modifyBoardAction.json", method = {RequestMethod.POST})
//	@ResponseBody
//	public JSONObject modifyBoardAction(
//	           Locale locale
//	            , Model model
//	            , HttpServletRequest request
//	            , HttpServletResponse response
//	            , HttpSession session
//	            , BoardDto boardDto
//	            , BindingResult bindingResult) throws Exception {
//		
//		JSONObject jsonObj        = new JSONObject();
//		int        modifyResult   = 0;
//
//		UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");
//		
//		if(null != sessionInfo){
//
//			boardDto.setModifyUserId(sessionInfo.getUserId());
//			boardDto.setModifyUserName(sessionInfo.getUserNm());
//
//			if(bindingResult.hasErrors()){
//				jsonObj.put("validate", false);
//			}						
//		}
//
//		modifyResult = this.boardService.modifyBoardInfo(boardDto);
//				
//		jsonObj.put("result", (modifyResult > 0) ? true : false);
//		return jsonObj;
//	}	
}
