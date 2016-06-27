package com.firstproj.profile.service;

import java.util.List;

import com.firstproj.profile.dto.LeagueInfoDto;
import com.firstproj.profile.dto.ProfileDto;
import com.firstproj.profile.dto.SearchProfileDto;

public interface ProfileService {
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo);
	public ProfileDto 		getProfileInfo(ProfileDto profileInfo);
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto);
	public int 				getSearchedProfileListCnt(SearchProfileDto searchProfileDto);
	public int 				addLeagueInfo(LeagueInfoDto leagueInfoDto);
	public List<LeagueInfoDto> getLeagueInfoList();
}
