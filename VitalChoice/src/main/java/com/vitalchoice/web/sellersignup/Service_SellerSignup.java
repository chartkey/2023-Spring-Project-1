package com.vitalchoice.web.sellersignup;

public interface Service_SellerSignup {
	public void insertSellerSignup(String seller_id, String seller_pw, String seller_name, String seller_phone,
			String seller_email, String business_license, String business_address);
	public void insertStore(String seller_id, String store_sname);
}