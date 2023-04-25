package com.vitalchoice.web.sellerlogin;

public class StoreDTO {
	int store_snum;
	String seller_id, store_sname;
	int store_product_count, store_sellcount, store_sales;
	public StoreDTO(int store_snum, String seller_id, String store_sname, int store_product_count, int store_sellcount,
			int store_sales) {
		super();
		this.store_snum = store_snum;
		this.seller_id = seller_id;
		this.store_sname = store_sname;
		this.store_product_count = store_product_count;
		this.store_sellcount = store_sellcount;
		this.store_sales = store_sales;
	}
	public StoreDTO() {
	}
	public int getStore_snum() {
		return store_snum;
	}
	public void setStore_snum(int store_snum) {
		this.store_snum = store_snum;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getStore_sname() {
		return store_sname;
	}
	public void setStore_sname(String store_sname) {
		this.store_sname = store_sname;
	}
	public int getStore_product_count() {
		return store_product_count;
	}
	public void setStore_product_count(int store_product_count) {
		this.store_product_count = store_product_count;
	}
	public int getStore_sellcount() {
		return store_sellcount;
	}
	public void setStore_sellcount(int store_sellcount) {
		this.store_sellcount = store_sellcount;
	}
	public int getStore_sales() {
		return store_sales;
	}
	public void setStore_sales(int store_sales) {
		this.store_sales = store_sales;
	}
}