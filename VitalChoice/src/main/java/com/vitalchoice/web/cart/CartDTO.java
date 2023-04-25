package com.vitalchoice.web.cart;

public class CartDTO {
	int cart_num,product_num,product_count,product_check,product_price;
	String user_id,stored_file_name,product_name,store_sname;
	public CartDTO() {
		super();
	}
	public CartDTO(int cart_num, int product_num, int product_count, int product_check, int product_price,
			String user_id, String stored_file_name, String product_name, String store_sname) {
		super();
		this.cart_num = cart_num;
		this.product_num = product_num;
		this.product_count = product_count;
		this.product_check = product_check;
		this.product_price = product_price;
		this.user_id = user_id;
		this.stored_file_name = stored_file_name;
		this.product_name = product_name;
		this.store_sname = store_sname;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getProduct_check() {
		return product_check;
	}
	public void setProduct_check(int product_check) {
		this.product_check = product_check;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getStore_sname() {
		return store_sname;
	}
	public void setStore_sname(String store_sname) {
		this.store_sname = store_sname;
	}
}