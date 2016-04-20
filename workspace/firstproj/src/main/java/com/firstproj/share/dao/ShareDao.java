package com.firstproj.share.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.common.dto.ShareDto;

@Repository("ShareDao")
public class ShareDao extends SqlSessionDaoSupport{

    public ShareDto selectShareInfo(ShareDto shareDto) throws Exception{
        return getSqlSession().selectOne("sql.share.selectShareInfo", shareDto);
    }
    
    public int insertShareInfo(ShareDto shareDto) throws Exception{
        return getSqlSession().insert("sql.share.insertShareInfo", shareDto);
    }
    
    public int updateShareInfo(ShareDto shareDto) throws Exception{
        return getSqlSession().update("sql.share.updateShareInfo", shareDto);
    }
}
