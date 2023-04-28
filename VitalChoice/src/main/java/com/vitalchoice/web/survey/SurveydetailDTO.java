package com.vitalchoice.web.survey;

public class SurveydetailDTO {
	String user_id,survey_num,category_num,survey_check,survey_age,survey_gender;
	String category_detail;
	public SurveydetailDTO() {
	}
	public SurveydetailDTO(String user_id, String survey_num, String category_num, String survey_check,
			String survey_age, String survey_gender, String category_detail) {
		super();
		this.user_id = user_id;
		this.survey_num = survey_num;
		this.category_num = category_num;
		this.survey_check = survey_check;
		this.survey_age = survey_age;
		this.survey_gender = survey_gender;
		this.category_detail = category_detail;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSurvey_num() {
		return survey_num;
	}
	public void setSurvey_num(String survey_num) {
		this.survey_num = survey_num;
	}
	public String getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}
	public String getSurvey_check() {
		return survey_check;
	}
	public void setSurvey_check(String survey_check) {
		this.survey_check = survey_check;
	}
	public String getSurvey_age() {
		return survey_age;
	}
	public void setSurvey_age(String survey_age) {
		this.survey_age = survey_age;
	}
	public String getSurvey_gender() {
		return survey_gender;
	}
	public void setSurvey_gender(String survey_gender) {
		this.survey_gender = survey_gender;
	}
	public String getCategory_detail() {
		return category_detail;
	}
	public void setCategory_detail(String category_detail) {
		this.category_detail = category_detail;
	}
}