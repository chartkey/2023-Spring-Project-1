package com.vitalchoice.web.productout;

import java.util.ArrayList;

import com.vitalchoice.web.product.CategoryDTO;
import com.vitalchoice.web.product.ImageDTO;
import com.vitalchoice.web.product.ProductDTO;
import com.vitalchoice.web.review.ReviewDTO;

public interface Service_productout {

	public ProductDTO productout(int product_num);
	public CategoryDTO categoryout(int category_num);
	public ArrayList<ImageDTO> thumbout(int product_num);
	public ArrayList<ImageDTO> detailout(int product_num);
	public String storenameout(int product_num);
	public void hitsUp(int product_num);
	public int getReviewCnt(int product_num);
	public int getReviewPerCnt(int product_num, int i);
	public ArrayList<ReviewDTO> getReviewDTO(int product_num);
	public String getImg1(int i, int product_num, String user_id);
	public String getImg2(int i, int product_num, String user_id);
	public void insertQna(int product_num, String user_id, String content);
	public ArrayList<ReplyDTO> getReplyList(int product_num);
	public int getTotal(int product_num);
	public SellerDTO getSellerDTO(int product_num);
	public String getAnswerContent(int rnum);
	public int getCntLike(int product_num);
	public int getLikeYN(int product_num, String user_id);
	public void insertLike(String user_id, int product_num);
	public void deleteLike(String user_id, int product_num);
	public void productLikeUp(int product_num);
	public void productLikeDown(int product_num);
}