package com.firstproj.config.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.board.dto.BoardCategoryDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.service.BoardCategoryServiceImpl;
import com.firstproj.board.service.BoardServiceImpl;
import com.firstproj.common.util.PagedList;
import com.firstproj.share.service.ShareServiceImpl;
import com.firstproj.user.dto.UserDto;

import com.firstproj.common.dto.ShareDto;
@Controller
@RequestMapping(value="/config")
public class ConfigController {
    public static final int DEFAULT_PAGE_NO    = 1;
    public static final int DEFAULT_PAGE_SIZE  = 10;

    @Resource(name="BoardServiceImpl")
    private BoardServiceImpl 		 boardService;
    
    @Resource(name="BoardCategoryServiceImpl")
    private BoardCategoryServiceImpl boardCategoryService;
    
	@Resource(name="ShareServiceImpl")
	private ShareServiceImpl         shareService;

    @RequestMapping(value="/main")
    public String getConfig() throws Exception{
        return "config/config";
    }
    
    @RequestMapping(value="/board/list")
    public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{
           UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
            
            if(null != sessionInfo){
                boardDto.setCreateUserId(sessionInfo.getUserId());        
            }else{
                return "redirect:/login?redirectPage=" + request.getRequestURI();
            }

            model = this.getBoardCommonList(request, model, boardDto);
            return "config/board/accordionList";
    }
    
    @RequestMapping(value="/board/list/{menuId}")
    public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @PathVariable int menuId) throws Exception{
        
        return this.getBoardList(request, model, boardDto, session);
    }
    
    private Model getBoardCommonList(HttpServletRequest request, Model model, BoardDto boardDto) throws Exception{
        // 검색 조건
        String searchCondition = request.getParameter("searchCondition");
        String searchText      = request.getParameter("searchText");
        String startDate       = request.getParameter("startDate");
        String endDate         = request.getParameter("endDate");
        
        int    pageNo          = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

        int    listRowCnt      = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

        String createUserId    = boardDto.getCreateUserId();
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        // searching condition setting
        paramMap.put("searchCondition", searchCondition);
        paramMap.put("searchText"     , searchText);
        paramMap.put("startDate"      , startDate);
        paramMap.put("endDate"        , endDate);
        paramMap.put("createUserId"   , createUserId);

        int    totalListCnt    = boardService.getListCnt(paramMap);

        paramMap.put("pageNo"         , pageNo);
        paramMap.put("listRowCnt"     , listRowCnt);
        paramMap.put("totalListCnt"   , totalListCnt);
        paramMap.put("pageSize"       , DEFAULT_PAGE_SIZE);

        PagedList result       = boardService.getBoardPagedList(paramMap);

        model.addAttribute("pagedResult", result);
        return model;

    }
    @RequestMapping(value = "/board/write")
    public String createBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model.addAttribute("categoryList", this.boardService.getBoardCategoryList(boardCategoryDto));
        
        return "config/board/write";
    }
    
    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/insertBoardAction.json", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject insertBoardAction(@Valid BoardDto boardDto, BindingResult bindingResult, HttpSession session) throws Exception {

//      System.out.println(">>> boardDto  : " + boardDto.toString());
        
        JSONObject    jsonObj         = new JSONObject();
        int           insertResult    = 0;

        UserDto       sessionInfo     = (UserDto)session.getAttribute("userInfo");
        
        if(null != sessionInfo){

            boardDto.setCreateUserId(sessionInfo.getUserId());
            boardDto.setCreateUserName(sessionInfo.getUserNm());
    
            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }                       
        }
        
        insertResult = this.boardService.insertBoardInfo(boardDto);
    
        jsonObj.put("result", (insertResult > 0) ? true : false);
        return jsonObj;
    }   
    
    @RequestMapping(value = "/board/view")
    public String getBoardContent(HttpServletRequest request, Model model, BoardDto boardDto, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{
        
        BoardDto boardInfo      = null;
        BoardDto prevBoardInfo  = null;
        BoardDto nextBoardInfo  = null;
        
        if(selectedBoardId > 0){
            boardDto.setBoardId(selectedBoardId);
            // 글 조회
            boardInfo     = this.boardService.selectBoardInfo(boardDto);
            // 이전 글 조회
            prevBoardInfo = this.boardService.getPrevBoardInfo(boardDto);
            // 다음 글 조회
            nextBoardInfo = this.boardService.getNextBoardInfo(boardDto);
        }
        
        model.addAttribute("boardInfo"    , boardInfo);
        model.addAttribute("prevBoardInfo", prevBoardInfo);
        model.addAttribute("nextBoardInfo", nextBoardInfo);
        
        model.addAttribute("boardId"      , boardDto.getBoardId());
        
        return "config/board/view";
    }
    /**
     * 게시판 수정 페이지
     * @param model
     * @param boardDto
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/board/modify")
    public String modifyBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardDto boardInfo = null;
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            if(selectedBoardId > 0){
                boardDto.setBoardId(selectedBoardId);
            }

            boardInfo = boardService.getBoardInfo(boardDto);
            
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }

        model.addAttribute("categoryList", this.boardService.getBoardCategoryList(boardCategoryDto));
        model.addAttribute("boardInfo"   , boardInfo);
        return "config/board/write";
    }
    
    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/modifyBoardAction.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject modifyBoardAction(
               Locale locale
                , Model model
                , HttpServletRequest request
                , HttpServletResponse response
                , HttpSession session
                , BoardDto boardDto
                , BindingResult bindingResult) throws Exception {
        
        JSONObject jsonObj        = new JSONObject();
        int        modifyResult   = 0;

        UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");
        
        if(null != sessionInfo){

            boardDto.setModifyUserId(sessionInfo.getUserId());
            boardDto.setModifyUserName(sessionInfo.getUserNm());

            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }                       
        }

        modifyResult = this.boardService.modifyBoardInfo(boardDto);
                
        jsonObj.put("result", (modifyResult > 0) ? true : false);
        return jsonObj;
    }   
    
    @RequestMapping(value="/board/categoryList")
    public String getCategoryList(Model model, HttpSession session) throws Exception{
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        List<BoardCategoryDto> boardCategoryList = null;
        UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");
        if(sessionInfo != null){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            boardCategoryList = this.boardCategoryService.getBoardCategoryList(boardCategoryDto); 
        }
        
        model.addAttribute("boardCategoryList", boardCategoryList);
        return "config/board/categoryList";
    }
    
    @RequestMapping(value="/priv/modifyShareProfile")
    public String getShareProfileInfo(Model model, HttpSession session) throws Exception{
    	UserDto    	sessionInfo    	= (UserDto)session.getAttribute("userInfo");
        ShareDto	shareDto 		= new ShareDto();
        ShareDto	shareInfo		= null;
        
    	if(sessionInfo != null){
    		shareDto.setUserId(sessionInfo.getUserId());
        	shareInfo = this.shareService.getShareInfo(shareDto);
        }
    	
    	model.addAttribute("shareInfo"	, shareInfo);
    	model.addAttribute("userInfo"	, sessionInfo);
    	return "config/share/write";
    }
    
    @RequestMapping(value="/priv/modifyShareProfileAction")
    public JSONObject modifyShareProfileInfo(HttpServletRequest request, Model model, HttpSession session, ShareDto shareDto) throws Exception{
        JSONObject resultObj       = new JSONObject();
        UserDto    sessionInfo     = (UserDto)session.getAttribute("userInfo");
        
        if(sessionInfo != null){

            if(shareDto != null){
                int updateResult = this.shareService.updateShareInfo(shareDto);
                if(updateResult > 0){
                    resultObj.put("code"    , "ok");
                    resultObj.put("message" , "success");                    
                }else{
                    resultObj.put("code"    , "error");
                    resultObj.put("message" , "not updated");
                }
            }else{
                resultObj.put("code"    , "error");
                resultObj.put("message" , "invalid object(null)");
            }

        }else{
            resultObj.put("code"    , "error");
            resultObj.put("message" , "invalid session");
        }
            
        return resultObj;
    }
}
