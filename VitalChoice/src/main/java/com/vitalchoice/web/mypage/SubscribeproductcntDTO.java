package com.vitalchoice.web.mypage;

public class SubscribeproductcntDTO {
	int subscribe_num;
	String product_num,product_name,product_count,product_price,product_totPrice;
	int total_cnt;
	public SubscribeproductcntDTO() {
	}
	public SubscribeproductcntDTO(int subscribe_num, String product_num, String product_name, String product_count,
			String product_price, String product_totPrice, int total_cnt) {
		super();
		this.subscribe_num = subscribe_num;
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_count = product_count;
		this.product_price = product_price;
		this.product_totPrice = product_totPrice;
		this.total_cnt = total_cnt;
	}
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
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
	public String getProduct_totPrice() {
		return product_totPrice;
	}
	public void setProduct_totPrice(String product_totPrice) {
		this.product_totPrice = product_totPrice;
	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
}