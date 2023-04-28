package com.vitalchoice.web.drone;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.payment.DeliveryproductDTO;
import com.vitalchoice.web.user.UserDTO;

@Controller
public class DroneController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value="/dronemap2")
	public String ko2(HttpServletRequest request,Model mo) {
		String delivery_address2 = request.getParameter("delivery_address2");
		String order_num = request.getParameter("order_num");
		String product_num = request.getParameter("product_num");
		Service_drone serv = sqlsession.getMapper(Service_drone.class);
		serv.deliverystatus(order_num,product_num);
		mo.addAttribute("delivery_address2", delivery_address2);
		return "dronemap2";
	}
	@RequestMapping(value="/deliverydrone")
	public String ko4(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		Service_drone serv = sqlsession.getMapper(Service_drone.class);
		ArrayList<DeliveryproductDTO> list = serv.deliverydrone(id);
		mo.addAttribute("deliverydrone", list);
		return "deliverydrone";
	}
}