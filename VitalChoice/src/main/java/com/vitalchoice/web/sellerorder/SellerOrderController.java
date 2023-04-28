package com.vitalchoice.web.sellerorder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerOrderController {

   @Autowired
   SqlSession sqlSession;
   
   @RequestMapping(value = "/checkorder")
   public String sellerorder1(HttpServletRequest request, Model mo) {
      Service_SellerOrder serv = sqlSession.getMapper(Service_SellerOrder.class);
      HttpSession hs = request.getSession();
      int store_snum = (Integer) hs.getAttribute("store_snum");
      int beforecnt = serv.getBeforeDeliveryCnt(store_snum);
      int middlecnt = serv.getMiddleDeliveryCnt(store_snum);
      int aftercnt = serv.getAfterDeliveryCnt(store_snum);
      
      mo.addAttribute("beforecnt", beforecnt);
      mo.addAttribute("middlecnt", middlecnt);
      mo.addAttribute("aftercnt", aftercnt);
      ArrayList<SellerOrderDTO> sellerorderlist = serv.getNewOrderList(store_snum);
      mo.addAttribute("sellerorderlist", sellerorderlist);
      ArrayList<SellerOrderDTO> sellerorderlist2 = serv.getMiddleOrderList(store_snum);
      mo.addAttribute("sellerorderlist2", sellerorderlist2);
      ArrayList<SellerOrderDTO> sellerorderlist3 = serv.getAfterOrderList(store_snum);
      mo.addAttribute("sellerorderlist3", sellerorderlist3);
      System.out.println(sellerorderlist.size());
      return "sellerorder";
   }
   
   @RequestMapping(value = "/neworderform")
   public String sellerorder2(HttpServletRequest request) {
      Service_SellerOrder serv = sqlSession.getMapper(Service_SellerOrder.class);
      String[] orders = request.getParameterValues("checked");
      
      if (orders != null) {
              for (String order : orders) {
                  String[] parts = order.split(",");
                  int order_num = Integer.parseInt(parts[0]);
                  int product_num = Integer.parseInt(parts[1]);
                  int product_totprice = Integer.parseInt(parts[2]);
                  //받은 자료들 주문완료 상태로 바꾸기(delivery_status=1)
                  serv.changeStatusOne(order_num, product_num);
                  //storeDB 업데이트 (cnt, 매출액)
                  HttpSession hs = request.getSession();
                int store_snum = (Integer) hs.getAttribute("store_snum");
                  serv.upSales(store_snum, product_totprice);
                  serv.upSellCnt(store_snum);
              }
      }
      return "redirect:checkorder";
   }
}