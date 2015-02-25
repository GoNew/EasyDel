package easydel.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import easydel.exception.ServiceFailException;

public class SmsMessageService implements ISmsMessageService {
	public static final Logger logger = LoggerFactory
			.getLogger(SmsMessageService.class);

	public boolean sendSms(String sendMsg, String phoneNum) throws ServiceFailException {
		String charsetType = "UTF-8"; // EUC-KR 또는 UTF-8

		String phone = null;
		String smsLength = "S";
		
		switch(phoneNum.length()) {
		case 10:
			phone = phoneNum.substring(0, 3);
			phone += "-";
			phone += phoneNum.substring(3, 6);
			phone += "-";
			phone += phoneNum.substring(6);
			break;
		case 11:
			phone = phoneNum.substring(0, 3);
			phone += "-";
			phone += phoneNum.substring(3, 7);
			phone += "-";
			phone += phoneNum.substring(7);
			break;
		default:
			throw new ServiceFailException("입력된 전화번호가 잘못되었습니다.");	
		}

		String sms_url = "http://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
		String user_id = null;
		String secure = null;
		String msg = null;
		String rphone = null;
		String sphone1 = null;
		String sphone2 = null;
		String sphone3 = null;
		String rdate = null;
		String rtime = null;
		String mode = null;
		String testflag = null;
		String destination = null;
		String repeatFlag = null;
		String repeatNum = null;
		String repeatTime = null;
		String returnurl = null;
		String nointeractive = null;
		String smsType = null;
		try {
			user_id = base64Encode("dhdlddj");// SMS아이디
			secure = base64Encode("f495dbda5db08e428655ef6b386e12e9");// 인증키
			msg = base64Encode(sendMsg);
			rphone = base64Encode(phone);
			sphone1 = base64Encode("0000");
			sphone2 = base64Encode("0000");
			sphone3 = base64Encode("");
			rdate = base64Encode("");
			rtime = base64Encode("");
			mode = base64Encode("1");
			testflag = base64Encode("");
			destination = base64Encode("");
			repeatFlag = base64Encode("");
			repeatNum = base64Encode("");
			repeatTime = base64Encode("");
			returnurl = "";
			nointeractive = "";
			smsType = base64Encode(smsLength);
		} catch (IOException e) {
			e.printStackTrace();
			throw new ServiceFailException("입력 정보가 잘못되었습니다.");
		} 
		
		String[] host_info = sms_url.split("/");
		String host = host_info[2];
		String path = "/" + host_info[3];
		int port = 80;

		// 데이터 맵핑 변수 정의
		String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone",
				"sphone1", "sphone2", "sphone3", "rdate", "rtime", "mode",
				"testflag", "destination", "repeatFlag", "repeatNum",
				"repeatTime", "smsType" };
		String valKey[] = new String[arrKey.length];
		valKey[0] = user_id;
		valKey[1] = secure;
		valKey[2] = msg;
		valKey[3] = rphone;
		valKey[4] = sphone1;
		valKey[5] = sphone2;
		valKey[6] = sphone3;
		valKey[7] = rdate;
		valKey[8] = rtime;
		valKey[9] = mode;
		valKey[10] = testflag;
		valKey[11] = destination;
		valKey[12] = repeatFlag;
		valKey[13] = repeatNum;
		valKey[14] = repeatTime;
		valKey[15] = smsType;

		String boundary = "";
		Random rnd = new Random();
		String rndKey = Integer.toString(rnd.nextInt(32000));
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new ServiceFailException("치명적 오류");
		}
		byte[] bytData = rndKey.getBytes();
		md.update(bytData);
		byte[] digest = md.digest();
		for (int i = 0; i < digest.length; i++) {
			boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		}
		boundary = "---------------------" + boundary.substring(0, 10);

		// 본문 생성
		String data = "";
		String index = "";
		String value = "";
		for (int i = 0; i < arrKey.length; i++) {
			index = arrKey[i];
			value = valKey[i];
			data += "--" + boundary + "\r\n";
			data += "Content-Disposition: form-data; name=\"" + index
					+ "\"\r\n";
			data += "\r\n" + value + "\r\n";
			data += "--" + boundary + "\r\n";
		}

		// out.println(data);
		
		ArrayList tmpArr = null;

		try {
			InetAddress addr = InetAddress.getByName(host);
			Socket socket = new Socket(host, port);
			
			// 헤더 전송
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(
					socket.getOutputStream(), charsetType));
			wr.write("POST " + path + " HTTP/1.0\r\n");
			wr.write("Content-Length: " + data.length() + "\r\n");
			wr.write("Content-type: multipart/form-data, boundary=" + boundary
					+ "\r\n");
			wr.write("\r\n");

			// 데이터 전송
			wr.write(data);
			wr.flush();

			// 결과값 얻기
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					socket.getInputStream(), charsetType));
			String line;
			String alert = "";
			tmpArr = new ArrayList();
			while ((line = rd.readLine()) != null) {
				tmpArr.add(line);
			}
			socket.close();
			wr.close();
			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
			throw new ServiceFailException("메시지 발송중 에러가 발생하였습니다.");
		}

		String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
		String[] rMsg = tmpMsg.split(",");
		String Result = rMsg[0]; // 발송결과
		String Count = ""; // 잔여건수
		if (rMsg.length > 1) {
			Count = rMsg[1];
		}

		boolean result = false;
		// 발송결과 알림
		if (Result.equals("success")) {
			logger.trace("성공적으로 발송하였습니다." + " 잔여건수는 " + Count + "건 입니다.");
			result = true;
		} else if (Result.equals("3205")) {
			throw new ServiceFailException("잘못된 번호형식입니다.");
		} else {
			throw new ServiceFailException("[Error]" + Result);
		}
		return result;
	}

	private static String base64Encode(String str) throws java.io.IOException {
		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		byte[] strByte = str.getBytes();
		String result = encoder.encode(strByte);
		return result;
	}
}
