package com.firstproj.common.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.common.dto.CodeDto;

@Repository("CommonDao")
public class CommonDao extends SqlSessionDaoSupport{
    public List<CodeDto> selectCodeList(CodeDto param) throws Exception{
        return getSqlSession().selectList("sql.common.selectCodeList", param);
    }

}
