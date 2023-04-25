package com.vitalchoice.web.payment;

import java.util.ArrayList;

public interface Service_payment {
	public PayerDTO payerout(String id);
	public ArrayList<CouponDTO> couponlist(String id);
	public ArrayList<CouponDTO> selectedcoupon(String couponNum);
	public void deliveryinfoinsert(String user_id, String delivery_name, String delivery_address1,
			String delivery_address2, String delivery_address3, String delivery_phone, String delivery_request, 
			int coupon_sale, int grade_sale, int delivery_fee, int point, int total_payment, int coupon_num, int discount_rate);
	public String inquiry();
	public void deliveryproductinsert(String order_num ,String product_num, String product_name, String product_count, 
			String product_price, String product_totPrice);
	public void totpurchase_point(int total_payment, int point, int grade_sale, String user_id);
	public void couponused(int coupon_num, String user_id);
	public void cartdelete(String user_id);
	public String deliveryemail(String user_id);
}