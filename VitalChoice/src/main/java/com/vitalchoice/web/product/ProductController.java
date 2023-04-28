package com.vitalchoice.web.product;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductController {
	
	private static String CURR_THUMB_IMAGE_REPO_PATH = "C:\\github\\2023-Spring-Project-1\\VitalChoice\\src\\main\\webapp\\thumb_img";
	private static String CURR_DETAIL_IMAGE_REPO_PATH = "C:\\github\\2023-Spring-Project-1\\VitalChoice\\src\\main\\webapp\\detail_img";
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/productinput")
	public String product1() {
		return "productinputform";
	}
	@RequestMapping(value = "/productinputsave", method = RequestMethod.POST)
	public String product2(MultipartHttpServletRequest request) {
		Service_product serv = sqlSession.getMapper(Service_product.class);
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		String product_name = request.getParameter("product_name");
		int category_num = serv.getCategoryNum(category1, category2);
		String product_desc = request.getParameter("product_desc");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		int product_stock = Integer.parseInt(request.getParameter("product_stock"));
		String product_origin = request.getParameter("product_origin");
		String product_exp = request.getParameter("product_exp");
		HttpSession hs = request.getSession();
		int store_snum = (Integer) hs.getAttribute("store_snum");
		serv.insertProduct(category_num, product_name, product_price, product_stock, product_desc, product_origin, product_exp, store_snum);
		int product_num = serv.getProductNum();
		MultipartFile mf;
		//썸네일 이미지 저장
		for(int i=1; i<=3; i++) {
			String tmp = "tfile" + i;
			mf = request.getFile(tmp);
			try {
				if(mf!=null){
					String fname = mf.getOriginalFilename();
					if(fname!="") {
					serv.insertProductThumbImageFile(i, product_num, fname, product_num+"_"+i);
					mf.transferTo(new File(CURR_THUMB_IMAGE_REPO_PATH + "\\" + product_num + "_" +i));
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mf = null;
		}
		//상세페이지 저장
		for(int j=1; j<=10; j++) {
			String tmp = "dfile" + j;
			mf = request.getFile(tmp);
			try {
				if(mf!=null){
					String fname = mf.getOriginalFilename();
					if(fname!="") {
						serv.insertProductDetailImageFile(j, product_num, fname, product_num+"_"+j);
						mf.transferTo(new File(CURR_DETAIL_IMAGE_REPO_PATH + "\\" + product_num + "_" +j));
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mf = null;
		}
		return "redirect:productinput";
	}
}