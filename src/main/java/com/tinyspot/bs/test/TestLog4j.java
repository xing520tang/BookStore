package com.tinyspot.bs.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TestLog4j {
	private static final Logger logger = LogManager.getLogger(TestLog4j.class);
	//private static final Logger logger = LogManager.getLogger();  //和上面效果一样，不写参数也表示以这个类为参数
	
	public static void main(String[] args) {
		int i = 0;
		i = i++ + i++;
		System.out.println(i);
		logger.debug("hello debug");
		logger.info("hello info");
		logger.warn("hello warn");
		logger.error("hello error");
		
		//File file = new File(TestLog4j.class.get);
		System.out.println(TestLog4j.class.getResource("/static/imgs/book_imgs/1.jpg"));
		InputStream is = TestLog4j.class.getResourceAsStream("/static/imgs/book_imgs/1.jpg");
		try {
			System.out.println(is.read());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/*
		 * try { //FileInputStream fis = new FileInput
		 * 
		 * try { //System.out.println(fis.read()); } catch (IOException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); } } catch
		 * (FileNotFoundException e) { e.printStackTrace(); }
		 */
	}
}
