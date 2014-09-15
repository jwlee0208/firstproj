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
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardArticleServiceImpl;
import com.firstproj.common.util.FileUpload;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.web.EditorController;
import com.firstproj.user.dto.UserDto;

@Controller
@RequestMapping(value = "/board/article")
public class BoardArticleController {

	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;

	// Related to image upload
	public static final long MAX_UPLOAD_FILE_SIZE = 20480000;
	public static final String FILE_EXTENSIONS_IMAGES = "jpg, jpeg, png, gif, bmp";
	public static final int DB_RESULT_SUCCESS = 1;
	
	public static final int DEFAULT_THUMBNAIL_IMAGE_WIDTH = 314;
	public static final int DEFAULT_THUMBNAIL_IMAGE_HEIGHT = 166;
	
	private static final int THUMBNAIL_IMAGE_WIDTH 	= 64;
	private static final int THUMBNAIL_IMAGE_HEIGHT = 64;
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
	@Resource(name = "EditorController")
	private EditorController editorController;
	

	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception {
//System.out.println(">>> getBoardList()");
//		List<boardArticleDto> boardList = boardArticleService.getBoardList();

		model = this.getBoardCommonList(request, model, boardArticleDto);
		
		String page = "board/article/list";
		
		if(boardArticleDto.getBoardId() == 1){
			page = "board/article/imageList";
		}else if(boardArticleDto.getBoardId() == 2){
			page = "board/article/imageList2";
		}
		
//		model.addAttribute("boardList", boardList);
//		return "board/list";
		return page;
	}

	private Model getBoardCommonList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText = request.getParameter("searchText");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		int boardId = boardArticleDto.getBoardId();
		
		int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

		int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		if(boardArticleDto.getBoardId() == 1){
			listRowCnt = 9;
		}
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardId", boardId);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText", searchText);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);

		int totalListCnt = boardArticleService.selectArticleListCnt(paramMap);
//System.out.println("totalListCnt : " + totalListCnt);
		// paging condition setting
		paramMap.put("pageNo", pageNo);
		paramMap.put("listRowCnt", listRowCnt);
		paramMap.put("totalListCnt", totalListCnt);
		paramMap.put("pageSize", DEFAULT_PAGE_SIZE);

		PagedList result = boardArticleService.getBoardArticlePagedList(paramMap);

		model.addAttribute("pagedResult", result);
		model.addAttribute("boardId", boardId);
		return model;
	}
	
	@RequestMapping(value = "/view.page")
	public String getBoardContent(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @Param int selectedArticleId) throws Exception{
		
		BoardArticleDto contentInfo = null;
		BoardArticleDto prevContentInfo = null;
		BoardArticleDto nextContentInfo = null;
		
		if(selectedArticleId > 0){
			boardArticleDto.setArticleId(selectedArticleId);
			// 글 조회
			contentInfo = this.boardArticleService.selectBoardArticle(boardArticleDto);
			// 이전 글 조회
			prevContentInfo = this.boardArticleService.selectPrevBoardArticle(boardArticleDto);
			// 다음 글 조회
			nextContentInfo = this.boardArticleService.selectNextBoardArticle(boardArticleDto);
		}
		
		model.addAttribute("contentInfo", contentInfo);
		model.addAttribute("prevContentInfo", prevContentInfo);
		model.addAttribute("nextContentInfo", nextContentInfo);
		
		model.addAttribute("boardId", boardArticleDto.getBoardId());
		
		return "board/article/view";
	}

	@RequestMapping(value = "/write.page")
	public String writeBoard(Model model, BoardArticleDto boardArticleDto, HttpSession session) {
		
//		System.out.println("session : " + (session == null));
//		System.out.println("userId : " + ((UserDto)session.getAttribute("userInfo")).getUserId());
		
		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){
			model.addAttribute("boardId", boardArticleDto.getBoardId());			
		}else{
			return "redirect:/login";
		}
		
		return "board/article/write";
	}

	@SuppressWarnings("serial")
	@RequestMapping(value = "/insertBoardArticle.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertBoardArticleJSON(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session) throws Exception {
System.out.println("boardArticleDto 1 : " + boardArticleDto.toString());	
		JSONObject jsonObj = new JSONObject();
		int insertResult = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){

			boardArticleDto.setAuthorId(sessionInfo.getUserId());
			boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
			boardArticleDto.setStatus(1);
	
System.out.println("boardArticleDto 2 : " + boardArticleDto.toString());			
			
			insertResult = this.boardArticleService.insertBoardArticle(boardArticleDto);
			
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}						
		}
		
		jsonObj.put("result", (insertResult > 0) ? true : false);
		return jsonObj;
	}
	
	@RequestMapping(value = "/insertBoardArticle")
	@ResponseBody
	public String insertBoardArticle(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session, Model model) throws Exception {
		
		int insertResult = 0;
		MultipartFile imageFile = boardArticleDto.getThumbImg();
		
		String imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH, THUMBNAIL_IMAGE_HEIGHT);
//				fileUpload.uploadFile(imageFile);	// editorController.imageadd(imageFile).toString();
		String filePath = "";
		if(!imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError")){
			filePath = imageUploadResult;
			
			boardArticleDto.setFilePath(filePath);
			boardArticleDto.setOriginalFileName(imageFile.getOriginalFilename());
			boardArticleDto.setStatus(1);
			
			insertResult = this.boardArticleService.insertBoardArticle(boardArticleDto);
		}
//		model.addAttribute("result", imageUploadResult);
		return imageUploadResult;
	}
	
	@SuppressWarnings("serial")
	@RequestMapping(value = "/modifyBoardArticle.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject modifyBoardArticleJSON(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session) throws Exception {
System.out.println("boardArticleDto 1 : " + boardArticleDto.toString());	
		JSONObject jsonObj = new JSONObject();
		int updateResult = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){

			boardArticleDto.setAuthorId(sessionInfo.getUserId());
			boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
	
System.out.println("boardArticleDto 2 : " + boardArticleDto.toString());			
			
			updateResult = this.boardArticleService.updateBoardArticle(boardArticleDto);
			
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}						
		}
		
		jsonObj.put("result", (updateResult > 0) ? true : false);
		return jsonObj;
	}	
	
	@RequestMapping(value = "/modifyBoardArticle")
	@ResponseBody
	public String modifyBoardArticle(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session, Model model) throws Exception {
		
		int updateResult = 0;
		MultipartFile imageFile = boardArticleDto.getThumbImg();
		
		String imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH, THUMBNAIL_IMAGE_HEIGHT);
				//fileUpload.uploadFile(imageFile);	// editorController.imageadd(imageFile).toString();
		String filePath = "";
		if(!imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError")){
			filePath = imageUploadResult;
			
			boardArticleDto.setFilePath(filePath);
			boardArticleDto.setOriginalFileName(imageFile.getOriginalFilename());

System.out.println("boardArticleDto : " + boardArticleDto.toString());			
			
			updateResult = this.boardArticleService.updateBoardArticle(boardArticleDto);
		}
//		model.addAttribute("result", imageUploadResult);
		return imageUploadResult;
	}	

	
	@RequestMapping(value = "/modifyBoardArticle.page")
	public String modifyBoardArticlePage(Model model, BoardArticleDto boardArticleDto, HttpSession session, @Param int selectedArticleId, @Param int selectedBoardId) throws Exception{
		
		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){
			model.addAttribute("boardId", selectedBoardId);	
			
			BoardArticleDto articleInfo = null;
			
			if(selectedArticleId > 0){
				boardArticleDto.setArticleId(selectedArticleId);
				// 글 조회
				articleInfo = this.boardArticleService.selectBoardArticle(boardArticleDto);
			}
			
			model.addAttribute("articleInfo", articleInfo);		
			
		}else{
			return "redirect:/login";
		}
		
		return "board/article/write";
	}
	
	/**
	 * 게시글 삭제
	 * @param model
	 * @param session
	 * @param selectedArticleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteBoardArticle.json", method = RequestMethod.POST)
	public JSONObject deleteBoardArticleJSON(Model model, HttpSession session, @Param int selectedArticleId) throws Exception{
		BoardArticleDto boardArticleDto = new BoardArticleDto();
		JSONObject jsonObj = new JSONObject();

		int deleteResult = 0;
		
		if(selectedArticleId > 0){
			boardArticleDto.setArticleId(selectedArticleId);
			// 글 삭제 - 논리적 삭제
			deleteResult = boardArticleService.deleteBoardArticle(boardArticleDto);

		}
			
		jsonObj.put("result", (deleteResult > 0) ? true : false);
		jsonObj.put("selectedArticleId", selectedArticleId);
		return jsonObj;
	}
}
