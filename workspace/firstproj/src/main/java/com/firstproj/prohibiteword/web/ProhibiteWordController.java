package com.firstproj.prohibiteword.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.common.util.PagedList;
import com.firstproj.prohibiteword.dto.ProhibiteWordDto;
import com.firstproj.prohibiteword.service.ProhibiteServiceImpl;

@Controller
@RequestMapping(value="/prohibite")
public class ProhibiteWordController {

	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;

	@Resource(name="ProhibiteServiceImpl")
	private ProhibiteServiceImpl prohibiteService;
	
	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getProhibiteWordList(HttpServletRequest request, Model model, ProhibiteWordDto prohibiteWordDto) throws Exception {

		model = this.getProhibiteCommonList(request, model, prohibiteWordDto);
		
		return "prohibite/list";
	}

	private Model getProhibiteCommonList(HttpServletRequest request, Model model, ProhibiteWordDto prohibiteWordDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText = request.getParameter("searchText");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

		int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText", searchText);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);

		int totalListCnt = prohibiteService.selectListCnt(paramMap);

		// paging condition setting
		paramMap.put("pageNo", pageNo);
		paramMap.put("listRowCnt", listRowCnt);
		paramMap.put("totalListCnt", totalListCnt);
		paramMap.put("pageSize", DEFAULT_PAGE_SIZE);

		PagedList result = prohibiteService.getProhibitePagedList(paramMap);

		model.addAttribute("pagedResult", result);
		return model;
	}
	
	@RequestMapping(value = "/write.page")
	public String writeBoard(Model model, ProhibiteWordDto prohibiteWordDto) {
		return "prohibite/write";
	}

	@RequestMapping(value = "/insertProhibiteWord.json")
	@ResponseBody
	public JSONObject insertProhibiteWord(@Valid ProhibiteWordDto prohibiteWordDto, BindingResult bindingResult) throws Exception {

		JSONObject jsonObj = new JSONObject();
		int insertResult = 0;
		
		if(bindingResult.hasErrors()){
			jsonObj.put("validate", false);
		}else{
			insertResult = this.prohibiteService.insertProhibiteWord(prohibiteWordDto);
		}
		
		jsonObj.put("result", (insertResult > 0) ? true : false);
		return jsonObj;
	}	
}
