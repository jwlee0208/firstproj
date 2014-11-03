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
    
    @RequestMapping(value="/attrElemMapList.page", method = {RequestMethod.GET, RequestMethod.POST})
    public String getCategoryAttrElemMapList(HttpServletRequest request, Model model, CategoryAttrElemMapDto categoryAttrElemMapDto) throws Exception{
        
//        CategoryAttrElemMapDto  categoryAttrElemMapObj = null;
//        CategoryDto             categoryObj = null;
        
        System.out.println("attrElemId : " + request.getParameter("selectedAttrElemId"));
        System.out.println("attrId : " + request.getParameter("selectedAttrId"));
        System.out.println("dto attrElemId : " + categoryAttrElemMapDto.getAttrElemId());
        
        model = this.getBoardCommonList(request, model, categoryAttrElemMapDto);
        
//        List<CategoryAttrElemMapDto> list = this.playerService.getCategoryAttrElemMapList(categoryAttrElemMapObj);
//        List<CategoryDto> catList = this.playerService.getCategoryList(categoryObj);
//        model.addAttribute("list", list);
//        model.addAttribute("catList", catList);
        
        return "player/attrElemMapList";
    }
    
    
    /**
     * 페이징을 위한 리스트 조회
     * @param request
     * @param model
     * @param boardArticleDto
     * @return
     * @throws Exception
     */
    private Model getBoardCommonList(HttpServletRequest request, Model model, CategoryAttrElemMapDto categoryAttrElemMapDto) throws Exception{
        // 검색 조건
        String searchCondition = request.getParameter("searchCondition");
        String searchText = request.getParameter("searchText");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

//        System.out.println(request.getParameterValues(name));
        
        
        
//        int boardId = categoryAttrElemMapDto.getBoardId();
        
        int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

        int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

//        if(categoryAttrElemMapDto.getBoardId() == 1){
//            listRowCnt = 9;
//        }

        String catId        = (String)request.getParameter("selectedCatId");        // String.valueOf(categoryAttrElemMapDto.getCatId());
        String attrId       = (String)request.getParameter("selectedAttrId");       // String.valueOf(categoryAttrElemMapDto.getAttrId());
        String attrElemId   = (String)request.getParameter("selectedAttrElemId");   // String.valueOf(categoryAttrElemMapDto.getAttrElemId());
        
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
        int totalListCnt = playerService.getCategoryAttrElemMapCnt(paramMap);
//System.out.println("totalListCnt : " + totalListCnt);
        // paging condition setting
        paramMap.put("pageNo",          pageNo);
        paramMap.put("listRowCnt",      listRowCnt);
        paramMap.put("totalListCnt",    totalListCnt);
        paramMap.put("pageSize",        DEFAULT_PAGE_SIZE);

        PagedList result = playerService.getCategoryAttrElemMapPagedList(paramMap);
        
        CategoryDto             categoryObj = null;
        List<CategoryDto> catList = this.playerService.getCategoryList(categoryObj);

        model.addAttribute("catList",       catList);
        model.addAttribute("pagedResult",   result);
        model.addAttribute("catId",         catId);
        return model;
    }
    
//    private Model getBoardCommonListForJson(HttpServletRequest request, Model model, CategoryAttrElemMapDto categoryAttrElemMapDto) throws Exception{
//        // 검색 조건
//        String searchCondition = request.getParameter("searchCondition");
//        String searchText = request.getParameter("searchText");
//        String startDate = request.getParameter("startDate");
//        String endDate = request.getParameter("endDate");
//        
//        int boardId = categoryAttrElemMapDto.getAttrElemId();
//        
//        int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;
//
//        int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;
//
//        Map<String, Object> paramMap = new HashMap<String, Object>();
//        // searching condition setting
//        paramMap.put("boardId", boardId);
//        paramMap.put("searchCondition", searchCondition);
//        paramMap.put("searchText", searchText);
//        paramMap.put("startDate", startDate);
//        paramMap.put("endDate", endDate);
//
//        List<CategoryAttrElemMapDto> categoryAttrElemMapList; 
//        int totalListCnt = 0;
//
//        try{
//            
//            categoryAttrElemMapList = valueOps.get("selectCategoryAttrElemMap"+boardId+"ListAll");
//            totalListCnt = categoryAttrElemMapList.size();
//            
//            System.out.println(">>> redis pagedList print");
//            
//        }catch(Exception e){
//            CategoryAttrElemMapDto boardArticleObj = new CategoryAttrElemMapDto();
//            boardArticleObj.setBoardId(boardId);
//            
//            boardArticleList = boardArticleService.getBoardArticleList(boardArticleObj);
//            totalListCnt = boardArticleList.size(); 
//            
//            valueOps.set("selectBoardArticle"+boardId+"ListAll", boardArticleList);
//            
//            System.out.println(">>> redis pagedList setted");
//            
//            model = this.getBoardCommonList(request, model, categoryAttrElemMapDto);
//            
//            return model;
//            
//        }finally{
//            
//        }
//        
//        int startRow = (pageNo - 1) * listRowCnt;
//        int endRow   = pageNo * listRowCnt;
//        
//        List<CategoryAttrElemMapDto> pagedArticleList = new ArrayList<CategoryAttrElemMapDto>();
//        
//        if(null != boardArticleList){
//            categoryAttrElemMapDto boardArticleObj;
//            for(int i = 0; i < boardArticleList.size() ; i++){
//                
//                if((startRow - 1) <= i && i <= (endRow - 1)){                   
//                    boardArticleObj = boardArticleList.get(i);
//                    pagedArticleList.add(boardArticleObj);
//                }
//            }
//        }
//        
//        PagedList pagedList = new PagedList(pagedArticleList, pageNo, 10, totalListCnt, startRow, endRow, listRowCnt);
//        
//        System.out.println("pagedList Data : " + pagedList.toString());     
//        
//        model.addAttribute("pagedResult", pagedList);
//        model.addAttribute("boardId", boardId);
//        
//        return model;
//    }    
    
    
    
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

}
