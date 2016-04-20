package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.dto.SideBoardCategoryPortalDto;
import com.firstproj.board.dto.SlideshareLinkDto;
import com.firstproj.common.util.PagedList;

public interface BoardArticleService {
	public List<BoardArticleDto>               getBoardArticleList(BoardArticleDto boardArticleDto) throws Exception;
	public int                                 selectArticleListCnt(Map<String, Object> param) throws Exception;
	public PagedList                           getBoardArticlePagedList(Map<String, Object> paramMap) throws Exception;
	public List<BoardArticleDto>               getBoardArticleList(Map<String,Object> paramMap) throws Exception;
	
	public PagedList                           getBoardArticlePagedListForJson(Map<String, Object> paramMap) throws Exception;
	
	public int                                 insertBoardArticle(BoardArticleDto boardArticleDto);
	public int                                 updateBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public int                                 deleteBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	
	public BoardArticleDto                     selectBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public BoardArticleDto                     selectPrevBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public BoardArticleDto                     selectNextBoardArticle(BoardArticleDto boardArticleDto) throws Exception; 
	
	public List<BoardArticleDto>               selectBoardArticleFive(BoardArticleDto boardArticleDto) throws Exception;
	public List<SideBoardCategoryPortalDto>    selectSideBoardList(BoardDto boardDto) throws Exception;
    public int                                 insertSlideshareInfo(SlideshareLinkDto slideshareLinkDto);
    public int                                 updateSlideshareInfo(SlideshareLinkDto slideshareLinkDto);
}
