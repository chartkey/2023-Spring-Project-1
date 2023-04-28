package com.vitalchoice.web.cart;

import java.util.ArrayList;

public interface Service_cart {
	public String cartcheck(int product_num,String user_id);
	public void insert(int product_num,String user_id,int product_count);
	public void insertmodify(int product_num,String user_id,int product_count);
	public ArrayList<CartDTO> out(String user_id);
	public void cartcntmodify(int product_num,int product_count,String user_id);
	public void cartdelete(int product_num,String user_id);
}