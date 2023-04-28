package com.vitalchoice.web.sellerask;

import java.util.ArrayList;

import com.vitalchoice.web.productout.ReplyDTO;

public interface Service_sellerask {
	public ArrayList<ReplyDTO> getReplyDTO(int store_snum);
	public void insertQna(int product_num, String content, int reply_origin_number);
	public ArrayList<ReplyDTO> getReplyDTO2(int store_snum);
	public void updateReply_yn(int reply_origin_number);
}