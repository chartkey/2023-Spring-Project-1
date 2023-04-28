package com.vitalchoice.web.list;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vitalchoice.web.product.ProductDTO;

@Controller
public class ProductListContoller {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/viewListAll")
	public String list1(Model mo, HttpServletRequest request) {
		String catenum = request.getParameter("catenum");
		Service_ProductList serv = sqlsession.getMapper(Service_ProductList.class);
		if(catenum.equals("0")) {
			mo.addAttribute("list_title", "전체상품목록");
			String nowPage = request.getParameter("nowPage");
			String cntPerPage = request.getParameter("cntPerPage");
			String orderby = request.getParameter("orderby");
			int totalcnt = serv.getCntList();
			if(nowPage==null && cntPerPage==null) {
				nowPage = "1";
				cntPerPage = "8";
			}else if(nowPage==null) {
				nowPage = "1";
			}else if(cntPerPage==null)
				cntPerPage = "8";
			PageDTO pagedto = new PageDTO(Integer.parseInt(nowPage), totalcnt, Integer.parseInt(cntPerPage));
			ArrayList<ProductDTO> latest_list = serv.getLatest(pagedto);
			if(orderby.equals("1")) {
				latest_list=serv.getLatest(pagedto);
			}else if(orderby.equals("2")) {
				latest_list=serv.getSellCount(pagedto);
			}else if(orderby.equals("3")) {
				latest_list=serv.getLow(pagedto);
			}else if(orderby.equals("4")) {
				latest_list=serv.getHigh(pagedto);
			}else {
				latest_list=serv.getLike(pagedto);
			}
			mo.addAttribute("orderby", orderby);
			mo.addAttribute("latest_list", latest_list);		
			mo.addAttribute("totalcnt", totalcnt);	
			mo.addAttribute("pagedto", pagedto);
			mo.addAttribute("catenum", catenum);
		}else if(catenum.equals("99")) {
			String keyword_searching = request.getParameter("keyword_searching");
			mo.addAttribute("list_title", "\'"+keyword_searching+"\'의 검색결과");
			String nowPage = request.getParameter("nowPage");
			String cntPerPage = request.getParameter("cntPerPage");
			String orderby = request.getParameter("orderby");
			int totalcnt = serv.getCntListSearch(keyword_searching);
			if(nowPage==null && cntPerPage==null) {
				nowPage = "1";
				cntPerPage = "8";
			}else if(nowPage==null) {
				nowPage = "1";
			}else if(cntPerPage==null)
				cntPerPage = "8";
			PageDTO pagedto = new PageDTO(Integer.parseInt(nowPage), totalcnt, Integer.parseInt(cntPerPage));
			ArrayList<ProductDTO> latest_list = serv.getLatestSearch(pagedto, keyword_searching);
			if(orderby.equals("1")) {
				latest_list=serv.getLatestSearch(pagedto, keyword_searching);
			}else if(orderby.equals("2")) {
				latest_list=serv.getSellCountSearch(pagedto, keyword_searching);
			}else if(orderby.equals("3")) {
				latest_list=serv.getLowSearch(pagedto, keyword_searching);
			}else if(orderby.equals("4")) {
				latest_list=serv.getHighSearch(pagedto, keyword_searching);
			}else {
				latest_list=serv.getLikeSearch(pagedto, keyword_searching);
			}
			mo.addAttribute("orderby", orderby);
			mo.addAttribute("latest_list", latest_list);		
			mo.addAttribute("totalcnt", totalcnt);	
			mo.addAttribute("pagedto", pagedto);
			mo.addAttribute("catenum", catenum);
			mo.addAttribute("keyword_searching", keyword_searching);
		}else {
			//카테고리 이름
			String list_title = serv.getListTitle(Integer.parseInt(catenum));
			mo.addAttribute("list_title", list_title);
			String nowPage = request.getParameter("nowPage");
			String cntPerPage = request.getParameter("cntPerPage");
			String orderby = request.getParameter("orderby");
			
			int totalcnt = serv.getCntListPerCate(Integer.parseInt(catenum));
			if(nowPage==null && cntPerPage==null) {
				nowPage = "1";
				cntPerPage = "8";
			}else if(nowPage==null) {
				nowPage = "1";
			}else if(cntPerPage==null)
				cntPerPage = "8";
			PageDTO pagedto = new PageDTO(Integer.parseInt(nowPage), totalcnt, Integer.parseInt(cntPerPage));
			ArrayList<ProductDTO> latest_list = serv.getLatestPerCate(pagedto, Integer.parseInt(catenum));
			if(orderby.equals("1")) {
				latest_list=serv.getLatestPerCate(pagedto, Integer.parseInt(catenum));
			}else if(orderby.equals("2")) {
				latest_list=serv.getSellCountPerCate(pagedto, Integer.parseInt(catenum));
			}else if(orderby.equals("3")) {
				latest_list=serv.getLowPerCate(pagedto, Integer.parseInt(catenum));
			}else if(orderby.equals("4")) {
				latest_list=serv.getHighPerCate(pagedto, Integer.parseInt(catenum));
			}else {
				latest_list=serv.getLikePerCate(pagedto, Integer.parseInt(catenum));
			}
			mo.addAttribute("orderby", orderby);
			mo.addAttribute("latest_list", latest_list);		
			mo.addAttribute("totalcnt", totalcnt);	
			mo.addAttribute("pagedto", pagedto);
			mo.addAttribute("catenum", catenum);
		}
		return "product_list";
	}
}