package com.vitalchoice.web.productout;

public class ReplyDTO {
	int reply_number, product_num;
	String product_name, user_id, content, reporting_date;
	int reply_origin_number, reply_depth, reply_yn;
	public ReplyDTO(int reply_number, int product_num, String product_name, String user_id, String content, String reporting_date,
			int reply_origin_number, int reply_depth, int reply_yn) {
		super();
		this.reply_number = reply_number;
		this.product_num = product_num;
		this.product_name = product_name;
		this.user_id = user_id;
		this.content = content;
		this.reporting_date = reporting_date;
		this.reply_origin_number = reply_origin_number;
		this.reply_depth = reply_depth;
		this.reply_yn = reply_yn;
	}
	public ReplyDTO() {
	}
	public int getReply_number() {
		return reply_number;
	}
	public void setReply_number(int reply_number) {
		this.reply_number = reply_number;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
	}
	public int getReply_origin_number() {
		return reply_origin_number;
	}
	public void setReply_origin_number(int reply_origin_number) {
		this.reply_origin_number = reply_origin_number;
	}
	public int getReply_depth() {
		return reply_depth;
	}
	public void setReply_depth(int reply_depth) {
		this.reply_depth = reply_depth;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getReply_yn() {
		return reply_yn;
	}
	public void setReply_yn(int reply_yn) {
		this.reply_yn = reply_yn;
	}
}