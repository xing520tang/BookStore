package com.tinyspot.bs.bean;

import java.security.MessageDigest;

public class Md5 {
	private static String[] hexArray = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
	
	public static Msg getMd5(String source) {
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(source.getBytes());
			byte[] rawBit = md.digest();
			StringBuffer outputMD5 = new StringBuffer();
			for(int i = 0; i<16; i++){
				outputMD5.append(hexArray[rawBit[i]>>>4& 0x0f]);
				outputMD5.append(hexArray[rawBit[i]& 0x0f]);
			}
			return Msg.success().add("md5", outputMD5.toString());
		}catch(Exception e){
			System.out.println("计算MD5值发生错误");
			e.printStackTrace();
		}
		return Msg.fail();
	}
}
