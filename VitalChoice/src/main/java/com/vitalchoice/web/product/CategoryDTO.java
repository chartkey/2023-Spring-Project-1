package com.vitalchoice.web.product;

public class CategoryDTO {
	int category_num;
	String category_main, category_detail;
	public CategoryDTO(int category_num, String category_main, String category_detail) {
		super();
		this.category_num = category_num;
		this.category_main = category_main;
		this.category_detail = category_detail;
	}
	public CategoryDTO() {
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getCategory_main() {
		return category_main;
	}
	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}
	public String getCategory_detail() {
		return category_detail;
	}
	public void setCategory_detail(String category_detail) {
		this.category_detail = category_detail;
	}
}