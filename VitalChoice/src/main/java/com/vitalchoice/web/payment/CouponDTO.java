package com.vitalchoice.web.payment;

public class CouponDTO {
	 int coupon_num,discount_rate;
	 String user_id,issue_date;
	public CouponDTO() {
	}
	public CouponDTO(int coupon_num, int discount_rate, String user_id, String issue_date) {
		super();
		this.coupon_num = coupon_num;
		this.discount_rate = discount_rate;
		this.user_id = user_id;
		this.issue_date = issue_date;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}
}