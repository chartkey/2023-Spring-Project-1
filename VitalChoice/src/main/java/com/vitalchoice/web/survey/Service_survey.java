package com.vitalchoice.web.survey;

import java.util.ArrayList;

import com.vitalchoice.web.product.ProductDTO;

public interface Service_survey {
	public ArrayList<SurveyDTO> surveylist(String survey_gender, String survey_age);
	public void suveyinsert(String userId, String surveyNum, String categoryNum, String surveyCheck, String surveyAge);
	public String surveycheck(String id);
	public ArrayList<SurveydetailDTO> surveyresult(String userId);
	public ArrayList<ProductDTO> surveyresult2(String num);
	public ArrayList<ProductDTO> surveyresult3();
}