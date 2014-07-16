package com.firstproj.prohibiteword.service;

import java.util.List;
import java.util.Map;

import com.firstproj.common.util.PagedList;
import com.firstproj.prohibiteword.dto.ProhibiteWordDto;

public interface ProhibiteService {
	public List<ProhibiteWordDto> getProhibiteList() throws Exception;
	public int selectListCnt(Map<String, Object> param) throws Exception ;
	public PagedList getProhibitePagedList(Map<String, Object> paramMap) throws Exception;
	public List<ProhibiteWordDto> getProhibiteList(Map<String,Object> paramMap) throws Exception ;
	public int insertProhibiteWord(ProhibiteWordDto prohibiteWordDto) throws Exception;
}
