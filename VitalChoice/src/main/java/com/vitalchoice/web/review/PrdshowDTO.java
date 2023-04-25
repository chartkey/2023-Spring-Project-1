package com.vitalchoice.web.review;

public class PrdshowDTO {
	String stored_file_name, product_name, store_sname;

	public PrdshowDTO(String stored_file_name, String product_name, String store_sname) {
		super();
		this.stored_file_name = stored_file_name;
		this.product_name = product_name;
		this.store_sname = store_sname;
	}
	public PrdshowDTO() {
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