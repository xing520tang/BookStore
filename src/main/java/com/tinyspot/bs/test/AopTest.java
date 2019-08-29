package com.tinyspot.bs.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tinyspot.bs.bean.Book;

/**
 * 测试aop
 * @author TinySpot
 *
 */
public class AopTest {
	
	public static void main(String args[]) {
//		ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
//		
//		String[] names = ioc.getBeanDefinitionNames();
//		
//		for (String name : names) {
//			
//			System.out.println(name);
//		}
//		System.out.println("=====================");
//		Book book = ioc.getBean(Book.class);
//		System.out.println(book);
		
		ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:dispatcherServlet-servlet.xml");
		
		String []names = ioc.getBeanDefinitionNames();
		
		for (String name : names) {
			System.out.println(name);
		}
		
		
	}
}
