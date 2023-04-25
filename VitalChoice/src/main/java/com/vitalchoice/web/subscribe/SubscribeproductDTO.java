package com.vitalchoice.web.subscribe;

public class SubscribeproductDTO {
	String product_num,product_name,product_count,product_price,product_totPrice;
	public SubscribeproductDTO() {
	}
	public SubscribeproductDTO(String product_num, String product_name, String product_count, String product_price,
			String product_totPrice) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_count = product_count;
		this.product_price = product_price;
		this.product_totPrice = product_totPrice;
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
}