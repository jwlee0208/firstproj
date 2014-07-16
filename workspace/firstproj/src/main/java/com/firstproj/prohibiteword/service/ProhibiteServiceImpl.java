package com.firstproj.prohibiteword.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;
import com.firstproj.prohibiteword.dao.ProhibiteWordDao;
import com.firstproj.prohibiteword.dto.ProhibiteWordDto;

@Service
public class ProhibiteServiceImpl implements ProhibiteService{
	@Resource(name="prohibiteWordDao")
	private ProhibiteWordDao prohibiteWordDao;

	@Override
	public List<ProhibiteWordDto> getProhibiteList() throws Exception{
		return this.prohibiteWordDao.getProhibiteList();
	}
	@Override
	public int selectListCnt(Map<String, Object> param) throws Exception {                     
	       return prohibiteWordDao.selectListCnt(param);      
	}    
	@Override
	public PagedList getProhibitePagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> articleList = this.getProhibiteList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
	    return pagedList;
	}   
	@Override
	public List<ProhibiteWordDto> getProhibiteList(Map<String,Object> paramMap) throws Exception {                       
	       int pageNo     = (Integer) paramMap.get("pageNo");                                   
	       int listRowCnt = (Integer) paramMap.get("listRowCnt");
	       int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
	       int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
	 
	       paramMap.put("startRow", startRow);                                     
	       paramMap.put("endRow", endRow);
	       return prohibiteWordDao.selectProhibiteList(paramMap);            
	} 
	
	@Override
	public int insertProhibiteWord(ProhibiteWordDto prohibiteWordDto) throws Exception{
		return this.prohibiteWordDao.insertProhibiteWord(prohibiteWordDto);
	}	

}
