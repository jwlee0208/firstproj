package com.firstproj.profile.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.firstproj.profile.dao.ProfileDao;
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

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{
	
	private static final Log logger = LogFactory.getLog(ProfileServiceImpl.class);
	
	@Resource(name="profileDao")
	private ProfileDao profileDao;
	
	/**
	 * @brief 프로파일 정보 목록 조회(none-paging)
	 * @param profileInfo
	 * @return
	 */
	@Override
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo){
		return this.profileDao.selectProfileInfos(profileInfo);				
	}
	/**
	 * @brief 프로파일 정보 조회
	 * @param profileInfo
	 * @return
	 */
	@Override
	public ProfileDto getProfileInfo(ProfileDto profileInfo){
		return this.profileDao.selectProfileInfo(profileInfo);				
	}
	/**
	 * @brief 프로파일 검색 정보 조회
	 * @param searchProfileDto
	 * @return
	 */
	@Override
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto){
		return this.profileDao.selectSearchedProfileList(searchProfileDto);
	}
	/**
	 * @brief 프로파일 검색 정보 갯수 조회
	 * @param searchProfileDto
	 * @return
	 */
	@Override
	public int getSearchedProfileListCnt(SearchProfileDto searchProfileDto){
		return this.profileDao.selectSearchedProfileListCnt(searchProfileDto);
	}
	
	/**
	 * @brief 프로필 검색 목록 화면에서 리스트 필터링을 위한 속성 목록 조회
	 * @param profileDto
	 * @return
	 */
	public List<ProfileAttrDto> getProfileAttrElementList(ProfileDto profileDto){
		logger.debug("[ProfileServiceImpl.getProfileAttrElementList] select result : " + this.profileDao.selectProfileAttrElementList(profileDto));
		return this.profileDao.selectProfileAttrElementList(profileDto);
	}
	
	public int addProfileInfos(ProfileDto profileDto){
		
		int profileId = this.addProfileInfo(profileDto);
		
		logger.debug("profileId is " + profileId);
		
		if(profileId > 0){
			if(profileDto.getProfileType().equals("1")){
				ProfilePlayerDto profilePlayerParam = profileDto.getProfilePlayerDto();
				if(profilePlayerParam != null){
					profilePlayerParam.setProfileId(profileId);
					this.addProfilePlayerInfo(profilePlayerParam);
				}
				List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
				if(profileCareerParamList != null && profileCareerParamList.size() > 0){
					for(ProfileCareerDto profileCareerParam : profileCareerParamList){
						profileCareerParam.setProfileId(profileId);
						this.addProfileCareerInfo(profileCareerParam);
					}
				}
				List<ProfileStatHitterDto> profileStatHitterParamList = profileDto.getProfileStatHitterList();
				if(profileStatHitterParamList != null && profileStatHitterParamList.size() > 0){
					for(ProfileStatHitterDto profileStatHitterParam : profileStatHitterParamList){
						profileStatHitterParam.setProfileId(profileId);
						this.addProfileStatHitterInfo(profileStatHitterParam);	
					}
				}
				
				List<ProfileStatFielderDto> profileStatFielderParamList = profileDto.getProfileStatFielderList();
				if(profileStatFielderParamList != null && profileStatFielderParamList.size() > 0){
					for(ProfileStatFielderDto profileStatFielderParam : profileStatFielderParamList){
						profileStatFielderParam.setProfileId(profileId);
						this.addProfileStatFielderInfo(profileStatFielderParam);	
					}
				}
				
				List<ProfileStatPitcherDto> profileStatPitcherParamList = profileDto.getProfileStatPitcherList();
				if(profileStatPitcherParamList != null && profileStatPitcherParamList.size() > 0){
					for(ProfileStatPitcherDto profileStatPitcherParam : profileStatPitcherParamList){
						profileStatPitcherParam.setProfileId(profileId);
						this.addProfileStatPitcherInfo(profileStatPitcherParam);	
					}
				}			
				
			}else if(profileDto.getProfileType().equals("2")){
				
			}else if(profileDto.getProfileType().equals("3")){
				ProfileTeamDto profileTeamParam = profileDto.getProfileTeamDto();
				if(profileTeamParam != null){
					profileTeamParam.setProfileId(profileId);
					this.addProfileTeamInfo(profileTeamParam);
				}
			}
			
			ProfileContactInfoDto profileContactInfoParam = profileDto.getProfileContactInfoDto();
			if(profileContactInfoParam != null){
				profileContactInfoParam.setProfileId(profileId);
				this.addProfileContactInfo(profileContactInfoParam);
			}
			
			
			List<ProfileStreamDto> profileStreamParamList = profileDto.getProfileStreamList();
			if(profileStreamParamList != null && profileStreamParamList.size() > 0){
				for(ProfileStreamDto profileStreamParam : profileStreamParamList){
					profileStreamParam.setProfileId(profileId);
					this.addProfileStreamInfo(profileStreamParam);
				}
			}
			
			
			List<ProfileAttrElementMapDto> profileAttrElementMapParamList = profileDto.getProfileAttrElementMapList();
			if(profileAttrElementMapParamList != null && profileAttrElementMapParamList.size() > 0){
				for(ProfileAttrElementMapDto profileAttrElementMapParam : profileAttrElementMapParamList){
					if(profileAttrElementMapParam.getProfileAttrElementId() > 0){
						profileAttrElementMapParam.setProfileId(profileId);
						this.addProfileAttrElemMapInfo(profileAttrElementMapParam);						
					}
				}
			}
		}
		
		return 0;
	}
	
	private int addProfileInfo(ProfileDto profileDto){
		return this.profileDao.insertProfileInfo(profileDto);
	}
	
	private int addProfilePlayerInfo(ProfilePlayerDto profilePlayerDto){
		return this.profileDao.insertProfilePlayerInfo(profilePlayerDto);
	}
	
	private int addProfileContactInfo(ProfileContactInfoDto profileContactInfoDto){
		return this.profileDao.insertProfileContactInfo(profileContactInfoDto);
	}
	
	private int addProfileStatHitterInfo(ProfileStatHitterDto profileStatHitterDto){
		return this.profileDao.insertProfileStatHitterInfo(profileStatHitterDto);
	}
	
	private int addProfileStatFielderInfo(ProfileStatFielderDto proStatFielderDto){
		return this.profileDao.insertProfileStatFielderInfo(proStatFielderDto);
	}
	
	private int addProfileStatPitcherInfo(ProfileStatPitcherDto profileStatPitcherDto){
		return this.profileDao.insertProfileStatPitcherInfo(profileStatPitcherDto);
	}
	
	private int addProfileCareerInfo(ProfileCareerDto profileCareerDto){
		return this.profileDao.insertProfileCareerInfo(profileCareerDto);
	}
	
	private int addProfileStreamInfo(ProfileStreamDto profileStreamDto){
		return this.profileDao.insertProfileStreamInfo(profileStreamDto);
	}
	
	private int addProfileAttrElemMapInfo(ProfileAttrElementMapDto profileAttrElementMapDto){
		return this.profileDao.insertProfileAttrElemMapInfo(profileAttrElementMapDto);
	}
	
	private int addProfileTeamInfo(ProfileTeamDto profileTeamDto){
		return this.profileDao.insertProfileTeamInfo(profileTeamDto);
	}
	
	
	@Override
	public int addLeagueInfo(LeagueInfoDto leagueInfoDto){
		return this.profileDao.insertLeagueInfo(leagueInfoDto);
	}
	
	@Override
	public List<LeagueInfoDto> getLeagueInfoList(){
		return this.profileDao.selectLeagueInfoList();
	}
	
	@Override
	public LeagueInfoDto getLeagueInfo(int leagueId){
		LeagueInfoDto leagueInfoDto = new LeagueInfoDto();
		leagueInfoDto.setLeagueId(leagueId);
		return this.profileDao.selectLeagueInfo(leagueInfoDto);
	}
}
