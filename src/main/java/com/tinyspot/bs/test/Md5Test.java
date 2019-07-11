package com.tinyspot.bs.test;

import java.security.MessageDigest;
import org.junit.Test;

import com.tinyspot.bs.bean.Md5;
public class Md5Test {
	
	@Test
	public void Test() {
		System.out.println(Md5.getMd5("123456").getExtend().get("md5"));
		System.out.println(Md5.getMd5("666666"));
	}
}
