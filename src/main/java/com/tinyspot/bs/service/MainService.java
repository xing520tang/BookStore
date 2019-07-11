package com.tinyspot.bs.service;

import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tinyspot.bs.bean.Role;
import com.tinyspot.bs.bean.User;

@Service
public class MainService {
	@Autowired
	UserService userService;
	
	/**
	 * 根据session中存储的手机号和密码
	 * 得到用户的身份
	 * @param session
	 * @return Role
	 */
	public Role getRole(HttpSession session) {
		System.out.println("MainService->getRole*******");
		Role role = new Role();
		String uPhone = (String)session.getAttribute("uPhone");
		String uPassword = (String)session.getAttribute("uPassword");
		Boolean isLLogin = (Boolean)session.getAttribute("isLLogin");
		System.out.println("isLLogin:" + isLLogin);
		System.out.println("uPhone:"+uPhone);
		System.out.println("uPassword:" + uPassword);
		if(isLLogin!=null && isLLogin) {
			User user = userService.verify(uPhone, uPassword);
			System.out.println("user: "+user);
			if(user != null) {	//验证成功
				switch (user.getuRId()) {
					case 1: role.addIdentity(Role.ORDINARY);break;
					case 2: role.addIdentity(Role.BUSINESS);break;
					case 3: role.addIdentity(Role.SUPER_ADMIN);break;
					default:break;
				}
			}
		}
		
		//打印一下角色信息
		System.out.println(role);
		return role;
	}

	/**
	 * 注册时判断用户的电话是不是全都是数字,是不是符合电话的要求
	 * @param getuPhone
	 * @return
	 */
	public boolean PhoneIsNum(String phone) {
		if(phone.length() != 11)
			return false;
		if(phone==null || phone.equals(""))
			return false;
		Pattern pattern = Pattern.compile("^1[34578]\\d{9}$");//判断电话的正则表达式
		Matcher isPhoneNum = pattern.matcher(phone);
		if(isPhoneNum.matches())
			return true;
		return false;
	}

	/**
	 * 注册时判断用户密码是否符合要求
	 * @param getuPhone
	 * @return
	 */
	public boolean passIsValid(String password) {
		if(password==null || password.equals(""))
			return false;
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9_]+$");
		Matcher isValidMatcher = pattern.matcher(password);
		if(isValidMatcher.matches())
			return true;
		return false;
	}
	
	/**
	 * 注册时判断用户昵称是否符合要求
	 * @param getuPhone
	 * @return
	 */
	public boolean nickNameIsValid(String name) {
		if(name==null || name.equals(""))
			return true;
		if(name.length() > 20)
			return false;
		Pattern pattern = Pattern.compile("^[A-Za-z_\\u4e00-\\u9fa5]+$");
		Matcher isValidMatcher = pattern.matcher(name);
		if(isValidMatcher.matches())
			return true;
		return false;
	}
}
