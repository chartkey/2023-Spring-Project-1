package com.vitalchoice.web.product;

public class ImageDTO {
	int file_number, product_num;
	String origin_file_name, stored_file_name;
	public ImageDTO(int file_number, int product_num, String origin_file_name, String stored_file_name) {
		super();
		this.file_number = file_number;
		this.product_num = product_num;
		this.origin_file_name = origin_file_name;
		this.stored_file_name = stored_file_name;
	}
	public ImageDTO() {
	}
	public int getFile_number() {
		return file_number;
	}
	public void setFile_number(int file_number) {
		this.file_number = file_number;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getOrigin_file_name() {
		return origin_file_name;
	}
	public void setOrigin_file_name(String origin_file_name) {
		this.origin_file_name = origin_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
}