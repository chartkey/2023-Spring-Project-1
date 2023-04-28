package com.vitalchoice.web.sellerask;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.productout.ReplyDTO;
import com.vitalchoice.web.productout.Service_productout;
import com.vitalchoice.web.sellerlogin.StoreDTO;

@Controller
public class SellerAskController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/qna_answer")
	public String ask1(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		int store_snum = ((Integer) hs.getAttribute("store_snum"));
		Service_sellerask serv = sqlSession.getMapper(Service_sellerask.class);
		ArrayList<ReplyDTO> replylist = serv.getReplyDTO(store_snum);
		int cnt_replylist = replylist.size();
		mo.addAttribute("replylist", replylist);
		mo.addAttribute("cnt_replylist", cnt_replylist);
		return "qnaanswermain";
	}
	@RequestMapping(value = "/qnaanswersave")
	public String ask2(HttpServletRequest request) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String content = request.getParameter("content");
		int reply_origin_number = Integer.parseInt(request.getParameter("reply_origin_number"));
		HttpSession hs = request.getSession();
		Service_sellerask serv = sqlSession.getMapper(Service_sellerask.class);
		serv.insertQna(product_num, content, reply_origin_number);
		serv.updateReply_yn(reply_origin_number);
		return "redirect:qna_answer";
	}
}