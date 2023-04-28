package com.vitalchoice.web.chat;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {
	@Autowired
	SqlSession sqlsession;	
	@RequestMapping(value="/chatstart")
	public String sam1() {
		return"chat";
	}
	@ResponseBody
	@RequestMapping(value="/chatout",method = RequestMethod.POST,produces = "application/text;charset=UTF-8")
	public static String chatGPT2(HttpServletRequest request,Model mo) throws Exception{
		String qqq = request.getParameter("qqq2");
		qqq = qqq + " 증상에 맞는 건강관리법 간단히 4가지 알려주세요";
		String url = "https://api.openai.com/v1/completions";
        HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();

        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "Bearer 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");
        JSONObject data = new JSONObject();
        data.put("model", "text-davinci-003");
        data.put("prompt", qqq);
        data.put("max_tokens", 4000);
        data.put("temperature", 1.0);
        con.setDoOutput(true);
        con.getOutputStream().write(data.toString().getBytes());
        String output = "";
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String line;
        while ((line = in.readLine()) != null) {
            output += line;
        }
        in.close();
        String bbb = new org.json.JSONObject(output).getJSONArray("choices").getJSONObject(0).getString("text");
        System.out.println(bbb);
        mo.addAttribute("bbb",bbb);
        return bbb;
	}
	@ResponseBody
	@RequestMapping(value="/chatout2",method = RequestMethod.POST,produces = "application/text;charset=UTF-8")
	public static String chatGPT(HttpServletRequest request,Model mo) throws Exception{
		String qqq = request.getParameter("qqq");
		qqq = qqq + "영양제 3가지 추천해주세요";
		String url = "https://api.openai.com/v1/completions";
        HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "Bearer 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");
        JSONObject data = new JSONObject();
        data.put("model", "text-davinci-003");
        data.put("prompt", qqq);
        data.put("max_tokens", 4000);
        data.put("temperature", 1.0);
        con.setDoOutput(true);
        con.getOutputStream().write(data.toString().getBytes());
        String output = "";
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String line;
        while ((line = in.readLine()) != null) {
            output += line;
        }
        in.close();
        String aaa = new org.json.JSONObject(output).getJSONArray("choices").getJSONObject(0).getString("text");
        System.out.println(aaa);
        mo.addAttribute("aaa",aaa);
        return aaa;
	}
}