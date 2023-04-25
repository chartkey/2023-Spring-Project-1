package com.vitalchoice.web.productout;

public class SellerDTO {
	String seller_id, seller_pw, seller_name, seller_phone, seller_jumin, seller_email;
	int user_role;
	String business_license, business_address;
	public SellerDTO(String seller_id, String seller_pw, String seller_name, String seller_phone, String seller_jumin,
			String seller_email, int user_role, String business_license, String business_address) {
		super();
		this.seller_id = seller_id;
		this.seller_pw = seller_pw;
		this.seller_name = seller_name;
		this.seller_phone = seller_phone;
		this.seller_jumin = seller_jumin;
		this.seller_email = seller_email;
		this.user_role = user_role;
		this.business_license = business_license;
		this.business_address = business_address;
	}
	public SellerDTO() {
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_pw() {
		return seller_pw;
	}
	public void setSeller_pw(String seller_pw) {
		this.seller_pw = seller_pw;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_phone() {
		return seller_phone;
	}
	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}
	public String getSeller_jumin() {
		return seller_jumin;
	}
	public void setSeller_jumin(String seller_jumin) {
		this.seller_jumin = seller_jumin;
	}
	public String getSeller_email() {
		return seller_email;
	}
	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	public String getBusiness_license() {
		return business_license;
	}
	public void setBusiness_license(String business_license) {
		this.business_license = business_license;
	}
	public String getBusiness_address() {
		return business_address;
	}
	public void setBusiness_address(String business_address) {
		this.business_address = business_address;
	}
}