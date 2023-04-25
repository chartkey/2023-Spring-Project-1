package com.vitalchoice.web.sellerlogin;

public interface Service_SellerLogin {
	public String login(String seller_id, String seller_pw);
	public StoreDTO getStoreSname(String log_id);
}