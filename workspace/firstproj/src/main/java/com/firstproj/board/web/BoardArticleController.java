package com.firstproj.board.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import junit.textui.ResultPrinter;
import net.sf.json.JSONObject;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ch.qos.logback.classic.Logger;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardArticleServiceImpl;
import com.firstproj.common.util.FileUpload;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.web.EditorController;
import com.firstproj.user.dto.UserDto;

@Controller
@RequestMapping(value = "/board")
public class BoardArticleController {

	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;

	// Related to image upload
	public static final long MAX_UPLOAD_FILE_SIZE = 20480000;
	public static final String FILE_EXTENSIONS_IMAGES = "jpg, jpeg, png, gif, bmp";
	public static final int DB_RESULT_SUCCESS = 1;
	
	public static final int DEFAULT_THUMBNAIL_IMAGE_WIDTH = 314;
	public static final int DEFAULT_THUMBNAIL_IMAGE_HEIGHT = 166;

	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
	@Resource(name = "EditorController")
	private EditorController editorController;
	

	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardList(HttpServletRequest request, Model model, BoardArticleDto boardDto) throws Exception {
//System.out.println(">>> getBoardList()");
//		List<BoardDto> boardList = boardArticleService.getBoardList();

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

		int totalListCnt = boardArticleService.selectListCnt(paramMap);
//System.out.println("totalListCnt : " + totalListCnt);
		// paging condition setting
		paramMap.put("pageNo", pageNo);
		paramMap.put("listRowCnt", listRowCnt);
		paramMap.put("totalListCnt", totalListCnt);
		paramMap.put("pageSize", DEFAULT_PAGE_SIZE);

		PagedList result = boardArticleService.getBoardPagedList(paramMap);

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
			contentInfo = this.boardArticleService.selectBoardContent(boardDto);
			// 이전 글 조회
			prevContentInfo = this.boardArticleService.selectPrevBoardContent(boardDto);
			// 다음 글 조회
			nextContentInfo = this.boardArticleService.selectNextBoardContent(boardDto);
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
System.out.println("boardDto 1 : " + boardDto.toString());	
		JSONObject jsonObj = new JSONObject();
		int insertResult = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){

			boardDto.setAuthorId(sessionInfo.getUserId());
			boardDto.setAuthorNm(sessionInfo.getUserNm());
	
System.out.println("boardDto 2 : " + boardDto.toString());			
			
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}else{
				insertResult = this.boardArticleService.insertBoard(boardDto);
			}						
		}
		
		jsonObj.put("result", (insertResult > 0) ? true : false);
		return jsonObj;
	}
	
	@RequestMapping(value = "/insertBoard")
	@ResponseBody
	public String insertBoardAndFile(@Valid BoardArticleDto boardDto, BindingResult bindingResult, HttpSession session, Model model) throws Exception {
		
		int insertResult = 0;
		MultipartFile imageFile = boardDto.getThumbImg();
		
		String imageUploadResult = fileUpload.uploadFile(imageFile);	// editorController.imageadd(imageFile).toString();
		String filePath = "";
		if(!imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError")){
			filePath = imageUploadResult;
			
			boardDto.setFilePath(filePath);
			boardDto.setOriginalFileName(imageFile.getOriginalFilename());

			insertResult = this.boardArticleService.insertBoard(boardDto);
		}
//		model.addAttribute("result", imageUploadResult);
		return imageUploadResult;
	}
}
