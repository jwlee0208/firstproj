package com.firstproj.profile.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.profile.dto.LeagueInfoDto;
import com.firstproj.profile.dto.ProfileAttrDto;
import com.firstproj.profile.dto.ProfileAttrElementMapDto;
import com.firstproj.profile.dto.ProfileCareerDto;
import com.firstproj.profile.dto.ProfileContactInfoDto;
import com.firstproj.profile.dto.ProfileDto;
import com.firstproj.profile.dto.ProfilePlayerDto;
import com.firstproj.profile.dto.ProfileStatFielderDto;
import com.firstproj.profile.dto.ProfileStatHitterDto;
import com.firstproj.profile.dto.ProfileStatPitcherDto;
import com.firstproj.profile.dto.ProfileStreamDto;
import com.firstproj.profile.dto.ProfileTeamDto;
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
	
	/**
	 * @brief insert profileInfo
	 * @param param
	 * @return (int)profileId
	 */
	public int insertProfileInfo(ProfileDto param){
		int insertResult = getSqlSession().insert("sql.profile.insertProfileInfo", param);
		int profileId = 0;
    	if(insertResult > 0){
    		profileId = param.getProfileId();
    	}
    	return profileId;
	}

	/**
	 * @brief insert profilePlayerInfo 
	 * @param param
	 * @return int
	 */
	public int insertProfilePlayerInfo(ProfilePlayerDto param){
		return getSqlSession().insert("sql.profile.insertProfilePlayerInfo", param);
	}
	
	public int insertProfileContactInfo(ProfileContactInfoDto param){
		return getSqlSession().insert("sql.profile.insertProfileContactInfo", param);
	}
	
	public int insertProfileStatFielderInfo(ProfileStatFielderDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatFielderInfo", param);
	}
	
	public int insertProfileStatHitterInfo(ProfileStatHitterDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatHitterInfo", param);
	}
	
	public int insertProfileStatPitcherInfo(ProfileStatPitcherDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatPitcherInfo", param);
	}
	
	public int insertProfileStreamInfo(ProfileStreamDto param){
		return getSqlSession().insert("sql.profile.insertProfileStreamInfo", param);
	}
	
	public int insertProfileAttrElemMapInfo(ProfileAttrElementMapDto param){
		return getSqlSession().insert("sql.profile.insertProfileAttrElemMapInfo", param);
	}
	
	public int insertProfileCareerInfo(ProfileCareerDto param){
		return getSqlSession().insert("sql.profile.insertProfileCareerInfo", param);
	}
	
	public int insertLeagueInfo(LeagueInfoDto param){
		return getSqlSession().insert("sql.profile.insertLeagueInfo", param);
	}
	
	public int insertProfileTeamInfo(ProfileTeamDto param){
		return getSqlSession().insert("sql.profile.insertProfileTeamInfo", param);
	}
	
	public List<LeagueInfoDto> selectLeagueInfoList(){
		return getSqlSession().selectList("sql.profile.selectLeagueInfoList");
	}
	
	public LeagueInfoDto selectLeagueInfo(LeagueInfoDto param){
		return getSqlSession().selectOne("sql.profile.selectLeagueInfo", param);
	}
}
