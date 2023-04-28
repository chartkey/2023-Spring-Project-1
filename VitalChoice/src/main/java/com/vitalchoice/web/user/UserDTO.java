package com.vitalchoice.web.user;

public class UserDTO {
	String user_id,user_pwd,user_name,user_phone,user_address1,user_address2,user_address3,user_email,user_birthday,user_gender,user_nickname;
	int email_check,user_role,user_grade,user_totpurchase,user_point;
	String user_insertdate;
	public UserDTO() {
	}
	public UserDTO(String user_id, String user_pwd, String user_name, String user_phone, String user_address1,
			String user_address2, String user_address3, String user_email, String user_birthday, String user_gender,
			String user_nickname, int email_check, int user_role, int user_grade, int user_totpurchase, int user_point,
			String user_insertdate) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address1 = user_address1;
		this.user_address2 = user_address2;
		this.user_address3 = user_address3;
		this.user_email = user_email;
		this.user_birthday = user_birthday;
		this.user_gender = user_gender;
		this.user_nickname = user_nickname;
		this.email_check = email_check;
		this.user_role = user_role;
		this.user_grade = user_grade;
		this.user_totpurchase = user_totpurchase;
		this.user_point = user_point;
		this.user_insertdate = user_insertdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_address3() {
		return user_address3;
	}
	public void setUser_address3(String user_address3) {
		this.user_address3 = user_address3;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getEmail_check() {
		return email_check;
	}
	public void setEmail_check(int email_check) {
		this.email_check = email_check;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	public int getUser_totpurchase() {
		return user_totpurchase;
	}
	public void setUser_totpurchase(int user_totpurchase) {
		this.user_totpurchase = user_totpurchase;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_insertdate() {
		return user_insertdate;
	}
	public void setUser_insertdate(String user_insertdate) {
		this.user_insertdate = user_insertdate;
	}
}