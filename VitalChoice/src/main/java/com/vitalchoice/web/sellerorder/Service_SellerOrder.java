package com.vitalchoice.web.sellerorder;

import java.util.ArrayList;

public interface Service_SellerOrder {
	public int getBeforeDeliveryCnt(int store_snum);
	public int getMiddleDeliveryCnt(int store_snum);
	public int getAfterDeliveryCnt(int store_snum);
	public ArrayList<SellerOrderDTO> getNewOrderList(int store_snum);
	public ArrayList<SellerOrderDTO> getMiddleOrderList(int store_snum);
	public ArrayList<SellerOrderDTO> getAfterOrderList(int store_snum);
	public void changeStatusOne(int order_num, int product_num);
}