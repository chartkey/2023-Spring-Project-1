package com.vitalchoice.web.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.payment.CouponDTO;
import com.vitalchoice.web.payment.DeliveryDTO;
import com.vitalchoice.web.payment.DeliveryproductDTO;
import com.vitalchoice.web.subscribe.SubscribeDTO;
import com.vitalchoice.web.user.UserDTO;

@Controller
public class MypageController {
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value="/mypageorder")
	public String ko10(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		Service_mypage serv = sqlsession.getMapper(Service_mypage.class);
		ArrayList<DeliveryDTO> deliverylist = serv.orderout(id);
		for(int i=0;i<deliverylist.size();i++) {
			int order_num = deliverylist.get(i).getOrder_num();
			DeliveryproductcntDTO cnt = serv.deliveryproductcnt(order_num);
			deliverylist.get(i).setProduct_name(cnt.getProduct_name());
			deliverylist.get(i).setTotal_cnt(cnt.getTotal_cnt()-1);
		}
		mo.addAttribute("deliverylist", deliverylist);
		return "mypageorder";
	}
	@RequestMapping(value="/orderdetail")
	public String ko12(HttpServletRequest request,Model mo) {
		String order_num = request.getParameter("order_num");
		Service_mypage serv = sqlsession.getMapper(Service_mypage.class);
		DeliveryDTO dto =serv.orderdetail(order_num);
		ArrayList<DeliveryproductDTO> list = serv.orderdetailproduct(order_num);
		mo.addAttribute("orderdetaildto", dto);
		mo.addAttribute("orderdetailproduct", list);
		return "mypageorderdetail";
	}
	@RequestMapping(value="/mypagesubscribe")
	public String ko11(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		Service_mypage serv = sqlsession.getMapper(Service_mypage.class);
		ArrayList<SubscribeDTO> subscribelist = serv.subscribeout(id);
		for(int i=0;i<subscribelist.size();i++) {
			int subscribe_num = subscribelist.get(i).getSubscribe_num();
			SubscribeproductcntDTO cnt = serv.subscribeproductcnt(subscribe_num);
			subscribelist.get(i).setProduct_name(cnt.getProduct_name());
			subscribelist.get(i).setTotal_cnt(cnt.getTotal_cnt()-1);
		}
		mo.addAttribute("subscribelist", subscribelist);
		return "mypagesubscribe";
	}
	@RequestMapping(value="/subscribedetail")
	public String ko13(HttpServletRequest request,Model mo) {
		String subscribe_num = request.getParameter("subscribe_num");
		Service_mypage serv = sqlsession.getMapper(Service_mypage.class);
		SubscribeDTO dto =serv.subscribedetail(subscribe_num);
		ArrayList<SubscribeproductcntDTO> list = serv.subscribedetailproduct(subscribe_num);
		mo.addAttribute("subscribedetaildto", dto);
		mo.addAttribute("subscribedetailproduct", list);
		return "mypagesubscribedetail";
	}
	@RequestMapping(value="/mypagegrade")
	public String ko14(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		Service_mypage serv = sqlsession.getMapper(Service_mypage.class);
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		ArrayList<CouponDTO> list = serv.couponlist(id);
		mo.addAttribute("couponlist", list);
		return "mypagegrade";
	}
}