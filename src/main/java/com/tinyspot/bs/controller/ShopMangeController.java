package com.tinyspot.bs.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tinyspot.bs.bean.BOrderInfo;
import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.OrderMsg;
import com.tinyspot.bs.bean.Role;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.service.MainService;
import com.tinyspot.bs.service.OrderService;
import com.tinyspot.bs.service.UserService;
import com.tinyspot.bs.service.BookServce;

@Controller
public class ShopMangeController {

	@Autowired
	MainService mainService;
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	@Autowired
	BookServce bookService;
	
	@RequestMapping(value="/shopManage", method = RequestMethod.GET)
	public String getShopManagePage(HttpServletRequest req) {
		System.out.println("ShopMangeController-->getShopMangePage");
		HttpSession session = req.getSession();
		//如果登录已经过期，重定向到主页
		if(session.getAttribute("uPhone") == null)
			return "redirect:main";
		User user = userService.verify((String)session.getAttribute("uPhone"), (String)session.getAttribute("uPassword"));
		if(user.getuRId() == 1) {//身份是用户
			return "redirect:profile";
		}else if(user.getuId() == 3) {
			return "redirect:manage";
		}
		req.setAttribute("user", user); //放回请求域，方便jsp页面使用
		return "shopManage";
	}
	
	/**
	 * 返回某商家对应的订单列表信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/getBOrderInfo" ,method = RequestMethod.GET)
	@ResponseBody
	public OrderMsg getBOrderInfo(HttpServletRequest req) {
		System.out.println("ShopManageController --> getBOrderInfo-->sId:"+req.getSession().getAttribute("sId"));
		List<BOrderInfo> allBOrderInfo = orderService.getAllBOrderInfo((Integer)req.getSession().getAttribute("sId"));
		OrderMsg orderMsg = OrderMsg.success();
		if(allBOrderInfo==null || allBOrderInfo.size() == 0) {
			orderMsg.setCode(orderMsg.FAIL);
			return orderMsg;
		}
		
		for (BOrderInfo bOrderInfo : allBOrderInfo) {
			System.out.println(bOrderInfo); //打印一下订单信息
			orderMsg.add(bOrderInfo);
		}
		return orderMsg;
	}
	
	/**
	 * 返回某商家对应的待处理订单信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/getBOrderInfoToDo" ,method = RequestMethod.GET)
	@ResponseBody
	public OrderMsg getBOrderInfoToDo(HttpServletRequest req) {
		System.out.println("ShopManageController --> getBOrderInfoToDo-->sId:"+req.getSession().getAttribute("sId"));
		List<BOrderInfo> allBOrderInfo = orderService.getAllBOrderInfoToDo((Integer)req.getSession().getAttribute("sId"));
		OrderMsg orderMsg = OrderMsg.success();
		if(allBOrderInfo==null || allBOrderInfo.size() == 0) {
			orderMsg.setCode(orderMsg.FAIL);
			return orderMsg;
		}
		
		for (BOrderInfo bOrderInfo : allBOrderInfo) {
			System.out.println(bOrderInfo); //打印一下订单信息
			orderMsg.add(bOrderInfo);
		}
		return orderMsg;
	}
	
	/**
	 * 返回某店家的书本列表信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/getBookInfo" ,method = RequestMethod.GET)
	@ResponseBody
	public OrderMsg getBookInfo(HttpServletRequest req) {
		System.out.println("ShopManageController --> getBOrderInfoToDo-->sId:"+req.getSession().getAttribute("sId"));
		List<Book> allBookInfo = bookService.getBooksBySId((Integer)req.getSession().getAttribute("sId"));
		OrderMsg orderMsg = OrderMsg.success();
		if(allBookInfo==null || allBookInfo.size() == 0) {
			orderMsg.setCode(orderMsg.FAIL);
			return orderMsg;
		}
		
		for (Book book : allBookInfo) {
			System.out.println(book); //打印一下订单信息
			orderMsg.add(book);
		}
		return orderMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String addBook(@RequestParam("bookImage") MultipartFile pic) {
		System.out.println("文件原始名："+pic.getOriginalFilename());
		System.out.println("文件大小：" +pic.getSize());
		
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value = "/testExceptionHandler")
	public String testExceptionHandler(@RequestParam("i") int i) {
		System.out.println("10/i:" + 10/i);
		return "succ";
	}
}
