package com.vitalchoice.web.mypage;

import java.util.ArrayList;

import com.vitalchoice.web.payment.CouponDTO;
import com.vitalchoice.web.payment.DeliveryDTO;
import com.vitalchoice.web.payment.DeliveryproductDTO;
import com.vitalchoice.web.subscribe.SubscribeDTO;

public interface Service_mypage {
	public MemberDTO logincheck(String id,String pw);
	public String modify_pwcheck(String id,String pw);
	public ArrayList<DeliveryDTO> orderout(String id);
	public DeliveryproductcntDTO deliveryproductcnt(int order_num);
	public DeliveryDTO orderdetail(String order_num);
	public ArrayList<DeliveryproductDTO> orderdetailproduct(String order_num);
	public ArrayList<SubscribeDTO> subscribeout(String id);
	public SubscribeproductcntDTO subscribeproductcnt(int subscribe_num);
	public SubscribeDTO subscribedetail(String subscribe_num);
	public ArrayList<SubscribeproductcntDTO> subscribedetailproduct(String subscribe_num);
	public ArrayList<CouponDTO> couponlist(String id);
	
}