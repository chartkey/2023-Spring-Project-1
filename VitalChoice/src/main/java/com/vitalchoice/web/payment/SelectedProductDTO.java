package com.vitalchoice.web.payment;

public class SelectedProductDTO {
	int productNum;
    int productCount;
    String userId;
    String productName;
    int productPrice;
    int cartnum;
	public SelectedProductDTO() {
	}
	public SelectedProductDTO(int productNum, int productCount, String userId, String productName, int productPrice) {
		super();
		this.productNum = productNum;
		this.productCount = productCount;
		this.userId = userId;
		this.productName = productName;
		this.productPrice = productPrice;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
}