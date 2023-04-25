package com.vitalchoice.web.sellersignup;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerSignupController {
	@Autowired
	SqlSession sqlSession;
	@RequestMapping(value = "/sellersignup")
	public String sellersignup1() {
		return "sellersignupform";
	}
	@RequestMapping(value = "/sellersignupsave")
	public String sellersignup2(HttpServletRequest request) {
		String seller_id = request.getParameter("seller_id");
		String seller_pw = request.getParameter("seller_pw");
		String seller_name = request.getParameter("seller_name");
		String seller_phone = request.getParameter("seller_phone1")
				+ "-" + request.getParameter("seller_phone2")
				+ "-" + request.getParameter("seller_phone3");
		String seller_email = request.getParameter("seller_email");
		String business_license = request.getParameter("business_license");
		String business_address = "(" + request.getParameter("postcode") + ")"
				+ request.getParameter("address")
				+ ", " + request.getParameter("detailAddress");
		String store_sname = request.getParameter("store_sname");
		Service_SellerSignup serv = sqlSession.getMapper(Service_SellerSignup.class);
		serv.insertSellerSignup(seller_id, seller_pw, seller_name, seller_phone, seller_email, business_license, business_address);
		serv.insertStore(seller_id, store_sname);
		return "redirect:goseller";
	}
	@RequestMapping(value = "/backToHome")
	public String sellersignup3() {
		return "redirect:goseller";
	}
}