package com.firstproj.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardArticleRedisDao;

@Service("BoardArticleRedisServiceImpl")
public class BoardArticleRedisServiceImpl implements BoardArticleRedisService{

	@Inject
	private BoardArticleRedisDao boardArticleRedisDao; 
	/*
	@Override
	public String get(String key) throws Exception{
		return this.boardArticleRedisDao.get(key);
	}
	
	@Override
	public String set(String key, String value) throws Exception{
		return this.boardArticleRedisDao.set(key, value);
	}
    */

	
	
}
