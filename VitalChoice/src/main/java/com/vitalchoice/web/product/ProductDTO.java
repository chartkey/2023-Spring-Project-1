package com.vitalchoice.web.product;

public class ProductDTO {
	int product_num, category_num;
	String product_name;
	int product_price, product_stock;
	String product_desc;
	int product_hits, product_like;
	String product_date;
	double product_grade;
	int product_sale, product_sellcount;
	String product_origin, product_exp;
	int file_number;
	String stored_file_name, store_sname;

	public ProductDTO(int product_num, int category_num, String product_name, int product_price, int product_stock,
			String product_desc, int product_hits, int product_like, String product_date, double product_grade,
			int product_sale, int product_sellcount, String product_origin, String product_exp, int file_number,
			String stored_file_name, String store_sname) {
		super();
		this.product_num = product_num;
		this.category_num = category_num;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_desc = product_desc;
		this.product_hits = product_hits;
		this.product_like = product_like;
		this.product_date = product_date;
		this.product_grade = product_grade;
		this.product_sale = product_sale;
		this.product_sellcount = product_sellcount;
		this.product_origin = product_origin;
		this.product_exp = product_exp;
		this.file_number = file_number;
		this.stored_file_name = stored_file_name;
		this.store_sname = store_sname;
	}
	public ProductDTO() {
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public int getProduct_hits() {
		return product_hits;
	}
	public void setProduct_hits(int product_hits) {
		this.product_hits = product_hits;
	}
	public int getProduct_like() {
		return product_like;
	}
	public void setProduct_like(int product_like) {
		this.product_like = product_like;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public double getProduct_grade() {
		return product_grade;
	}
	public void setProduct_grade(double product_grade) {
		this.product_grade = product_grade;
	}
	public int getProduct_sale() {
		return product_sale;
	}
	public void setProduct_sale(int product_sale) {
		this.product_sale = product_sale;
	}
	public int getProduct_sellcount() {
		return product_sellcount;
	}
	public void setProduct_sellcount(int product_sellcount) {
		this.product_sellcount = product_sellcount;
	}
	public String getProduct_origin() {
		return product_origin;
	}
	public void setProduct_origin(String product_origin) {
		this.product_origin = product_origin;
	}
	public String getProduct_exp() {
		return product_exp;
	}
	public void setProduct_exp(String product_exp) {
		this.product_exp = product_exp;
	}
	public int getFile_number() {
		return file_number;
	}
	public void setFile_number(int file_number) {
		this.file_number = file_number;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public String getStore_sname() {
		return store_sname;
	}
	public void setStore_sname(String store_sname) {
		this.store_sname = store_sname;
	}
}