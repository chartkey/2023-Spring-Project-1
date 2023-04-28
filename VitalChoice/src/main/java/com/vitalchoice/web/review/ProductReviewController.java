package com.vitalchoice.web.review;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductReviewController {
	
	private static String CURR_REVIEW_IMAGE_REPO_PATH = "C:\\github\\2023-Spring-Project-1\\VitalChoice\\src\\main\\webapp\\review_img";
	@Autowired
	   SqlSession sqlSession;
	   
	   @RequestMapping(value = "/productreview")
	   public String review1() {
	      
	      return "reviewinputform";
	   }
	   @ResponseBody
	   @RequestMapping(value = "/reviewdb", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	   public String review2(@RequestParam("prd_num") int prd_num) {
	      //리뷰화면에 노출할 (상품사진, 회사명, 상품명)
	      Service_review serv = sqlSession.getMapper(Service_review.class);
	      PrdshowDTO prddto =  serv.prdout(prd_num);
	      
	      JSONObject obj = new JSONObject();
	      obj.put("product_name", prddto.getProduct_name());
	      obj.put("store_sname", prddto.getStore_sname());
	      obj.put("stored_file_name", prddto.getStored_file_name());
	      String res = obj.toJSONString();
	      
	      return res;
	   }
	   @RequestMapping(value = "/reviewsave", method = RequestMethod.POST)
	   public String review3(MultipartHttpServletRequest request){
	      //loginsession이랑 같이 연결~
	      HttpSession hs = request.getSession();
	      Service_review serv = sqlSession.getMapper(Service_review.class);
	      
	      //product_num, user_id(세션), content, reporting_date(sysdate), review_grade
	      int product_num = Integer.parseInt(request.getParameter("product_num"));
	      //세션이 없기때문에 임의로 korea라고 아이디를 넣어줌.. .나중에 수정해야할 부분
	      String user_id = "america";
	      //String user_id = (String) hs.getAttribute("user_id");
	      String content = request.getParameter("content");
	      int review_grade = Integer.parseInt(request.getParameter("review_grade"));
	      serv.insertReview(product_num, user_id, content, review_grade);
	      //사진 file_number, product_num, reivew_number, origin_file_name, stored_file_name
	      
	      MultipartFile mf;
	      //리뷰 이미지
	      for(int i=1; i<=2; i++) {
	         String tmp = "image" + i;
	         mf = request.getFile(tmp);
	         try {
	            if(mf!=null){
	               String fname = mf.getOriginalFilename();
	               if(fname!="") {
	               serv.insertReviewImageFile(i, product_num, user_id, fname, product_num+"_"+user_id+"_"+i);
	               mf.transferTo(new File(CURR_REVIEW_IMAGE_REPO_PATH + "\\" + product_num+"_"+user_id+"_"+i));
	               }
	            }
	         } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         mf = null;
	      }
	      
	      //상품 평점 변경
	      double grade = serv.getGrade(product_num);
	      serv.updateGrade(grade, product_num);
	      return "redirect:mypageorder";
	   }   
}