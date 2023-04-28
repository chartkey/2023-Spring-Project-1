package com.vitalchoice.web.survey;

public class SurveyDTO {
	String survey_num,survey_bigo,category_num,survey_age,survey_gender;
	public SurveyDTO() {
	}
	public SurveyDTO(String survey_num, String survey_bigo, String category_num, String survey_age,
			String survey_gender) {
		super();
		this.survey_num = survey_num;
		this.survey_bigo = survey_bigo;
		this.category_num = category_num;
		this.survey_age = survey_age;
		this.survey_gender = survey_gender;
	}
	public String getSurvey_num() {
		return survey_num;
	}
	public void setSurvey_num(String survey_num) {
		this.survey_num = survey_num;
	}
	public String getSurvey_bigo() {
		return survey_bigo;
	}
	public void setSurvey_bigo(String survey_bigo) {
		this.survey_bigo = survey_bigo;
	}
	public String getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = category_num;
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
}