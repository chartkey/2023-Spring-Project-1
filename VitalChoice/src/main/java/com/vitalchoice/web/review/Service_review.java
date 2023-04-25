package com.vitalchoice.web.review;

public interface Service_review {

	public PrdshowDTO prdout(int product_num);
	public void insertReview(int product_num, String user_id, String content, int review_grade);
	public void insertReviewImageFile(int i, int product_num, String user_id, String fname, String string);
	public double getGrade(int product_num);
	public void updateGrade(double grade, int product_num);
}