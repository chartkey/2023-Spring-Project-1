package com.vitalchoice.web.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.user.UserDTO;

@Controller
public class CartController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value="/incart")
	public String ko0(HttpServletRequest request,Model mo) {
		Service_cart serv = sqlsession.getMapper(Service_cart.class);
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		ArrayList<CartDTO> list = serv.out(id);
		mo.addAttribute("list", list);
		return "cartinput";
	}
	@RequestMapping(value="/gocart")
	public String ko1(HttpServletRequest request,Model mo) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));	
		String user_id = request.getParameter("user_id");
		int product_count = Integer.parseInt(request.getParameter("product_count"));
		Service_cart serv = sqlsession.getMapper(Service_cart.class); 
		String check = serv.cartcheck(product_num, user_id);
		if(check.equals("0")) {
			serv.insert(product_num,user_id,product_count);
		}
		else {
			serv.insertmodify(product_num, user_id, product_count);
		}
		ArrayList<CartDTO> list = serv.out(user_id);
		mo.addAttribute("list", list);
		return "cartinput";
	}
	@RequestMapping(value="/cartcntmodify")
	public String ko2(HttpServletRequest request) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int product_count = Integer.parseInt(request.getParameter("product_count"));
		String user_id = request.getParameter("user_id");
		System.out.println(product_num+"--------"+product_count+"--------"+user_id);
		Service_cart serv = sqlsession.getMapper(Service_cart.class);
		serv.cartcntmodify(product_num,product_count,user_id);
		return "redirect:incart";
	}
	@RequestMapping(value="/cartdelete")
	public String ko3(HttpServletRequest request) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String user_id = request.getParameter("user_id");
		Service_cart serv = sqlsession.getMapper(Service_cart.class);
		serv.cartdelete(product_num,user_id);
		return "redirect:incart";
	}
}