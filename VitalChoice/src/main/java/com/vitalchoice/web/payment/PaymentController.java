package com.vitalchoice.web.payment;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PaymentController {
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/cartout", method = RequestMethod.POST)
	public String cartout(HttpServletRequest request,Model mo) throws JsonMappingException, JsonProcessingException {
	    // JSON 문자열로 받은 상품 정보를 DTO 객체로 변환
		String selectedProducts = request.getParameter("selectedProducts");
		ObjectMapper objectMapper = new ObjectMapper();
		ArrayList<SelectedProductDTO> list = objectMapper.readValue(selectedProducts, new TypeReference<ArrayList<SelectedProductDTO>>() {});
		String id = list.get(0).getUserId();
		Service_payment serv = sqlsession.getMapper(Service_payment.class);
		PayerDTO dto = serv.payerout(id);
		int totprice = 0;
		for(int i=0;i<list.size();i++) {
			totprice = totprice+list.get(i).getProductPrice()*list.get(i).getProductCount();
		}
		mo.addAttribute("totprice", totprice);
		mo.addAttribute("splist", list);
		mo.addAttribute("payerdto", dto);
	    return "payment";
	}
	@RequestMapping(value="/couponlist",method = RequestMethod.POST,produces="application/json")
	@ResponseBody
	public String ko2(String id) {
		Service_payment serv = sqlsession.getMapper(Service_payment.class);
		ArrayList<CouponDTO> couponList = serv.couponlist(id);
		ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(couponList);
        }
        catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
	}
	@RequestMapping(value="/applyCoupon",method = RequestMethod.POST,produces="application/json")
	@ResponseBody
	public String applyCoupon(String couponNum) {
		Service_payment serv = sqlsession.getMapper(Service_payment.class);
		ArrayList<CouponDTO> selectedcoupon = serv.selectedcoupon(couponNum);
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
        try {
            json = mapper.writeValueAsString(selectedcoupon);
        }
        catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
	}
	@RequestMapping(value="/kakaopay")
	@ResponseBody
	public String kakaopay(HttpServletRequest request) {
		// 결제 상품정보
		String[] productNum = request.getParameterValues("productNum[]");
		String[] productName = request.getParameterValues("productName[]");
		String[] productCount = request.getParameterValues("productCount[]");
		String[] productPrice = request.getParameterValues("productPrice[]");
		String[] producttotPrice = request.getParameterValues("producttotPrice[]");
		
		// 결제 배송지 정보
		String payerid = request.getParameter("payerid");
		String deliveryname = request.getParameter("deliveryname");
		String deliveryaddress1 = request.getParameter("deliveryaddress1");
		String deliveryaddress2 = request.getParameter("deliveryaddress2");
		String deliveryaddress3 = request.getParameter("deliveryaddress3");
		String deliveryphone = request.getParameter("deliveryphone");
		String deliveryrequest = request.getParameter("deliveryrequest");
		
		// 결제 금액 정보
		int coupondiscount = Integer.parseInt(request.getParameter("discount"));
		double gradesaledouble = Double.parseDouble(request.getParameter("gradesale"));
		int gradesale = (int)Math.floor(gradesaledouble);
		int deliveryfee = Integer.parseInt(request.getParameter("deliveryFee"));
		int point = Integer.parseInt(request.getParameter("point"));
		int totalpayment = Integer.parseInt(request.getParameter("totalPayment"));
		
		// 결제 쿠폰 정보
		int couponnum = Integer.parseInt(request.getParameter("couponnum"));
		int couponrate = Integer.parseInt(request.getParameter("couponrate"));
		
		// 데이터 모으기
		DeliveryDTO deliverydto = new DeliveryDTO();
		deliverydto.setUser_id(payerid);
		deliverydto.setDelivery_name(deliveryname);
		deliverydto.setDelivery_address1(deliveryaddress1);
		deliverydto.setDelivery_address2(deliveryaddress2);
		deliverydto.setDelivery_address3(deliveryaddress3);
		deliverydto.setDelivery_phone(deliveryphone);
		deliverydto.setDelivery_request(deliveryrequest);
		deliverydto.setCoupon_sale(coupondiscount);
		deliverydto.setGrade_sale(gradesale);
		deliverydto.setDelivery_fee(deliveryfee);
		deliverydto.setPoint(point);
		deliverydto.setTotal_payment(totalpayment);
		deliverydto.setCoupon_num(couponnum);
		deliverydto.setDiscount_rate(couponrate);
		
		ArrayList<DeliveryproductDTO> Deliveryproduct = new ArrayList<>();
		for (int i = 0; i < productNum.length; i++) {
			DeliveryproductDTO dto = new DeliveryproductDTO();
			dto.setProduct_num(productNum[i]);
		    dto.setProduct_name(productName[i]);
		    dto.setProduct_count(productCount[i]);
		    dto.setProduct_price(productPrice[i]);
		    dto.setProduct_totPrice(producttotPrice[i]);
			Deliveryproduct.add(dto);
		}
		HttpSession hs = request.getSession();
		hs.setAttribute("deliverydto", deliverydto);
		hs.setAttribute("Deliveryproduct", Deliveryproduct);
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection hc = (HttpURLConnection) address.openConnection();
			hc.setRequestMethod("POST");
			hc.setRequestProperty("Authorization", "KakaoAK 6d20eca24ba3542da29c0b42d1c370c7");
			hc.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			hc.setDoOutput(true);
			String cid = "cid=TC0ONETIME"
					+"&partner_order_id=partner_order_id"
					+"&partner_user_id=partner_user_id"
					+"&item_name=VitalChoice"
					+"&quantity=1"
					+"&total_amount="+totalpayment
					+"&tax_free_amount=0"
					+"&approval_url=http://localhost:8181/web/paysuccess"
					+"&fail_url=http://localhost:8181/web/payfail"
					+"&cancel_url=http://localhost:8181/web/paycancel";
			OutputStream output = hc.getOutputStream();
			DataOutputStream dataoutput = new DataOutputStream(output);
			dataoutput.writeBytes(cid);
			dataoutput.close();
			int result = hc.getResponseCode();
			InputStream input;
			if(result== 200) {
				input = hc.getInputStream();
			}
			else {
				input = hc.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader br = new BufferedReader(reader);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	@RequestMapping(value="/paysuccess")
	public String kakao1(HttpServletRequest request,Model mo) throws AddressException, MessagingException {
		HttpSession hs = request.getSession();
		ArrayList<DeliveryproductDTO> list = (ArrayList<DeliveryproductDTO>) hs.getAttribute("Deliveryproduct");
		DeliveryDTO deliverydto = (DeliveryDTO) hs.getAttribute("deliverydto");
		Service_payment serv = sqlsession.getMapper(Service_payment.class);
		String user_id = deliverydto.getUser_id();
		String delivery_name = deliverydto.getDelivery_name();
		String delivery_address1 = deliverydto.getDelivery_address1();
		String delivery_address2 = deliverydto.getDelivery_address2();
		String delivery_address3 = deliverydto.getDelivery_address3();
		String delivery_phone = deliverydto.getDelivery_phone();
		String delivery_request = deliverydto.getDelivery_request();
		int coupon_sale = deliverydto.getCoupon_sale();
		int grade_sale = deliverydto.getGrade_sale();
		int delivery_fee = deliverydto.getDelivery_fee();
		int point = deliverydto.getPoint();
		int total_payment = deliverydto.getTotal_payment();
		int coupon_num = deliverydto.getCoupon_num();
		int discount_rate = deliverydto.getDiscount_rate();
		serv.deliveryinfoinsert(user_id,delivery_name,delivery_address1,delivery_address2,delivery_address3,delivery_phone,delivery_request,
				coupon_sale,grade_sale,delivery_fee,point,total_payment,coupon_num,discount_rate);
		String order_num = serv.inquiry();
		for(int i=0;i<list.size();i++) {
			String product_num = list.get(i).getProduct_num();
			String product_name = list.get(i).getProduct_name();
			String product_count = list.get(i).getProduct_count();
			String product_price = list.get(i).getProduct_price();
			String product_totPrice = list.get(i).getProduct_totPrice();
			serv.deliveryproductinsert(order_num,product_num,product_name,product_count,product_price,product_totPrice);
		}
		serv.totpurchase_point(total_payment,point,grade_sale,user_id);
		serv.couponused(coupon_num,user_id);
		serv.cartdelete(user_id);
		// 주문내역 이메일 보내기
		String email = serv.deliveryemail(user_id);
		String host = "smtp.naver.com";
        String username = "hanthsong@naver.com";
        String password = "pw";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject(delivery_name+"님의 주문내역입니다.");
        message.setText(
        		"주문정보\n\n"
        		+ "상품명: "+list.get(0).getProduct_name()+" 외"+(list.size()-1)+"종"+"\n"
        		+ "주문자명: "+delivery_name+"\n"
        		+ "주소: ("+delivery_address1+")"+delivery_address2+delivery_address3+"\n"
        		+ "전화번호: "+delivery_phone+"\n"
        		+ "요청사항: "+delivery_request+"\n"
        		+ "결제수단: 카카오페이"+"\n"
        		+ "총결제액: "+total_payment);
        Transport.send(message);
		return "paysuccess";
	}
	@RequestMapping(value="/payfail")
	public String kakao2(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("deliverydto");
		hs.removeAttribute("Deliveryproduct");
		return "payfail";
	}
	@RequestMapping(value="/paycancel")
	public String kakao3(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("deliverydto");
		hs.removeAttribute("Deliveryproduct");
		return "paycancel";
	}
}
