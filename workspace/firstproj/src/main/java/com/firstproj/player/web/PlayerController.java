package com.firstproj.player.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.common.util.FileUpload;
import com.firstproj.common.util.PagedList;
import com.firstproj.player.SearchConditionPlayer;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.dto.PlayerInfoDetail;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.PlayerInfoSearchDto;
import com.firstproj.player.service.PlayerServiceImpl;
import com.firstproj.user.dto.UserDto;

@Controller
@RequestMapping(value = "/player")
public class PlayerController {
    
    public static final int DEFAULT_PAGE_NO = 1;
    public static final int DEFAULT_PAGE_SIZE = 10;

	// Related to image upload
	public static final long 	MAX_UPLOAD_FILE_SIZE 			= 20480000;
	public static final String 	FILE_EXTENSIONS_IMAGES 			= "jpg, jpeg, png, gif, bmp";
    
	private static final int 	THUMBNAIL_IMAGE_WIDTH_SMALL 	= 64;
	private static final int 	THUMBNAIL_IMAGE_HEIGHT_SMALL 	= 64;
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
    @Resource(name="PlayerServiceImpl")
    private PlayerServiceImpl playerService;
 
    /**
     * 하위 카테고리 목록 조회
     * @param request
     * @param model
     * @param parentCatId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/childCategoryList.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject getChildCategoryList(HttpServletRequest request, Model model, @Param int parentCatId) throws Exception{
        
        JSONObject jsonObj = new JSONObject();
        
//        int parentCatId = Integer.parseInt(request.getParameter("parentCatId"));
        
        CategoryDto param = new CategoryDto();
        param.setParentCatId(parentCatId);
        
        List<CategoryDto> childCatList = this.playerService.getCategoryList(param);
        
        jsonObj.put("parentCatId", parentCatId);
        jsonObj.put("childCatList", childCatList);
        
        return jsonObj;
    }
    
    /**
     * 카테고리 속성 목록 조회
     * @param request
     * @param model
     * @param catId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/attrElementList.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject getAttrElementList(HttpServletRequest request, Model model, @Param int catId) throws Exception{
        
        JSONObject jsonObj = new JSONObject();
        
//        int parentCatId = Integer.parseInt(request.getParameter("parentCatId"));
        
        CategoryAttrDto param = new CategoryAttrDto();
        param.setCatId(catId);
        
//        List<CategoryAttrElemDto> attrElementList = this.playerService.getAttrElementList(param);
        
        List<CategoryAttrDto> attrElementList = this.playerService.getAttrElementList(param);
        
        System.out.println(attrElementList.size());
        
        jsonObj.put("catId", catId);
        jsonObj.put("attrElementList", attrElementList);
        
        return jsonObj;
    }
    
    /**
     * 페이징을 위한 리스트 조회
     * @param request
     * @param model
     * @param boardArticleDto
     * @return
     * @throws Exception
     */
    private Model getListCommonList(HttpServletRequest request, Model model, HttpSession session, String page) throws Exception{
        // 검색 조건
        String searchCondition  = request.getParameter("searchCondition");
        String searchText       = request.getParameter("searchText");
        String startDate        = request.getParameter("startDate");
        String endDate          = request.getParameter("endDate");

        int pageNo              = (request.getParameter("pageNo") != null) 
                                    ? Integer.parseInt(request.getParameter("pageNo")) 
                                    : DEFAULT_PAGE_NO;

        int listRowCnt          = (request.getParameter("listRowCnt") != null) 
                                    ? Integer.parseInt(request.getParameter("listRowCnt")) 
                                    : 10;

        String catId            = (String)request.getParameter("selectedCatId");        // String.valueOf(categoryAttrElemMapDto.getCatId());
        String attrId           = (String)request.getParameter("selectedAttrId");       // String.valueOf(categoryAttrElemMapDto.getAttrId());
        String attrElemId       = (String)request.getParameter("selectedAttrElemId");   // String.valueOf(categoryAttrElemMapDto.getAttrElemId());

//System.out.println("Controller's catId : " + catId + "\nController's attrId : " + attrId + "\nController's attrElemId : " + attrElemId);        

        List<String> attrElemIdArr = null;
        
        if(attrElemId != null && attrElemId != ""){
            
            attrElemIdArr = new ArrayList<String>();
            
            if(attrElemId.indexOf(",") > 0){
                
                String[] values = attrElemId.trim().split(",");
                
                for(String strObj : values){
                    attrElemIdArr.add(strObj);    
                }
                
            }else{
                attrElemIdArr.add(attrElemId);
            }
        }
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        // searching condition setting
        paramMap.put("catId",           catId);
        paramMap.put("attrId",          attrId);
        paramMap.put("attrElemId",      attrElemIdArr);
        paramMap.put("searchCondition", searchCondition);
        paramMap.put("searchText",      searchText);
        paramMap.put("startDate",       startDate);
        paramMap.put("endDate",         endDate);
//System.out.println("searchCondition : " + searchCondition + ", searchText : " + searchText);
        int totalListCnt = 0;
                
        if(page.equals("attrElemMapList.page")){
            totalListCnt = playerService.getCategoryAttrElemMapCnt(paramMap);
        }else if(page.equals("playerList.page")){
            totalListCnt = playerService.getPlayerInfoCnt(paramMap);
        }

        
//System.out.println("totalListCnt : " + totalListCnt);
        // paging condition setting
        paramMap.put("pageNo",          pageNo);
        paramMap.put("listRowCnt",      listRowCnt);
        paramMap.put("totalListCnt",    totalListCnt);
        paramMap.put("pageSize",        DEFAULT_PAGE_SIZE);

        // 카테고리 목록 조회하는 부분
        CategoryDto             categoryObj = null;
        List<CategoryDto> 		catList 	= this.playerService.getCategoryList(categoryObj);
        
        // 페이징 리스트 조회하는 부분
        PagedList result = null;
        List<PlayerInfoSearchDto> perCategoryCntList = null;
        if(page.equals("attrElemMapList.page")){
            result = playerService.getCategoryAttrElemMapPagedList(paramMap);
        }else if(page.equals("playerList.page")){
            result = playerService.getPlayerInfoPagedList(paramMap);
            
            // checkout who logined user regist as player
            UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
            
            boolean isRegisted = false;
            
            if(sessionInfo != null){
            	isRegisted = this.playerService.getIsRegistedPlayer(sessionInfo);
            }
            
            model.addAttribute("isRegisted", isRegisted);
            
//            System.out.println("searchText is not null : " + (null != searchText) + "or not empty : " + org.apache.commons.lang.StringUtils.isNotEmpty(searchText));
            if(org.apache.commons.lang.StringUtils.isNotEmpty(searchText)){
                perCategoryCntList = playerService.getPlayerInfoCntPerCategory(paramMap);
            }
        }
        
        model.addAttribute("catList"            ,    catList);
        model.addAttribute("pagedResult"        ,    result);
        model.addAttribute("perCategoryCntList" ,    perCategoryCntList);
        model.addAttribute("catId"              ,    catId);
        return model;
    }    
    
    /**
     * 카테고리 속성 매핑 리스트 조회
     * @param request
     * @param model
     * @param categoryAttrElemMapDto
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/attrElemMapList.page", method = {RequestMethod.GET, RequestMethod.POST})
    public String getCategoryAttrElemMapList(HttpServletRequest request, Model model, CategoryAttrElemMapDto categoryAttrElemMapDto, HttpSession session) throws Exception{
        
        System.out.println("attrElemId : " + request.getParameter("selectedAttrElemId"));
        System.out.println("attrId : " + request.getParameter("selectedAttrId"));
        System.out.println("dto attrElemId : " + categoryAttrElemMapDto.getAttrElemId());
        
        model = this.getListCommonList(request, model, session, "attrElemMapList.page");
        
        return "player/attrElemMapList";
    }
    /**
     * 선수 리스트 조회
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/playerList.page", method = {RequestMethod.GET, RequestMethod.POST})
    public String getPlayerInfoList(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        model = this.getListCommonList(request, model, session, "playerList.page");
        return "player/playerList";
    }
    
    @RequestMapping(value="/write.page")
    public String registPlayer(HttpServletRequest request, Model model, HttpSession session) throws Exception{
    	
    	UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
    	
    	if(sessionInfo == null){
    		return "redirect:/login";
    	}else{
    		
    		if(this.playerService.getIsRegisted(sessionInfo)){
    			return "redirect:/player/playerDetailView.page";
    		}else{
    			
    	        CategoryDto param = new CategoryDto();
    	        param.setParentCatId(0);
    	        
    	        List<CategoryDto> parentCatList = this.playerService.getCategoryList(param);
    			
    			model.addAttribute("sessionInfo", sessionInfo);
    			model.addAttribute("firstDepthCatList", parentCatList);
    		}
    	}

    	return "player/registPlayer";
    }
    
    @RequestMapping(value="/registPlayerAction", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject insertPlayerDetailInfoJSON(PlayerInfoDetail playerInfoDetail, HttpSession session) throws Exception{
    	JSONObject jsonObj = new JSONObject();
    	
		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
    	System.out.println(" }}}}}}}}}}} " + playerInfoDetail.toString());

		// validate
		
		
		// fileUpload
		MultipartFile imageFile = playerInfoDetail.getPlayerInfoDto().getProfileImg();
		String imageUploadResult = "";
		
		if(null != imageFile){
			imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH_SMALL, THUMBNAIL_IMAGE_HEIGHT_SMALL);	
		}
		
		String filePath = "";
		if(!imageUploadResult.equals("") && !imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError")){
			filePath = imageUploadResult;
			
			PlayerInfoDto resetPlayerInfoObj = playerInfoDetail.getPlayerInfoDto();
			resetPlayerInfoObj.setProfileImgFilePath(filePath);
			resetPlayerInfoObj.setProfileImgName(imageFile.getOriginalFilename());
	System.out.println("[resetPlayerInfo] : " + resetPlayerInfoObj.toString());		
			playerInfoDetail.setPlayerInfoDto(resetPlayerInfoObj);	
		}	
		
		// service 호출
		int playerInfoId = this.playerService.insertPlayerInfoDetail(playerInfoDetail, sessionInfo);
		
		if(playerInfoId > 0){
			jsonObj.put("result", "ok");
			jsonObj.put("msg", "Successfully Registration.");
		}else{
			jsonObj.put("result", "error");
			jsonObj.put("msg", "Failure Registration. Try it again, Please.");
		}
    	
    	return jsonObj;
    }
    
    
    /**
     * @brief autoComplete
     * @param request
     * @param searchText
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/autoComplete.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject autoComplete(HttpServletRequest request, @Param String searchText) throws Exception{
    	JSONObject returnObj = new JSONObject();
    	
    	SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();
    	if(!StringUtils.isEmpty(searchText)){
    		searchConditionPlayer.setSearchText(searchText);
    	}
    	
    	List<String> searchResult = this.playerService.getAutoComplete(searchConditionPlayer);
    	
    	returnObj.put("searchResult", searchResult);
    	
    	return returnObj;
    }
    /**
     * @brief playerDetailInfo
     * @param request
     * @param model
     * @param userDto
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/playerDetailView", method = {RequestMethod.POST})
    public String getPlayerDetail(HttpServletRequest request, Model model, UserDto userDto, HttpSession session) throws Exception{
    	UserDto userInfo = null;
    	UserDto myInfo   = (UserDto)session.getAttribute("userInfo");
    	if(userDto == null){
    		userInfo = (UserDto)session.getAttribute("userInfo");
    	}else{
    		userInfo = userDto;
    	}
    	
    	model.addAttribute("playerDetailInfo", this.playerService.getPlayerInfoDetail(userInfo));
    	model.addAttribute("myInfo", myInfo);
    	return "player/playerDetailView";
    }
    
    @RequestMapping(value="/deletePlayerInfo.json", method = RequestMethod.POST)
    public JSONObject deletePlayerInfo(PlayerInfoDto playerInfoDto, HttpSession session) throws Exception{
    	JSONObject 	returnObj 		= new JSONObject();
    	int 	   	deleteResult 	= 0;
    	UserDto 	sessionInfo 	= (UserDto)session.getAttribute("userInfo");
    	
    	if(playerInfoDto != null && playerInfoDto.getPlayerInfoId() > 0 && sessionInfo != null){
    		playerInfoDto.setUserId(sessionInfo.getUserId());
    		deleteResult = this.playerService.deletePlayerInfo(playerInfoDto);
    	}

		if(deleteResult > 0){
			returnObj.put("result", "ok");
			returnObj.put("msg", "Successfully deleted.");
		}else{
			returnObj.put("result", "error");
			returnObj.put("msg", "Failure to delete. Try it again, Please.");
		}
		return returnObj;
    }
    
}
