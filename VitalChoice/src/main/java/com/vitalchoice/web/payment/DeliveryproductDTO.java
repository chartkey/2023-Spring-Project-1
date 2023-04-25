package com.vitalchoice.web.payment;

public class DeliveryproductDTO {
	String product_num,product_name,product_count,product_price,product_totPrice;
	String order_num,delivery_date,delivery_address2,delivery_status,delivery_status1;
	public DeliveryproductDTO() {
	}
	public DeliveryproductDTO(String product_num, String product_name, String product_count, String product_price,
			String product_totPrice, String order_num, String delivery_date, String delivery_address2,
			String delivery_status, String delivery_status1) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_count = product_count;
		this.product_price = product_price;
		this.product_totPrice = product_totPrice;
		this.order_num = order_num;
		this.delivery_date = delivery_date;
		this.delivery_address2 = delivery_address2;
		this.delivery_status = delivery_status;
		this.delivery_status1 = delivery_status1;
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
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getDelivery_address2() {
		return delivery_address2;
	}
	public void setDelivery_address2(String delivery_address2) {
		this.delivery_address2 = delivery_address2;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getDelivery_status1() {
		return delivery_status1;
	}
	public void setDelivery_status1(String delivery_status1) {
		this.delivery_status1 = delivery_status1;
	}
}