package com.vitalchoice.web.review;

public class ReviewDTO {
	String user_id, content, reporting_date;
	int review_grade;
	String stored_img_file1, stored_img_file2;
	
	public ReviewDTO(String user_id, String content, String reporting_date, int review_grade, String stored_img_file1,
			String stored_img_file2) {
		super();
		this.user_id = user_id;
		this.content = content;
		this.reporting_date = reporting_date;
		this.review_grade = review_grade;
		this.stored_img_file1 = stored_img_file1;
		this.stored_img_file2 = stored_img_file2;
	}
	public ReviewDTO() {
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public String getStored_img_file1() {
		return stored_img_file1;
	}
	public void setStored_img_file1(String stored_img_file1) {
		this.stored_img_file1 = stored_img_file1;
	}
	public String getStored_img_file2() {
		return stored_img_file2;
	}
	public void setStored_img_file2(String stored_img_file2) {
		this.stored_img_file2 = stored_img_file2;
	}
}