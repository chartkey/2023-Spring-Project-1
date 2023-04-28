package com.vitalchoice.web.product;

public interface Service_product {
	public int getCategoryNum(String category1, String category2);
	public int getProductNum();
	public void insertProductThumbImageFile(int i, int product_num, String fname, String string);
	public void insertProduct(int category_num, String product_name, int product_price, int product_stock, String product_desc,
			String product_origin, String product_exp, int store_snum);
	public void insertProductDetailImageFile(int i, int product_num, String fname, String string);
}