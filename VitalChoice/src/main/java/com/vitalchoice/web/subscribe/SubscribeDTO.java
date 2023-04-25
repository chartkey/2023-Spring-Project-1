package com.vitalchoice.web.subscribe;

public class SubscribeDTO {
	String user_id,subscribe_day,delivery_date,delivery_name,delivery_address1,delivery_address2,delivery_address3,delivery_phone,delivery_request;
	int subscribe_num,coupon_sale,grade_sale,delivery_fee,point,total_payment;
	int coupon_num,discount_rate;
	String product_name;
	int total_cnt;
	String delivery_status;
	public SubscribeDTO() {
	}
	public SubscribeDTO(String user_id, String subscribe_day, String delivery_date, String delivery_name,
			String delivery_address1, String delivery_address2, String delivery_address3, String delivery_phone,
			String delivery_request, int subscribe_num, int coupon_sale, int grade_sale, int delivery_fee, int point,
			int total_payment, int coupon_num, int discount_rate, String product_name, int total_cnt,
			String delivery_status) {
		super();
		this.user_id = user_id;
		this.subscribe_day = subscribe_day;
		this.delivery_date = delivery_date;
		this.delivery_name = delivery_name;
		this.delivery_address1 = delivery_address1;
		this.delivery_address2 = delivery_address2;
		this.delivery_address3 = delivery_address3;
		this.delivery_phone = delivery_phone;
		this.delivery_request = delivery_request;
		this.subscribe_num = subscribe_num;
		this.coupon_sale = coupon_sale;
		this.grade_sale = grade_sale;
		this.delivery_fee = delivery_fee;
		this.point = point;
		this.total_payment = total_payment;
		this.coupon_num = coupon_num;
		this.discount_rate = discount_rate;
		this.product_name = product_name;
		this.total_cnt = total_cnt;
		this.delivery_status = delivery_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSubscribe_day() {
		return subscribe_day;
	}
	public void setSubscribe_day(String subscribe_day) {
		this.subscribe_day = subscribe_day;
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
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
	}
	public int getCoupon_sale() {
		return coupon_sale;
	}
	public void setCoupon_sale(int coupon_sale) {
		this.coupon_sale = coupon_sale;
	}
	public int getGrade_sale() {
		return grade_sale;
	}
	public void setGrade_sale(int grade_sale) {
		this.grade_sale = grade_sale;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(int total_payment) {
		this.total_payment = total_payment;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
}