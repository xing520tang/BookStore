package com.tinyspot.bs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tinyspot.bs.bean.BOrderInfo;
import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.OrderMsg;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.service.BookServce;
import com.tinyspot.bs.service.MainService;
import com.tinyspot.bs.service.OrderService;
import com.tinyspot.bs.service.ShopService;
import com.tinyspot.bs.service.UserService;

@Controller
public class ShopMangeController {

	private static final Logger logger = LogManager.getLogger();
	
	@Autowired
	MainService mainService;
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	@Autowired
	BookServce bookService;
	@Autowired
	ShopService shopService;
	
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
		OrderMsg orderMsg = OrderMsg.success();
		try {
			List<Book> allBookInfo = bookService.getBooksBySId((Integer)req.getSession().getAttribute("sId"));
			
			if(allBookInfo==null || allBookInfo.size() == 0) {
				orderMsg.setCode(orderMsg.FAIL);
				return orderMsg;
			}
			
			for (Book book : allBookInfo) {
				System.out.println(book); //打印一下订单信息
				orderMsg.add(book);
			}
			return orderMsg;
		} catch (Exception e) {
			logger.error("/getBookInfo异常：", e);
			orderMsg.setCode(orderMsg.FAIL);
			return orderMsg;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public Msg addBook(@RequestParam("bookImage") MultipartFile pic, @RequestParam("pubDate")String pubDate, Book book, HttpServletRequest req) {
		Msg msg = Msg.fail();
		try {
			logger.info("/addBook");
			logger.info("文件原始名："+pic.getOriginalFilename());
			long size = pic.getSize();
			logger.info("文件大小：" + size);  //需要对文件大小进行检查，如果超过2M，需要删除图片
			String contentType = pic.getContentType();
			logger.info("图片类型： " + contentType);
			logger.info("书本信息：" + book);
			
			//验证图片
			if(size==0 || size>2097152) {
				msg.setMsg("图片不符合要求！");
				return msg;
			}
			
			if(!pic.getContentType().equals("image/jpeg") && !contentType.equals("image/png")) {
				msg.setMsg("图片格式不符合要求！");
				return msg;
			}
			
			//验证书本信息
			if(pubDate == null) {
				msg.setMsg("出版时间不符合要求");
				return msg;
			}else {
				try {
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date bPubDate = dateFormat.parse(pubDate);
					book.setbPubDate(bPubDate);
				} catch (Exception e) {
					logger.info("日期异常", e);
					msg.setMsg("出版时间不符合要求");
					return msg;
				}
			}
			if(book.getbName()==null || book.getbName().length()>25) {
				msg.setMsg("书名不符合要求！");
				return msg;
			}
			if(book.getbAuthor()==null || book.getbAuthor().length()>10) {
				msg.setMsg("作者名不符合要求");
				return msg;
			}
			if(book.getbStock() <= 0) {
				msg.setMsg("库存是大于0的整数");
				return msg;
			}
			if(book.getbPrice() <= 0) {
				msg.setMsg("单价需大于0，且保留两位小数");
				return msg;
			}
			if(book.getbDiscount()<=0 || book.getbDiscount()>10) {
				msg.setMsg("折扣是(0~10)之间的小数，保留一位小数");
				return msg;
			}
			
			//都验证通过之后,先存图片
			
			String realPath = req.getServletContext().getRealPath("static/imgs/book_imgs/");//得到static目录的绝对路径,在工程目录里看不到，但是是可以用的，实际目录是：F:\eclipse_j2ee_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\bookstore\static\imgs\book_imgs 
			 
			book.setbSId((Integer)req.getSession().getAttribute("sId")); //设置sId
			
			try {
				shopService.addBook(book, pic, realPath);
			} catch (Exception e) {
				logger.error("事务方法shopService.addBook()抛出异常，存储书本失败");
				msg.setMsg("服务器异常，请稍后重试\n或联系管理人员");
				return msg;
			}
			
			 
		} catch (Exception e) {
			logger.error("/addBook异常：", e);
			msg.setMsg("服务器异常，请稍后重试\n或联系管理人员");
			return msg;
		}
		msg.setCode(msg.SUCCESS);//设置成功码，具体提示消息在前端设置
		return msg;
	}
	
}
