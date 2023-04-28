package com.vitalchoice.web.coupon;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CouponController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value="/couponsave",method = RequestMethod.POST)
	public String ko2(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		int discount_rate = Integer.parseInt(request.getParameter("result"));
		String issue_date = request.getParameter("date");
		Service_coupon serv = sqlsession.getMapper(Service_coupon.class);
		serv.insert(user_id,discount_rate,issue_date);
		return "main";
	}
	@RequestMapping(value="/couponcheck")
	public String ko3() {
		return "couponcheck";
	}
	@RequestMapping(value="/couponcheck2",method = RequestMethod.POST)
	public String ko4(HttpServletRequest request,RedirectAttributes ra) {
		String user_id = request.getParameter("user_id");
		String issue_date = request.getParameter("date");
		Service_coupon serv = sqlsession.getMapper(Service_coupon.class);
		String check = serv.couponcheck(user_id,issue_date);
		if(check.equals("0")) {
			return "coupon";
		}
		else {
			ra.addAttribute("result", "couponissued");
			return "redirect:couponcheck";
		}
	}
}