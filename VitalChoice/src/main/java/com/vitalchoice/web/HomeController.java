package com.vitalchoice.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.product.ProductDTO;
import com.vitalchoice.web.survey.Service_survey;
import com.vitalchoice.web.survey.SurveydetailDTO;
import com.vitalchoice.web.user.UserDTO;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/")
	public String main(HttpServletRequest request ,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		Service_survey serv = sqlsession.getMapper(Service_survey.class);
		if(dto != null) {
		    String id = dto.getUser_id();
			ArrayList<SurveydetailDTO> list = serv.surveyresult(id);
			if(list.size() != 0) {
				String num = list.get(0).getCategory_num();
			    String num_detail = list.get(0).getCategory_detail();
			    ArrayList<ProductDTO> productlist = serv.surveyresult2(num);
			    mo.addAttribute("num_detail", num_detail);
			    mo.addAttribute("list", productlist);
			}
			else {
				ArrayList<ProductDTO> productlist = serv.surveyresult3();
				mo.addAttribute("list", productlist);
			}
		}
		else {
			ArrayList<ProductDTO> productlist = serv.surveyresult3();
			mo.addAttribute("list", productlist);
		}
		return "main";
	}
	@RequestMapping(value = "/goseller")
	public String sellerhome(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("seller_loginstate", false);
		return "seller_main";
	}
}