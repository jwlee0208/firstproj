package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardDao;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="BoardDao")
	private BoardDao boardDao;
	
	@Override
	public List<BoardDto> getBoardList() throws Exception{
		return this.boardDao.getBoardList();
	}
	@Override
	public int selectListCnt(Map<String, Object> param) throws Exception {                     
	       return boardDao.selectListCnt(param);      
	}    
	@Override
	public PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> articleList = this.getBoardList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize
                                      , totalListCnt, startRow, endRow, listRowCnt);
	    return pagedList;
	}   
	@Override
	public List<BoardDto> getBoardList(Map<String,Object> paramMap) throws Exception {                       
	       int pageNo     = (Integer) paramMap.get("pageNo");                                   
	       int listRowCnt = (Integer) paramMap.get("listRowCnt");
	       int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
	       int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
	 
	       paramMap.put("startRow", startRow);                                     
	       paramMap.put("endRow", endRow);
	       return boardDao.selectBoardList(paramMap);            
	} 
	
	public int insertBoard(BoardDto boardDto) throws Exception{
		return this.boardDao.insertBoard(boardDto);
	}
}
