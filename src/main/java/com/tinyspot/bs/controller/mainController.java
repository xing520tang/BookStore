package com.tinyspot.bs.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.Role;
import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.service.MainService;
import com.tinyspot.bs.service.ShopService;
import com.tinyspot.bs.service.UserService;

/**
 * "/name  get:查询"
 * "/name  post:创建"
 * "/name/id put:更新"
 * "/name/id delete:删除"
 * @author tinyspot
 *
 */
@Controller
public class mainController {
	@Autowired
	MainService mainService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage(HttpServletRequest request) {
		System.out.println("\nmain:GET******");
		 Role role = mainService.getRole(request.getSession());
		 request.setAttribute("role", role); //放回请求域，方便jsp页面使用
		return "index";
	}
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shoppingCartPage(HttpServletRequest request) {
		System.out.println("\nshoppingCart******");
		Role role = mainService.getRole(request.getSession());
		request.setAttribute("role", role); //放回请求域，方便jsp页面使用
		if(role.getIdentity() == Role.ANONYMOUS)
			return "redirect:login";
		return "shoppingCart";
	}
	
	/**
	 * 只处理get请求，作用只是返回登录页面
	 * @param mode
	 * @return
	 */
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String toLoginPage(HttpServletRequest request) {
		System.out.println("\nlogin:GET******");
		Role role = mainService.getRole(request.getSession());
		System.out.println("login:GET "+role);
		if(role.getIdentity() != Role.ANONYMOUS)
			return "redirect:main";
		return "login";
	}
	
	/**
	 * 登录验证，只接受post请求，返回处理信息的json
	 * @return
	 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//@ResponseBody
	public String login(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("\nlogin:POST******登录验证");
		System.out.println("password: "+request.getParameter("password"));
		User user = userService.verify(request.getParameter("phoneNumber"), request.getParameter("password"));
		if(user != null) { //验证成功
			//将用户信息存入session
			HttpSession session = request.getSession();
			session.setAttribute("uId", user.getuId());
			session.setAttribute("uNickName", user.getuNickname());
			session.setAttribute("uPhone", request.getParameter("phoneNumber"));
			session.setAttribute("uPassword", request.getParameter("password"));
			session.setAttribute("isLLogin", true);
			if(user.getuRId() == 2) {//如果该用户是商家，则把商家的店铺id也查出来
				List<Shop> shopList = shopService.getShopByIdUId(user.getuId());
				if(shopList.size() == 0)
					System.out.println("该店家的账号存在问题！！！！");
				session.setAttribute("sId", shopList.get(0).getsId()); //将该店家的店铺id存入session
			}
			System.out.println("登陆成功");
			//return Msg.success();
			redirectAttributes.addFlashAttribute("message", "登陆成功");//使用redirectAttribute将数据传入重定向的页面当中
			return "redirect:main";
		}
		System.out.println("登陆失败");
		//return Msg.fail().add("msg", "登陆失败");
		request.setAttribute("message", "登陆失败");
		return "login";
	}
	
	/**
	 *退出请求
	 * @param request
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request) {
		System.out.println("\nexit:GET******");
		//清楚session中的密码等信息
		HttpSession session = request.getSession();
		session.removeAttribute("uId");
		session.removeAttribute("uNickName");
		session.removeAttribute("uPhone");
		session.removeAttribute("uPassword");
		session.removeAttribute("isLLogin");
		session.removeAttribute("shopId");
		return "redirect:main";//重定向给main
	}
	
//	/**
//	 * 只处理get请求，作用也只是返回用户页面
//	 * @param mode
//	 * @return
//	 */
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public String toRegisterPage(ModelAndView mode) {
//		System.out.println("\nregister:GET******");
//		System.out.println(mode.getModel());
//		return "register";
//	}
//	
//	/**
//	 * 只处理get请求，作用是只返回商家注册界面
//	 * @return
//	 */
//	@RequestMapping(value = "/bRegister", method = RequestMethod.GET)
//	public String bRegister() {
//		System.out.println("\nbRegister:GET******");
//		return "bRegister";
//	}
	
//	@RequestMapping(value = "goodsDetail",method = RequestMethod.GET)
//	public String bookDetailPage(@RequestParam(value = "bId",defaultValue = "1")Integer bId, HttpServletRequest request) {
//		System.out.println("\ngoodsDetail/"+bId+"******");
//		Role role = mainService.getRole(request.getSession());
//		request.setAttribute("role", role);
//		request.setAttribute("bId", bId);//把bid放入请求域，在jsp中取出来放入一个标签中，用于发送书本详情数据的请求
//		return "goodsDetail";
//	}
	
	/**
	 * 返回书本详情页的简略页面
	 * @param bId
	 * @return
	 */
	@RequestMapping(value = "/goodsDetail/{bId}", method = RequestMethod.GET)
	public String goodsDetailPage(@PathVariable(value = "bId")Integer bId, HttpServletRequest request) {
		System.out.println("\ngoodsDetail/"+bId+"******");
		Role role = mainService.getRole(request.getSession());
		request.setAttribute("role", role);
		request.setAttribute("bId", bId);//把bid放入请求域，在jsp中取出来放入一个标签中，用于发送书本详情数据的请求
		return "goodsDetail";
	}
	
	
	/**
	 * 一个测试cookie以及关于操作cookie的一些方法
	 * @param request
	 * @param response
	 */
	public void cookieTest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("phoneNumber"));
		System.out.println("登录成功！");
		System.out.print("获得前端传过来的cookie：");
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			System.out.println(cookie);
			System.out.println("comment:"+cookie.getComment());
			System.out.println("domain:" + cookie.getDomain());
			System.out.println("name:"+cookie.getName());
			System.out.println("path:"+cookie.getPath());
			System.out.println("isSecure:"+cookie.getSecure());
			System.out.println("value"+cookie.getValue());
			System.out.println("version"+cookie.getVersion());
			System.out.println("maxage:"+cookie.getMaxAge());
		}
		Cookie cookie = new Cookie("testCookie", "123456789asdfasdf");
		cookie.setMaxAge(1*60);
		response.addCookie(cookie);
	}
}
