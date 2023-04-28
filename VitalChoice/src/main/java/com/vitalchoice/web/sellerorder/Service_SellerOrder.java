package com.vitalchoice.web.sellerorder;

import java.util.ArrayList;

public interface Service_SellerOrder {

   public int getBeforeDeliveryCnt(int store_snum);

   public int getMiddleDeliveryCnt(int store_snum);
   
   public int getAfterDeliveryCnt(int store_snum);

   public ArrayList<SellerOrderDTO> getNewOrderList(int store_snum);

   public ArrayList<SellerOrderDTO> getMiddleOrderList(int store_snum);
   
   public ArrayList<SellerOrderDTO> getAfterOrderList(int store_snum);

   public void changeStatusOne(int order_num, int product_num);

   public void upSales(int store_snum, int product_totprice);

   public void upSellCnt(int store_snum);

   public int getStoreSales(int store_snum);

   public int getSellCnt(int store_snum);

}