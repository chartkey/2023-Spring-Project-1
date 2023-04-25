package com.vitalchoice.web.user;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	@Autowired
	SqlSession sqlsession;
	// 회원가입 폼으로
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
	}
	// 회원가입
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String join1(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		String user_address1 = request.getParameter("user_address1");
		String user_address2 = request.getParameter("user_address2");
		String user_address3 = request.getParameter("user_address3");
		String user_email = request.getParameter("user_email");
		String user_birthday = request.getParameter("user_birthday");
		String user_gender = request.getParameter("user_gender");
		String user_nickname = request.getParameter("user_nickname");
		String email_check = request.getParameter("email_check");

		Service_user us = sqlsession.getMapper(Service_user.class);
		us.user(user_id, user_pwd, user_name, user_phone, user_address1, user_address2, user_address3,
				user_email, user_birthday, user_gender, user_nickname, email_check);
		return "main";
	}
	// id 중복체크
	@ResponseBody
	@RequestMapping(value = "/joinsend")
	public String join2(String user_id) {
		Service_user us = sqlsession.getMapper(Service_user.class);
		int cnt = us.idcheck(user_id);
		String bigo = null;
		if (cnt == 0) {
			bigo = "ok";
		} else {
			bigo = "no";
		}
		return bigo;
	}
	// 이메일 id중복체크
	@ResponseBody
	@RequestMapping(value = "/joinsend1")
	public String join3(String user_email) {
		Service_user us = sqlsession.getMapper(Service_user.class);
		int cnt1 = us.emailcheck(user_email);
		String bigo1 = null;
		if (cnt1 == 0) {
			bigo1 = "ok";
		} else {
			bigo1 = "no";
		}
		return bigo1;
	}
	//이메일 인증번호 전송
	@ResponseBody
	@RequestMapping(value = "/sendemail", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest request) throws AddressException, MessagingException {
		String user_email = request.getParameter("user_email");
		String host = "smtp.naver.com";
		String username = "hanthsong@naver.com";
		String password = "";
		String num = "";
		try {

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			Session session = Session.getInstance(props, new Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username, password);
				}

			});

			//인증번호 난수생성
			Random random = new Random();
			int checknum = random.nextInt(888888) + 111111;
			
			//이메일 보내기
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));	
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user_email));
			message.setSubject("[vitalchoice] 본인확인을 위한 이메일 인증번호 입니다.");
			message.setText("인증번호를 정확히 입력해주세요   인증 번호는 " + checknum + "입니다.");
			Transport.send(message);
			num = Integer.toString(checknum);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}
	//로그인 폼으로
	@RequestMapping(value="/login") 
	public String login() {
		return "login";
	}
	//로그인 화면
	@RequestMapping(value="/logincheck")
	public String login2(HttpServletRequest request, RedirectAttributes ra) {
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		Service_user us = sqlsession.getMapper(Service_user.class);
		UserDTO dto = us.logincheck(user_id,user_pwd);
		HttpSession hs = request.getSession();
		if(dto != null) {
			hs.setAttribute("user_dto", dto);
			hs.setAttribute("login", true);
		}
		else {
			hs.setAttribute("login", false);
			ra.addAttribute("result", "loginfail");
			return "redirect:login";
		}
		return "main";
	}
	//로그아웃
	@RequestMapping(value="/logout")
	public String login3(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("user_dto");
		hs.removeAttribute("login");
		hs.setAttribute("login", false);
		return "main";
	}
	//아이디찾기 폼으로
	@RequestMapping(value = "/findid")
	public String findid() {
		return "findid";
	}
   //아이디 찾기
	@RequestMapping(value="/idfind")
	public String findid2(HttpServletRequest request,RedirectAttributes ra) {
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		Service_user us = sqlsession.getMapper(Service_user.class);
		UserDTO dto = us.idfind(user_name,user_phone);
		HttpSession hs = request.getSession();	
		if(dto != null) {
			hs.setAttribute("user_dto", dto);
			hs.setAttribute("idfind", true);
		}
		else {
			hs.setAttribute("idfind", false);
			ra.addAttribute("result3", "idfindfail");
			return "redirect:findid";
		}
		return "findidout";
	}
	//아이디 출력폼
	@RequestMapping(value = "/findidout")
	public String findid3(UserDTO dto) {
		
		return "dto/findidout";
	}
	//비밀번호 찾기폼으로
	@RequestMapping(value = "/findpwd")
	public String findpwd() {
		return "findpwd";
	}
	//비밀번호 찾기 
	@RequestMapping(value="/pwdfind")
	public String findpw2(HttpServletRequest request,RedirectAttributes ra) {
		String user_id = request.getParameter("user_id");
		String user_email = request.getParameter("user_email");
		Service_user us = sqlsession.getMapper(Service_user.class);
		UserDTO dto = us.pwfind(user_id,user_email);
		HttpSession hs = request.getSession();
		if(dto != null) {
			hs.setAttribute("user_dto", dto);
			hs.setAttribute("pwfind", true);
		}
		else {
			hs.setAttribute("pwfind", false);
			ra.addAttribute("result5", "pwfindfail");
			return "redirect:findpwd";
		}
		return "pwdout";
	}
	//비밀번호 결과 출력
	@RequestMapping(value = "/pwdout2")
	public String findpw3(UserDTO dto) {
		
		return "pwdout2";
	}
	// 비밀번호 이메일 인증번호 전송
	@ResponseBody
	@RequestMapping(value = "/sendemail2", method = RequestMethod.POST)
	public String sendMail2(HttpServletRequest request) throws AddressException, MessagingException {
		String user_email = request.getParameter("user_email");
		String host = "smtp.naver.com";
		String username = "hanthsong@naver.com";
		String password = "";
		String num = "";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			Session session = Session.getInstance(props, new Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username, password);
				}
			});
			Random random = new Random();
			int checknum = random.nextInt(888888) + 111111;
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user_email));
			message.setSubject("[vitalchoice] 본인확인을 위한 이메일 인증번호 입니다.");
			message.setText("인증번호를 정확히 입력해주세요   인증 번호는 " + checknum + "입니다.");
			Transport.send(message);
			num = Integer.toString(checknum);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}
	@RequestMapping(value = "/mypage") // 회원정보 수정
	public String update( ) {
	    return "mypage";
	}
	@RequestMapping(value="/joinmodify2")
	public String update2(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		Service_user us = sqlsession.getMapper(Service_user.class); 
		UserDTO dto1 =us.modify(id);
		mo.addAttribute("dto1", dto1);
		return "joinmodifyform";
	}
	@RequestMapping(value="/joinmodifysave")
	public String update3(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		String user_address1 = request.getParameter("user_address1");
		String user_address2 = request.getParameter("user_address2");
		String user_address3 = request.getParameter("user_address3");
		String user_email = request.getParameter("user_email");
		String user_birthday = request.getParameter("user_birthday");
		String user_gender = request.getParameter("user_gender");
		String user_nickname = request.getParameter("user_nickname");
		String email_check = request.getParameter("email_check");
		Service_user us = sqlsession.getMapper(Service_user.class);
		us.modifysave(user_id, user_pwd, user_name, user_phone, user_address1, user_address2, user_address3,
				user_email, user_birthday, user_gender, user_nickname, email_check);
		return "main";
	}
}
