package com.vitalchoice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/goseller")
	   public String sellerhome(HttpServletRequest request) {
	      HttpSession hs = request.getSession();
	      hs.setAttribute("seller_loginstate", false);
	      return "seller_main";
	}
}