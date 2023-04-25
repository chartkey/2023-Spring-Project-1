package com.vitalchoice.web.survey;

import java.util.ArrayList;

public interface Service_survey {
	public ArrayList<SurveyDTO> surveylist(String survey_gender, String survey_age);
	public void suveyinsert(String userId, String surveyNum, String categoryNum, String surveyCheck, String surveyAge);
	public String surveycheck(String id);
	public ArrayList<SurveydetailDTO> surveyresult(String userId);
}