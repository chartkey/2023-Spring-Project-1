package com.vitalchoice.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@Controller
public class QrcodeController {
	@RequestMapping(value="/qrcode")
	public String ko1() {
		return "qrcode";
	}
	@RequestMapping(value ="/qrcodeout")
    public ResponseEntity<byte[]> createQr(HttpServletRequest request) throws WriterException, IOException {
        String url = request.getParameter("url");
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