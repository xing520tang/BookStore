package com.tinyspot.bs.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tinyspot.bs.bean.Md5;
import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.Role;
import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.dao.UserMapper;
import com.tinyspot.bs.service.MainService;
import com.tinyspot.bs.service.ShopService;
import com.tinyspot.bs.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	ShopService shopService;
	/**
	 * 返回用户中心页面
	 * @return
	 */
	@RequestMapping("/profile")
	public String getProfilePage(HttpServletRequest req) {
		System.out.println("UserController-->getProfilePage");
		Role role = mainService.getRole(req.getSession());
		req.setAttribute("role", role); //放回请求域，方便jsp页面使用
		return "profile";
	}
	
	/**
	 * 返回用户数据
	 * @return
	 */
	@RequestMapping("/getProfileDate")
	@ResponseBody
	public Msg getProfileDate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = userService.verify((String)session.getAttribute("uPhone"), (String)session.getAttribute("uPassword"));
		user.setuPassword("hello world!");
		return Msg.success().add("user", user);
	}


	/**
	 * 只处理get请求，作用也只是返回用户页面
	 * @param mode
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String toRegisterPage(ModelAndView mode) {
		System.out.println("\nregister:GET******");
		System.out.println(mode.getModel());
		return "register";
	}
	
	/**
	 * 只处理post请求，用于普通用户注册
	 * 返回当前页面或登录页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, HttpServletRequest req, RedirectAttributes ra) {
		System.out.println("\nregister:POST******");
		System.out.println(user);
		System.out.println("密码md5："+(String)Md5.getMd5(user.getuPassword()).getExtend().get("md5"));
		//检验用户名是否合法
		boolean nickNameIsValid = mainService.nickNameIsValid(user.getuNickname());
		if(nickNameIsValid) {
			//检验电话号码是否全是数字，并且是否合法
			boolean phoneIsNum = mainService.PhoneIsNum(user.getuPhone());
			if(phoneIsNum) {
				//检验电话号码是否唯一
				boolean phoneIsUnique = userService.phoneIsUnique(user.getuPhone());
				if(phoneIsUnique) {
					//检验登录密码是否符合要求
					boolean passIsValid = mainService.passIsValid(user.getuPassword());
					if(passIsValid) {
						//插入普通用户信息
						user.setuNickname(user.getuNickname());
						user.setuPassword((String)Md5.getMd5(user.getuPassword()).getExtend().get("md5"));
						user.setuRegisterDate(new Date());
						user.setuRId((byte)1);
						user.setuState((byte)1);
						boolean isSave = userService.saveUser(user);
						if(! isSave) {
							req.setAttribute("message", "系统错误，注册失败");
							return "register";
						}
					}else {
						req.setAttribute("message", "密码输入不合法");
						return "register";
					}
				}else {
					req.setAttribute("message", "该电话号码已被注册！");
					return "register";
				}
			}else {
				req.setAttribute("message", "电话号码不合法！");
				return "register";
			}
		}else {
			req.setAttribute("message", "输入昵称不合法");
			return "register";
		}
		System.out.println("注册成功");
		ra.addFlashAttribute("message", "注册成功");
		return "redirect:login";
	}
	
	/**
	 * 只处理get请求，作用是只返回商家注册界面
	 * @return
	 */
	@RequestMapping(value = "/bRegister", method = RequestMethod.GET)
	public String toBRegisterPage() {
		System.out.println("\nbRegister:GET******");
		return "bRegister";
	}
	
	/**
	 * 只处理post请求，用于普通用户注册
	 * @param mode
	 * @return
	 */
	@RequestMapping(value = "/bRegister", method = RequestMethod.POST)
	@ResponseBody
	public Msg bRegister(User user, Shop shop, HttpServletRequest req) {
		System.out.println("\nBRegister:POST******");
		System.out.println(user);
		System.out.println(shop);
		String addrDetail = req.getParameter("addrDetail");
		System.out.println(addrDetail);
		Msg msg = Msg.fail();
		System.out.println("密码md5："+(String)Md5.getMd5(user.getuPassword()).getExtend().get("md5"));
		//检验电话号码是否唯一
		boolean phoneIsUnique = userService.phoneIsUnique(user.getuPhone());
		if(phoneIsUnique) {
			//其他检验....
			//插入店铺用户信息
			user.setuPassword((String)Md5.getMd5(user.getuPassword()).getExtend().get("md5"));
			user.setuRegisterDate(new Date());
			user.setuRId((byte)2); //店家
			user.setuState((byte)0); //冻结
			int  uId = userService.saveUserReturnUId(user);
			if(uId == 0) {
				msg.setMsg("系统 错误，提交失败");
				return msg;
			}else {
				shop.setsAddress(shop.getsAddress()+"/"+addrDetail);
				shop.setsState((byte)0); //冻结
				shop.setsUId(uId);
				int sId = shopService.saveShopReturnSId(shop);
				if(sId == 0) {
					msg.setMsg("系统异常，请重试");
					return msg;
				}
			}
		}else {
			msg.setMsg("该电话号码已被注册！");
			return msg;
		}
		
		msg.setCode(Msg.SUCCESS);
		msg.setMsg("提交成功，请耐心等待审核~");
		return msg;
	}
}
