package com.firstproj.prohibiteword.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.prohibiteword.dao.ProhibiteWordDao;

@Service
public class ProhibiteServiceImpl {
	@Resource(name="prohibiteWordDao")
	private ProhibiteWordDao prohibiteWordDao;
}
