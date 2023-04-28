package com.vitalchoice.web.drone;

import java.util.ArrayList;

import com.vitalchoice.web.payment.DeliveryproductDTO;

public interface Service_drone {
	public void deliverystatus(String order_num, String product_num);
	public ArrayList<DeliveryproductDTO> deliverydrone(String id);
}