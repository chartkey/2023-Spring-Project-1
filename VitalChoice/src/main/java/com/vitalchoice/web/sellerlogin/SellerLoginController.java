package com.vitalchoice.web.sellerlogin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vitalchoice.web.sellerorder.Service_SellerOrder;

@Controller
public class SellerLoginController {

   @Autowired
   SqlSession sqlSession;
   
   @RequestMapping(value = "/sellerlogin")
   public String sellerlogin1() {
      return "sellerloginform";
   }
   
   @RequestMapping(value = "/sellerloginsave", method = RequestMethod.POST)
   public String sellerlogin2(HttpServletRequest request, Model mo) {
      String seller_id = request.getParameter("seller_id");
      String seller_pw = request.getParameter("seller_pw");
      Service_SellerLogin serv = sqlSession.getMapper(Service_SellerLogin.class);
      String log_id = serv.login(seller_id, seller_pw);
      
      HttpSession hs = request.getSession();
      if(log_id!=null) {
         hs.setAttribute("seller_log_id", log_id);
         hs.setAttribute("seller_loginstate", true); 
         //스토어정보 가져오기
         StoreDTO storedto = serv.getStoreSname(log_id);
         hs.setAttribute("store_sname", storedto.getStore_sname());
         hs.setAttribute("store_snum", storedto.getStore_snum());
         Service_SellerOrder serv2 = sqlSession.getMapper(Service_SellerOrder.class);
         int beforecnt = serv2.getBeforeDeliveryCnt(storedto.getStore_snum());
         int middlecnt = serv2.getMiddleDeliveryCnt(storedto.getStore_snum());
         int aftercnt = serv2.getAfterDeliveryCnt(storedto.getStore_snum());
         int store_sellcount = serv2.getSellCnt(storedto.getStore_snum());
         int store_sales = serv2.getStoreSales(storedto.getStore_snum());
         mo.addAttribute("beforecnt", beforecnt);
         mo.addAttribute("middlecnt", middlecnt);
         mo.addAttribute("aftercnt", aftercnt);
         mo.addAttribute("store_sellcount", store_sellcount);
         mo.addAttribute("store_sales", store_sales);
         return "sellerhome";
      }else {
         
         return "redirect:sellerlogin";
      }
      
   }
   @RequestMapping(value = "/sellerlogout")
   public String sellerlogin3(HttpServletRequest request) {
         HttpSession hs = request.getSession();
         hs.removeAttribute("seller_log_id");
         hs.removeAttribute("seller_loginstate");
      return "redirect:goseller";
   }
   
}