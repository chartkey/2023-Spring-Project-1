package com.vitalchoice.web.user;

public interface Service_user {
	// 회원가입 입력폼
	public void user(String user_id, String user_pwd, String user_name, String user_phone, String user_address1,
			String user_address2, String user_address3, String user_email, String user_birthday,
			String user_gender, String user_nickname, String email_check);
	// 아이디 체크
	public int idcheck(String user_id);
	// 이메일 아이디 체크
	public int emailcheck(String user_email);
	// 로그인
	public UserDTO logincheck(String user_id, String user_pwd);
	// 아이디찾기
	public UserDTO idfind(String user_name, String user_phone);
	// 비밀번호 찾기
	public UserDTO pwfind(String user_id, String user_email);
	// 회원정보 수정
	public UserDTO modify(String user_id);
	// 회원정보 수정폼
	public void modifysave(String user_id, String user_pwd, String user_name, String user_phone, String user_address1,
			String user_address2, String user_address3, String user_email, String user_birthday,
			String user_gender, String user_nickname, String email_check);
}