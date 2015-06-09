package com.firstproj.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.firstproj.common.dao.CommonDao;
import com.firstproj.common.dto.CodeDto;
import com.firstproj.common.service.CommonService;

@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService{
    final Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="CommonDao")
    private CommonDao commonDao;
    
    @Override
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception{
        return this.commonDao.selectCodeList(codeDto);
    }
    
    
    
}
