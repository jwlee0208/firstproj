package com.firstproj.profile.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.profile.dto.ProfileAttrDto;
import com.firstproj.profile.dto.ProfileDto;
import com.firstproj.profile.dto.SearchProfileDto;

@Repository("profileDao")
public class ProfileDao extends SqlSessionDaoSupport{
	
	/**
	 * @brief 프로파일 정보 목록 조회
	 * @param params
	 * @return List<ProfileDto>
	 */
	public List<ProfileDto> selectProfileInfos(ProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectProfileInfo", params);
	}
	/**
	 * @brief 프로파일 정보 조회
	 * @param params
	 * @return ProfileDto
	 */
	public ProfileDto selectProfileInfo(ProfileDto params) {
		return getSqlSession().selectOne("sql.profile.selectProfileInfo", params);
	}	
	/**
	 * @brief 프로파일 목록 검색 조회
	 * @param params
	 * @return List<ProfileDto>
	 */
	public List<ProfileDto> selectSearchedProfileList(SearchProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectSearchedProfileList", params);
	}
	/**
	 * @brief 프로파일 목록 검색 갯수 조회
	 * @param params
	 * @return int
	 */
	public int selectSearchedProfileListCnt(SearchProfileDto params){
		return getSqlSession().selectOne("sql.profile.selectSearchedProfileListCount", params);
	}
	/**
	 * @brief 프로필 검색 목록 화면에서 리스트 필터링을 위한 속성 목록 조회
	 * @param params
	 * @return List<ProfileAttrDto>
	 */
	public List<ProfileAttrDto> selectProfileAttrElementList(ProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectSearchAttrElementList", params);
	}

}
