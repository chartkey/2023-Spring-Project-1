package com.vitalchoice.web.sellerorder;

public class SellerOrderDTO {
	int order_num;
	String product_num, product_name, product_count, product_price, product_totprice, delivery_status;//order_product의 스테이터스
	String user_id, delivery_date, delivery_name, delivery_address1, delivery_address2, delivery_address3, delivery_phone, delivery_request;
	public SellerOrderDTO(int order_num, String product_num, String product_name, String product_count,
			String product_price, String product_totprice, String delivery_status, String user_id, String delivery_date,
			String delivery_name, String delivery_address1, String delivery_address2, String delivery_address3,
			String delivery_phone, String delivery_request) {
		super();
		this.order_num = order_num;
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_count = product_count;
		this.product_price = product_price;
		this.product_totprice = product_totprice;
		this.delivery_status = delivery_status;
		this.user_id = user_id;
		this.delivery_date = delivery_date;
		this.delivery_name = delivery_name;
		this.delivery_address1 = delivery_address1;
		this.delivery_address2 = delivery_address2;
		this.delivery_address3 = delivery_address3;
		this.delivery_phone = delivery_phone;
		this.delivery_request = delivery_request;
	}
	public SellerOrderDTO() {
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_count() {
		return product_count;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_totprice() {
		return product_totprice;
	}
	public void setProduct_totprice(String product_totprice) {
		this.product_totprice = product_totprice;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getDelivery_name() {
		return delivery_name;
	}
	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}
	public String getDelivery_address1() {
		return delivery_address1;
	}
	public void setDelivery_address1(String delivery_address1) {
		this.delivery_address1 = delivery_address1;
	}
	public String getDelivery_address2() {
		return delivery_address2;
	}
	public void setDelivery_address2(String delivery_address2) {
		this.delivery_address2 = delivery_address2;
	}
	public String getDelivery_address3() {
		return delivery_address3;
	}
	public void setDelivery_address3(String delivery_address3) {
		this.delivery_address3 = delivery_address3;
	}
	public String getDelivery_phone() {
		return delivery_phone;
	}
	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}
	public String getDelivery_request() {
		return delivery_request;
	}
	public void setDelivery_request(String delivery_request) {
		this.delivery_request = delivery_request;
	}
}