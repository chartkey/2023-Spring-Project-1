package com.vitalchoice.web.productout;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vitalchoice.web.product.CategoryDTO;
import com.vitalchoice.web.product.ImageDTO;
import com.vitalchoice.web.product.ProductDTO;
import com.vitalchoice.web.review.ReviewDTO;
import com.vitalchoice.web.user.UserDTO;

@Controller
public class ProductOutController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/productout")
	public String productdetail1(HttpServletRequest request, Model mo) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		Service_productout serv = sqlSession.getMapper(Service_productout.class);
		ProductDTO productdto = serv.productout(product_num);
		CategoryDTO categorydto = serv.categoryout(productdto.getCategory_num());
		ArrayList<ImageDTO> thumblist = serv.thumbout(product_num);
		ArrayList<ImageDTO> detaillist = serv.detailout(product_num);
		String store_sname = serv.storenameout(product_num);
		int review_cnt = serv.getReviewCnt(product_num);
		//별점별 review_cnt
		int[] rev_per_cnt = new int[6]; // 0을 제외한 1부터 5를 사용하기 위함
		for(int i=1; i<=5; i++) {
			rev_per_cnt[i] = serv.getReviewPerCnt(product_num, i);
		}
		//리뷰댓글 DTO
		ArrayList<ReviewDTO> reviewlist =  serv.getReviewDTO(product_num);
		for(int j=0; j<reviewlist.size(); j++) {
			String img1 = serv.getImg1(1, product_num, reviewlist.get(j).getUser_id());
			String img2 = serv.getImg2(2, product_num, reviewlist.get(j).getUser_id());
			if(img1!=null)
				reviewlist.get(j).setStored_img_file1(img1);
			if(img2!=null)
				reviewlist.get(j).setStored_img_file2(img2);
		
		}
		SellerDTO sellerdto = serv.getSellerDTO(product_num);
		//찜 되어있는지 안 되어있는지! 
		HttpSession hs = request.getSession();
		int like_yn =0;
		if((boolean)hs.getAttribute("login")==true) {
			UserDTO user_dto = (UserDTO) hs.getAttribute("user_dto");
			String user_id = user_dto.getUser_id();
			like_yn = serv.getLikeYN(product_num, user_id); // 결과가 1이면 이미 like를 누른것 0이면 like를 안 누른 것
		}
		int like_cnt = serv.getCntLike(product_num);//이 상품에 like 몇 개인지
		ArrayList<ReplyDTO> replylist = serv.getReplyList(product_num);
		int replycnt = serv.getTotal(product_num);
		mo.addAttribute("product_num", product_num);
		mo.addAttribute("productdto", productdto);
		mo.addAttribute("categorydto", categorydto);
		mo.addAttribute("thumblist", thumblist);
		mo.addAttribute("detaillist", detaillist);
		mo.addAttribute("store_sname", store_sname);
		mo.addAttribute("review_cnt", review_cnt);
		mo.addAttribute("rev_per_cnt", rev_per_cnt);
		mo.addAttribute("reviewlist", reviewlist);
		mo.addAttribute("replylist", replylist);
		mo.addAttribute("replycnt", replycnt);
		mo.addAttribute("sellerdto", sellerdto);
		mo.addAttribute("like_cnt", like_cnt);
		mo.addAttribute("like_yn", like_yn);
		return "productout";
	}
	
	@RequestMapping(value = "/qnasave")
	public String productdetail2(HttpServletRequest request, RedirectAttributes redirect) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String content = request.getParameter("content");
		HttpSession hs = request.getSession();
		UserDTO user_dto = (UserDTO) hs.getAttribute("user_dto");
		String user_id = user_dto.getUser_id();
		Service_productout serv = sqlSession.getMapper(Service_productout.class);
		serv.insertQna(product_num, user_id, content);
		redirect.addAttribute("product_num", product_num);
		return "redirect:productout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getanswer", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	public String productdetail3(@RequestParam("rnum") int rnum) {
		Service_productout serv = sqlSession.getMapper(Service_productout.class);

		String answer_content = serv.getAnswerContent(rnum);
	
		return answer_content;
	}
	
	@RequestMapping(value = "/btnLikeNo")
	public String productdetail4(HttpServletRequest request, RedirectAttributes ra) {
		Service_productout serv = sqlSession.getMapper(Service_productout.class);
		HttpSession hs = request.getSession();
		UserDTO user_dto = (UserDTO) hs.getAttribute("user_dto");
		String user_id = user_dto.getUser_id();
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		serv.insertLike(user_id, product_num);
		//product테이블도 변경
		serv.productLikeUp(product_num);
		ra.addAttribute("product_num", product_num);
		return "redirect:productout";
	}
	@RequestMapping(value = "/btnLikeYes")
	public String productdetail5(HttpServletRequest request, RedirectAttributes ra) {
		Service_productout serv = sqlSession.getMapper(Service_productout.class);
		HttpSession hs = request.getSession();
		UserDTO user_dto = (UserDTO) hs.getAttribute("user_dto");
		String user_id = user_dto.getUser_id();
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		serv.deleteLike(user_id, product_num);
		serv.productLikeDown(product_num);
		ra.addAttribute("product_num", product_num);
		return "redirect:productout";
	}
}
