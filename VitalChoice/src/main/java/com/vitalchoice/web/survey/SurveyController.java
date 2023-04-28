package com.vitalchoice.web.survey;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.vitalchoice.web.user.UserDTO;

@Controller
public class SurveyController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value="/survey")
	public String ko1(HttpServletRequest request,RedirectAttributes ra) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		String id = dto.getUser_id();
		Service_survey serv = sqlsession.getMapper(Service_survey.class);
		String cnt = serv.surveycheck(id);
		if(cnt.equals("0")) {
			return "survey";
		}
		else {
			ra.addAttribute("result", "surveydone");
			return "main";
		}
	}
	@RequestMapping(value="/surveyout")
	public String ko2(HttpServletRequest request,Model mo) {
		String survey_gender = request.getParameter("survey_gender");
		String survey_age = request.getParameter("survey_age");
		Service_survey serv = sqlsession.getMapper(Service_survey.class);
		ArrayList<SurveyDTO> list = serv.surveylist(survey_gender,survey_age);
		mo.addAttribute("surveylist", list);
		return "surveyout";
	}
	@RequestMapping(value="/suveysave")
	public String handleSurveysave(HttpServletRequest request) {
	    String userId = request.getParameter("user_id");
	    SurveydetailDTO[] surveys = new SurveydetailDTO[15]; // 최대
	    Service_survey serv = sqlsession.getMapper(Service_survey.class);
	    // 각 질문마다 전송된 데이터를 읽어서 Survey 객체에 저장합니다.
	    for (int i = 0; i < surveys.length; i++) {
	        String surveyNum = request.getParameter("survey[" + i + "].survey_num");
	        String categoryNum = request.getParameter("survey[" + i + "].category_num");
	        String surveyCheck = request.getParameter("survey[" + i + "].survey_check");
	        String surveyAge = request.getParameter("survey[" + i + "].survey_age");
	        if(surveyNum==null) {
	        	
	        }
	        else {
	        	serv.suveyinsert(userId,surveyNum,categoryNum,surveyCheck,surveyAge);
	        }
	    }
	    return "redirect:surveyout2";
	}
	@RequestMapping(value="/surveyout2")
	public String su(HttpServletRequest request ,Model mo) {
		HttpSession hs = request.getSession();
		UserDTO dto = (UserDTO) hs.getAttribute("user_dto");
		if(dto==null) {
			String id = request.getParameter("User_id");
			Service_survey serv = sqlsession.getMapper(Service_survey.class);
		    ArrayList<SurveydetailDTO> list = serv.surveyresult(id);
		    mo.addAttribute("surveydetail", list);
		}
		else {
			String id = dto.getUser_id();
			Service_survey serv = sqlsession.getMapper(Service_survey.class);
		    ArrayList<SurveydetailDTO> list = serv.surveyresult(id);
		    mo.addAttribute("surveydetail", list);
		}
	    return "surveyout2";
	}
	@RequestMapping(value ="/qrcodeout")
    public ResponseEntity<byte[]> createQr(HttpServletRequest request) throws WriterException, IOException {
        String id = request.getParameter("id");
        String url = "http://localhost:8181/web/surveyout2?User_id="+id;
        int width = 200;
        int height = 200;
        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);
        ByteArrayOutputStream out = new ByteArrayOutputStream(); {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(org.springframework.http.MediaType.IMAGE_PNG);
            return new ResponseEntity<>(out.toByteArray(), headers, HttpStatus.OK);
        }
    }
}