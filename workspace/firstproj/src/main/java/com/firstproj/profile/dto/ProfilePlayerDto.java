package com.firstproj.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profilePlayerDto")
public class ProfilePlayerDto extends ProfileDto {
	
	private int 	profilePlayerId;
	private String 	birthDate;
	private float 	height;
	private float 	weight;
	private String 	birthPlace;
	private String 	education;
	private String 	hobbies;
	private String 	favoriteFood;
	private String 	nationality;
	private String 	language;
	
	public int getProfilePlayerId() {
		return profilePlayerId;
	}
	public void setProfilePlayerId(int profilePlayerId) {
		this.profilePlayerId = profilePlayerId;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getFavoriteFood() {
		return favoriteFood;
	}
	public void setFavoriteFood(String favoriteFood) {
		this.favoriteFood = favoriteFood;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	@Override
	public String toString() {
		return "ProfilePlayerDto [profilePlayerId=" + profilePlayerId + ", birthDate=" + birthDate + ", height="
				+ height + ", weight=" + weight + ", birthPlace=" + birthPlace + ", education=" + education
				+ ", hobbies=" + hobbies + ", favoriteFood=" + favoriteFood + ", nationality=" + nationality
				+ ", language=" + language + "]";
	}
	
}
