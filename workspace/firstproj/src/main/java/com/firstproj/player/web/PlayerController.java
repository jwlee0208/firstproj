package com.firstproj.player.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.common.util.PagedList;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.service.PlayerServiceImpl;

@Controller
@RequestMapping(value = "/player")
public class PlayerController {
    
    public static final int DEFAULT_PAGE_NO = 1;
    public static final int DEFAULT_PAGE_SIZE = 10;

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
        
        List<CategoryAttrElemDto> attrElementList = this.playerService.getAttrElementList(param);
        
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
    private Model getListCommonList(HttpServletRequest request, Model model, String page) throws Exception{
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
System.out.println("Controller's attrElemId : " + attrElemId);        
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
System.out.println("searchCondition : " + searchCondition + ", searchText : " + searchText);
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
        List<CategoryDto> catList = this.playerService.getCategoryList(categoryObj);
       
        // 페이징 리스트 조회하는 부분
        PagedList result = null;
        if(page.equals("attrElemMapList.page")){
            result = playerService.getCategoryAttrElemMapPagedList(paramMap);
        }else if(page.equals("playerList.page")){
            result = playerService.getPlayerInfoPagedList(paramMap);
        }
        
        model.addAttribute("catList",       catList);
        model.addAttribute("pagedResult",   result);
        model.addAttribute("catId",         catId);
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
    public String getCategoryAttrElemMapList(HttpServletRequest request, Model model, CategoryAttrElemMapDto categoryAttrElemMapDto) throws Exception{
        
        System.out.println("attrElemId : " + request.getParameter("selectedAttrElemId"));
        System.out.println("attrId : " + request.getParameter("selectedAttrId"));
        System.out.println("dto attrElemId : " + categoryAttrElemMapDto.getAttrElemId());
        
        model = this.getListCommonList(request, model, "attrElemMapList.page");
        
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
    public String getPlayerInfoList(HttpServletRequest request, Model model) throws Exception{
        model = this.getListCommonList(request, model, "playerList.page");
        return "player/playerList";
    }
    
    

}
