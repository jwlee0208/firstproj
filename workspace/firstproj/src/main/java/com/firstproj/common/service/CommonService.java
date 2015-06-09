package com.firstproj.common.service;

import java.util.List;

import com.firstproj.common.dto.CodeDto;

public interface CommonService {
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception;
}
