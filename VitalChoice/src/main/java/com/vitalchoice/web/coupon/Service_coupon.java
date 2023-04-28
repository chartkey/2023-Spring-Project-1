package com.vitalchoice.web.coupon;

public interface Service_coupon {
	public void insert(String user_id,int discount_rate,String issue_date);
	public String couponcheck(String user_id,String issue_date);
}