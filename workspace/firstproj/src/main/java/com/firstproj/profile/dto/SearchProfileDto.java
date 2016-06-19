package com.firstproj.profile.dto;

import org.apache.ibatis.type.Alias;

import com.firstproj.common.paging.PageParam;

@Alias("profile.searchProfileDto")
public class SearchProfileDto extends PageParam{

	private String      searchCondition;
    private String      searchText;
    
    private int			profileId;
    private int			profileType;
    private String		catId1;

    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public int getProfileType() {
		return profileType;
	}

	public void setProfileType(int profileType) {
		this.profileType = profileType;
	}

	public String getCatId1() {
		return catId1;
	}

	public void setCatId1(String catId1) {
		this.catId1 = catId1;
	}

}
